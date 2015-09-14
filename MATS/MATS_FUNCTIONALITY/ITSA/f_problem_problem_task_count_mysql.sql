


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.problem_task_count' ELSE 'SUCCESS' END as Message
 FROM 
 (SELECT SRC1.sys_id,SRC1.sourceinstance, case when SRC2.problem is null then 0 else count(SRC2.problem) end as problem_tasks_count
 FROM <<tenant>>_mdsdb.problem_final SRC1
 LEFT JOIN <<tenant>>_mdsdb.problem_task_final SRC2
 ON(SRC1.sys_id =SRC2.problem  
 AND SRC1.sourceinstance= SRC2.sourceinstance )
 group by SRC1.sys_id,SRC1.sourceinstance
 ) SRC
 LEFT JOIN <<tenant>>_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(  coalesce(SRC.problem_tasks_count,0),'')<> COALESCE(TRGT.problem_tasks_count ,'')
