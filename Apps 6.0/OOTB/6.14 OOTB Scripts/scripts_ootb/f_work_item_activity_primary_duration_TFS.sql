SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.primary_duration' ELSE 'SUCCESS' END as Message
/*select TRGT.row_key, TRGT.row_id, TRGT.primary_sequence_id, TRGT.created_on, convert_tz(TRGT.started_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'), convert_tz(TRGT_NXT.started_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'), fresh.lstupdt,
timestampdiff(second, convert_tz(TRGT.started_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'), coalesce(convert_tz(TRGT_NXT.started_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),fresh.lstupdt)) calc,
 TRGT.primary_duration*/
 
from #DWH_TABLE_SCHEMA.f_work_item_activity TRGT
left join #DWH_TABLE_SCHEMA.f_work_item_activity TRGT_NXT
ON (TRGT.work_item_key =  TRGT_NXT.work_item_key and TRGT_NXT.task_attribute_wh_name = TRGT.task_attribute_wh_name and TRGT_NXT.primary_sequence_id = TRGT.primary_sequence_id + 1 and TRGT.source_id=TRGT_NXT.source_id)
left  join (
select source_id, max(convert_tz(lastupdated,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>')) lstupdt 
from #DWH_TABLE_SCHEMA.d_o_data_freshness
group by source_id
) fresh
on fresh.source_id = TRGT.source_id
where timestampdiff(second, convert_tz(TRGT.started_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'), coalesce(convert_tz(TRGT_NXT.started_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),fresh.lstupdt)) <> TRGT.primary_duration