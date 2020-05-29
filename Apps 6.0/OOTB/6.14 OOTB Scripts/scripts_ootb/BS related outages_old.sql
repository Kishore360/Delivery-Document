select coalesce(SVC.name, '') SVC_NAME,
case when SVC.criticality is not null then SVC.criticality else LOV.dimension_name end SVC_CRITICALITY,
case when SVC.used_for_src_key not in (0,-1) then LOV3.dimension_name
else LOV.dimension_name end SVC_USED_FOR,
coalesce(SVC.version, '') SVC_VER,
--'' as Metrics,
SUM(case when wh_lov.dimension_code = 'CRITICAL' THEN 1 ELSE 0 end) Outages_Affecting_Critical_BS,
sum(case when F.business_service_key not in (0,-1) and F.outage_key is not null then 1 else 0 end) Outage_for_BS,
trim(to_char(COALESCE(sum(F.outage_duration::numeric(10,1))/3600, 0),'9999999990D9')) Downtime_in_hrs
from #DWH_TABLE_SCHEMA.f_outage F
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on F.start_on_key = CAL.row_key
left join #DWH_TABLE_SCHEMA.d_service SVC
on F.business_service_key = SVC.row_key
left join #DWH_TABLE_SCHEMA.d_outage D
on F.outage_key = D.row_key
left join #DWH_TABLE_SCHEMA.d_lov LOV
on LOV.row_key = SVC.criticality_key
left join #DWH_TABLE_SCHEMA.d_lov_map LOVMAP
on LOV.row_key = LOVMAP.src_key
and LOV.dimension_class = 'CRITICALITY~business_service'
left JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov 
ON wh_lov.row_key = LOVMAP.wh_key
left join #DWH_TABLE_SCHEMA.d_lov LOV3
on LOV3.row_key = SVC.used_for_src_key
and LOV3.dimension_class = 'USED_FOR'
and LOV3.source_id = SVC.source_id
left join #DWH_TABLE_SCHEMA.d_lov LOV4
on LOV4.row_key = D.outage_type_src_key
and LOV4.dimension_class = 'TYPE~OUTAGE'
and LOV4.source_id = D.source_id
where F.row_key not in (0, -1)
and F.soft_deleted_flag = 'N'
and CAL.lagging_count_of_month < 13
group by SVC.name, SVC_CRITICALITY, SVC_USED_FOR, SVC_VER
order by upper(SVC.name), SVC_CRITICALITY, SVC_USED_FOR, SVC_VER