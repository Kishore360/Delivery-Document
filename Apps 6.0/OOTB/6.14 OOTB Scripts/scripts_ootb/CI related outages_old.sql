select 
CI.class Cls,
COALESCE(CI.ci_type, '') CI_Type,
COALESCE(CI.category, '') CI_Category,
COALESCE(CI.subcategory, '') CI_Subcategory, 
CI.name Name, 
COALESCE(CI.vendor, '') CI_Vendor,
COALESCE(CI.manufacturer, '') CI_Manufacturer, 
--'' as Metrics,
sum(case when F.outage_key is not null then 1 else 0 end) Outages
from #DWH_TABLE_SCHEMA.f_outage F
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on F.start_on_key = CAL.row_key
left join #DWH_TABLE_SCHEMA.d_outage D
on F.outage_key = D.row_key
left join #DWH_TABLE_SCHEMA.f_incident INC
on INC.incident_key = F.incident_key
left join #DWH_TABLE_SCHEMA.d_configuration_item CI
on F.configuration_item_key = CI.row_key
left join #DWH_TABLE_SCHEMA.d_incident D_INC
on D_INC.row_key = F.incident_key
where F.row_key not in (0, -1)
and F.soft_deleted_flag = 'N'
and CAL.lagging_count_of_month < 13
group by CI.class, CI_Type, CI.category, CI.subcategory,
CI.name, CI.vendor, CI.manufacturer
order by lower(CI.class), lower(CI_Type), lower(CI.category), lower(CI.subcategory),
lower(CI.name), lower(CI.vendor), lower(CI.manufacturer)