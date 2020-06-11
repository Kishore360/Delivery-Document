-- Raised issue ITSM-3989 to handle the exception scenario -- coalesce(SRC.closed_at,SRC.sys_updated_on)

SELECT  CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_task.closed_on' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.task_final WHERE CDCTYPE<>'D') SRC
LEFT JOIN #DWH_TABLE_SCHEMA.d_task TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM on(LM.src_key=TRGT.state_src_key)
WHERE CASE WHEN task_type_src_code in ('incident','problem','problem_task','change_task','change_request','sc_request','sc_req_item','sc_task')
then case when LM.dimension_wh_code='CLOSED'  THEN convert_tz(SRC.closed_at,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') else 0 end
ELSE convert_tz(SRC.closed_at,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') END<> coalesce(TRGT.closed_on,'0')