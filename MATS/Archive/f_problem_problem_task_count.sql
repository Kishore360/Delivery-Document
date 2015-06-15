


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.problem_task_count' ELSE 'SUCCESS' END as Message
 FROM 
 (SELECT SRC1.sys_id,SRC1.sourceinstance, case when SRC2.problem is null then 0 else count(SRC2.problem) end as problem_tasks_count
 FROM #MDS_TABLE_SCHEMA.problem_final SRC1
 LEFT JOIN #MDS_TABLE_SCHEMA.problem_task_final SRC2
 ON(convert(SRC1.sys_id using utf8) =convert(SRC2.problem using utf8) 
 AND convert(SRC1.sourceinstance using utf8)= convert(SRC2.sourceinstance using utf8))
 group by SRC1.sys_id,SRC1.sourceinstance
 ) SRC
 LEFT JOIN #DWH_TABLE_SCHEMA.f_problem TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
 WHERE COALESCE( CONVERT( coalesce(SRC.problem_tasks_count,0) using utf8),'')<> COALESCE(CONVERT(TRGT.problem_tasks_count using utf8),'')
