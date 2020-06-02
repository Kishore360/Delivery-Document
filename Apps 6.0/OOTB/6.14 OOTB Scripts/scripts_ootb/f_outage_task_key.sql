  SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_outage_task.task_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_outage_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_outage TRGT 
 ON SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_task LKP
 ON SRC.task_number = LKP.row_id 
 AND SRC.sourceinstance = LKP.source_id 
LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.task_final WHERE CDCTYPE<>'D') TASK
on SRC.sys_id = TASK.sys_id
WHERE COALESCE(LKP.row_key, CASE when SRC.task_number IS NOT NULL and coalesce(upper(TASK.sys_class_name),'') <> 'TASK' then -1 
 WHEN SRC.task_number IS NULL THEN 0
 else '-1' end)<> COALESCE(TRGT.task_key ,'');