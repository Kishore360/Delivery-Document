select coalesce(APP.name, '') APP_NAME,
case when APP.tier_src_key not in (0,-1) then LOV2.dimension_name 
when APP.tier_src_key = 0 then 'NO TIER'
else LOV.dimension_name end APP_TIER,
coalesce(APP.version, '') APP_VER,
case when APP.used_for_src_key not in (0,-1) then LOV3.dimension_name 
when APP.used_for_src_key = 0 then 'UNSPECIFIED'
when APP.used_for_src_key = -1 then 'UNKNOWN'
else LOV.dimension_name end APP_USED_FOR,
--'' as Metrics,
sum(case when F.outage_key not in (0,-1) then 1 else 0 end) Outages,
sum(case when F.application_key not in (0,-1) and F.outage_key is not null then 1 else 0 end) Outage_for_Application,
sum(F.updates_count) Updates_count
from #DWH_TABLE_SCHEMA.f_outage F
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on F.start_on_key = CAL.row_key
left join #DWH_TABLE_SCHEMA.d_application APP
on F.application_key = APP.row_key
left join #DWH_TABLE_SCHEMA.d_outage D
on F.outage_key = D.row_key
left join #DWH_TABLE_SCHEMA.d_lov LOV
on LOV.row_key = F.application_key
and F.application_key in (0,-1)
left join #DWH_TABLE_SCHEMA.d_lov LOV2
on LOV2.row_key = APP.tier_src_key
and LOV2.dimension_class = 'TIER_WH~APPLICATION'
left join #DWH_TABLE_SCHEMA.d_lov LOV3
on LOV3.row_key = APP.used_for_src_key
and LOV3.dimension_class like '%USED_FOR%'
and LOV3.source_id = APP.source_id
where F.row_key not in (0, -1)
and F.soft_deleted_flag = 'N'
and CAL.lagging_count_of_month < 13
group by APP.name, APP_TIER, APP_USED_FOR, APP.version
order by upper(APP.name), APP_TIER, APP_USED_FOR, APP.version