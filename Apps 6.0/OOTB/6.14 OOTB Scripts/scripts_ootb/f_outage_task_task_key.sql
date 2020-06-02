SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_outage_task.task_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.task_outage_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_outage_task TRGT 
 ON SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_task LKP 
 ON SRC.task = LKP.row_id 
 AND SRC.sourceinstance = LKP.source_id 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.task IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.task_key ,'');