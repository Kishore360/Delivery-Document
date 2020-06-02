SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'data validation failed for f_incident_activity.primary_duration'  ELSE 'SUCCESS' END as Message
FROM (
SELECT TRGT.row_id, TRGT.row_key, TRGT.demand_key, TRGT.task_attribute_wh_name, demand_status.dimension_wh_code demand_status, demand_project_status.dimension_wh_code demand_project_status,
TRGT.primary_sequence_id, d_dem.created_on dem_created_on, TRGT.created_on curr_created_on, TRGT_NXT.created_on nxt_created_on, dat.lastupdated,
d_dem.demand_conversion_date, d_dem.demand_fulfillment_date,

case when (coalesce(case when TRGT_NXT.created_on is null and TRGT.task_attribute_wh_name = 'STATUS' and demand_status.dimension_wh_code = 'CONVERTED' then timestampdiff(SECOND, convert_tz(TRGT.created_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),coalesce(convert_tz(d_dem.demand_conversion_date,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),convert_tz(dat.lastupdated,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>')))
when TRGT_NXT.created_on is null and TRGT.task_attribute_wh_name = 'PROJECT_STATUS' and demand_project_status.dimension_wh_code = 'CLOSED' then timestampdiff(SECOND, convert_tz(TRGT.created_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),coalesce(convert_tz(d_dem.demand_fulfillment_date,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),convert_tz(dat.lastupdated,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>')))
when TRGT_NXT.created_on is null and TRGT.task_attribute_wh_name in ('STATUS', 'PROJECT_STATUS') and (demand_status.dimension_wh_code <> 'CONVERTED' or demand_project_status.dimension_wh_code <> 'CLOSED')
then timestampdiff(SECOND, convert_tz(TRGT.created_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'), convert_tz(dat.lastupdated,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'))
else timestampdiff(SECOND,convert_tz(TRGT.created_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),convert_tz(TRGT_NXT.created_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'))
end, 0))<0 then 0 else (coalesce(case when TRGT_NXT.created_on is null and TRGT.task_attribute_wh_name = 'STATUS' and demand_status.dimension_wh_code = 'CONVERTED' then timestampdiff(SECOND, convert_tz(TRGT.created_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),coalesce(convert_tz(d_dem.demand_conversion_date,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),convert_tz(dat.lastupdated,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>')))
when TRGT_NXT.created_on is null and TRGT.task_attribute_wh_name = 'PROJECT_STATUS' and demand_project_status.dimension_wh_code = 'CLOSED' then timestampdiff(SECOND, convert_tz(TRGT.created_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),coalesce(convert_tz(d_dem.demand_fulfillment_date,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),convert_tz(dat.lastupdated,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>')))
when TRGT_NXT.created_on is null and TRGT.task_attribute_wh_name in ('STATUS', 'PROJECT_STATUS') and (demand_status.dimension_wh_code <> 'CONVERTED' or demand_project_status.dimension_wh_code <> 'CLOSED')
then timestampdiff(SECOND, convert_tz(TRGT.created_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'), convert_tz(dat.lastupdated,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'))
else timestampdiff(SECOND,convert_tz(TRGT.created_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),convert_tz(TRGT_NXT.created_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'))
end, 0))end sr,
coalesce(TRGT.primary_duration,-99) tg

from #DWH_TABLE_SCHEMA.f_demand_activity TRGT
left join #DWH_TABLE_SCHEMA.f_demand_activity TRGT_NXT
on TRGT.demand_key=TRGT_NXT.demand_key and TRGT.source_id = TRGT_NXT.source_id and TRGT.task_attribute_wh_name=TRGT_NXT.task_attribute_wh_name and TRGT.primary_sequence_id+1=TRGT_NXT.primary_sequence_id
left join #DWH_TABLE_SCHEMA.d_demand d_dem
on d_dem.row_key=TRGT.demand_key
left join #DWH_TABLE_SCHEMA.d_lov_map demand_status
on d_dem.demand_status_src_key=demand_status.src_key
left join #DWH_TABLE_SCHEMA.d_lov_map demand_project_status
on d_dem.demand_project_status_src_key=demand_project_status.src_key and d_dem.soft_deleted_flag='N'
join (select max(lastupdated) as lastupdated,source_id from #DWH_TABLE_SCHEMA.d_o_data_freshness group by source_id) dat
on TRGT.source_id=dat.source_id
where case when (coalesce(case when TRGT_NXT.created_on is null and TRGT.task_attribute_wh_name = 'STATUS' and demand_status.dimension_wh_code = 'CONVERTED' then timestampdiff(SECOND, convert_tz(TRGT.created_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),coalesce(convert_tz(d_dem.demand_conversion_date,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),convert_tz(dat.lastupdated,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>')))
when TRGT_NXT.created_on is null and TRGT.task_attribute_wh_name = 'PROJECT_STATUS' and demand_project_status.dimension_wh_code = 'CLOSED' then timestampdiff(SECOND, convert_tz(TRGT.created_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),coalesce(convert_tz(d_dem.demand_fulfillment_date,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),convert_tz(dat.lastupdated,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>')))
when TRGT_NXT.created_on is null and TRGT.task_attribute_wh_name in ('STATUS', 'PROJECT_STATUS') and (demand_status.dimension_wh_code <> 'CONVERTED' or demand_project_status.dimension_wh_code <> 'CLOSED')
then timestampdiff(SECOND, convert_tz(TRGT.created_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'), convert_tz(dat.lastupdated,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'))
else timestampdiff(SECOND,convert_tz(TRGT.created_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),convert_tz(TRGT_NXT.created_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'))
end, 0))<0 then 0 else (coalesce(case when TRGT_NXT.created_on is null and TRGT.task_attribute_wh_name = 'STATUS' and demand_status.dimension_wh_code = 'CONVERTED' then timestampdiff(SECOND, convert_tz(TRGT.created_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),coalesce(convert_tz(d_dem.demand_conversion_date,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),convert_tz(dat.lastupdated,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>')))
when TRGT_NXT.created_on is null and TRGT.task_attribute_wh_name = 'PROJECT_STATUS' and demand_project_status.dimension_wh_code = 'CLOSED' then timestampdiff(SECOND, convert_tz(TRGT.created_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),coalesce(convert_tz(d_dem.demand_fulfillment_date,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),convert_tz(dat.lastupdated,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>')))
when TRGT_NXT.created_on is null and TRGT.task_attribute_wh_name in ('STATUS', 'PROJECT_STATUS') and (demand_status.dimension_wh_code <> 'CONVERTED' or demand_project_status.dimension_wh_code <> 'CLOSED')
then timestampdiff(SECOND, convert_tz(TRGT.created_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'), convert_tz(dat.lastupdated,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'))
else timestampdiff(SECOND,convert_tz(TRGT.created_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),convert_tz(TRGT_NXT.created_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'))
end, 0))end <> coalesce(TRGT.primary_duration,-99))a;