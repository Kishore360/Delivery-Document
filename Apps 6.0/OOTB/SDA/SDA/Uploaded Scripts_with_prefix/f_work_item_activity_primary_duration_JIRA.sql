SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.primary_duration' ELSE 'SUCCESS' END as Message

from (
select TRGT.row_key, br.dimension_wh_code, TRGT.primary_sequence_id, 
convert_tz(D.created_on,'<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>') D_created_on, convert_tz(dat.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>') lstupdt, convert_tz(TRGT.created_on, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>') TRGT_CRTD,
convert_tz(TRGT_NXT.created_on, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>') TRGT_NXT_CRTD, convert_tz(D.completed_on,'<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>') d_completed, convert_tz(D.cancelled_on,'<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>') d_cancelled,
convert_tz(D.resolved_on,'<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>') d_resolved,
timestampdiff(SECOND, convert_tz(D.created_on,'<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'), convert_tz(coalesce(TRGT_NXT.created_on, dat.lastupdated), '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')) a,
timestampdiff(SECOND, convert_tz(TRGT.created_on, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'), convert_tz(dat.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')) b,
timestampdiff(SECOND, convert_tz(TRGT.created_on, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'), convert_tz(TRGT_NXT.created_on, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')) c,
coalesce(
case when TRGT.primary_sequence_id = 0 then timestampdiff(SECOND, convert_tz(D.created_on,'<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'), convert_tz(coalesce(TRGT_NXT.created_on, dat.lastupdated), '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'))
when TRGT_NXT.work_item_key is null and br.dimension_wh_code in ('COMPLETED', 'CANCELLED') then 0
when TRGT_NXT.work_item_key is null then timestampdiff(SECOND, convert_tz(TRGT.created_on, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'), convert_tz(dat.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'))
else timestampdiff(SECOND, convert_tz(TRGT.created_on, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'), convert_tz(TRGT_NXT.created_on, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')) end
,0) expected,
TRGT.primary_duration actual
from #DWH_TABLE_SCHEMA.f_work_item_activity TRGT
left join #DWH_TABLE_SCHEMA.f_work_item_activity TRGT_NXT 
on TRGT.work_item_key = TRGT_NXT.work_item_key and TRGT.source_id = TRGT_NXT.source_id and TRGT.task_attribute_wh_name = TRGT_NXT.task_attribute_wh_name and TRGT.primary_sequence_id + 1 = TRGT_NXT.primary_sequence_id
left join #DWH_TABLE_SCHEMA.f_work_item F on F.work_item_key = TRGT.work_item_key and F.soft_deleted_flag = 'N'
JOIN #DWH_TABLE_SCHEMA.d_work_item D ON F.work_item_key = D.row_key and F.soft_deleted_flag = 'N'
LEFT JOIN (select * from #DWH_TABLE_SCHEMA.d_lov_map br where br.dimension_class = 'STATUS~WORK_ITEM') br ON F.work_item_status_src_key = br.src_key and F.source_id = br.source_id
JOIN (SELECT MAX(lastupdated) as lastupdated, source_id FROM #DWH_TABLE_SCHEMA.d_o_data_freshness group by source_id ) dat on TRGT.source_id = dat.source_id
where TRGT.task_attribute_wh_name = 'STATUS' and 
coalesce(
case when TRGT.primary_sequence_id = 0 then timestampdiff(SECOND, convert_tz(D.created_on,'<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'), convert_tz(coalesce(TRGT_NXT.created_on, dat.lastupdated), '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'))
when TRGT_NXT.work_item_key is null and br.dimension_wh_code in ('COMPLETED', 'CANCELLED') then 0
when TRGT_NXT.work_item_key is null then timestampdiff(SECOND, convert_tz(TRGT.created_on, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'), convert_tz(dat.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'))
else timestampdiff(SECOND, convert_tz(TRGT.created_on, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'), convert_tz(TRGT_NXT.created_on, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')) end
,0) <> coalesce(TRGT.primary_duration, -100)
) SQ;