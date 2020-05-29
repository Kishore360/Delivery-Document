SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem_task.application_key' ELSE 'SUCCESS' END as Message 
  FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.problem_task_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_problem_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id ) 
 left join #DWH_TABLE_SCHEMA.d_application ci
 on ci.row_id = CONCAT('APPLICATION~',cmdb_ci)
 WHERE coalesce (ci.row_key, case when SRC.cmdb_ci is null then 0 else -1 end ,'')<> COALESCE(TRGT.application_key,'');