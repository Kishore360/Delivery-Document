SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_task.closed_on' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.change_task_final WHERE CDCTYPE<>'D') SRC
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map L
 ON (SRC.state=L.dimension_code
 AND SRC.sourceinstance=L.source_id AND L.dimension_class = 'STATE~CHANGE_TASK' )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_change_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
WHERE case when L.dimension_wh_code='CLOSED' then convert_tz(COALESCE( SRC.closed_at,SRC.sys_updated_on),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') 
else '' end
 <> COALESCE(TRGT.closed_on,'')
