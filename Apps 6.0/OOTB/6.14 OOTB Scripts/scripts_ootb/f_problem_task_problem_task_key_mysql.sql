SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_problem_task.problem_task_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
FROM #MDS_TABLE_SCHEMA.problem_task_final SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_problem_task TRGT 
ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN #DWH_TABLE_SCHEMA.d_problem_task LKP 
ON ( SRC.sys_id= LKP.row_id AND SRC.sourceinstance= LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_id IS NULL THEN 0 else -1 end)<> (TRGT.problem_task_key))temp;
 
