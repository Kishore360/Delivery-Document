

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.resolve_to_close_duration' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.problem_task_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_problem_task TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
 WHERE COALESCE( CONVERT(null using utf8),'')<> COALESCE(CONVERT(TRGT.resolve_to_close_duration using utf8),'')
