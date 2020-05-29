
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task.application_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.task_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_task TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_application LKP 
	ON ( CONCAT('APPLICATION~',CMDB_CI) = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cmdb_ci IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.application_key ,'')
