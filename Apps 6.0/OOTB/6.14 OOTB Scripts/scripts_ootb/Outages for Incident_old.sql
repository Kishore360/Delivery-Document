select F.outage_key outage_key,
D.short_description Des,
D_INC.incident_number,
--'' as metrics,
sum(case when f.outage_key is not null then 1 else 0 end) outages,
sum(case when D.linked_to_incident_flag = 'Y' and f.outage_key is not null
then 1 else 0 end) Linked_to_incident,
sum(case when D.linked_to_incident_flag = 'N' and F.outage_key is not null then 1 else 0 end) 
as Outage_not_Linked_to_incident,
concat(trim(to_char(((sum(case when D.linked_to_incident_flag = 'Y' and F.outage_key is not null then 1 else 0 end)/
sum(case when f.outage_key is not null then 1 else 0 end))*100),'9999999990D9')),'%') Percentage_Linked_INC,
trim(to_char(COALESCE(sum(F.outage_duration::numeric(10,1))/3600, 0),'9999999990D9'  )) Downtime_in_hrs,
trim(to_char(COALESCE((sum(F.outage_duration::numeric(10,1))/3600)/sum(case when outage_key is not null then 1 else 0 end),0),'9999999990D9')) mean_time_to_rstr
from #DWH_TABLE_SCHEMA.f_outage F
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on F.start_on_key = CAL.row_key
left join #DWH_TABLE_SCHEMA.d_outage D
on F.outage_key = D.row_key
left join #DWH_TABLE_SCHEMA.f_incident INC
on INC.incident_key = F.incident_key
left join #DWH_TABLE_SCHEMA.d_incident D_INC
on D_INC.row_key = F.incident_key
where F.row_key not in (0, -1)
and F.soft_deleted_flag = 'N'
and CAL.lagging_count_of_month <13
group by outage_key, D.short_description, D_INC.incident_number
order by outage_key