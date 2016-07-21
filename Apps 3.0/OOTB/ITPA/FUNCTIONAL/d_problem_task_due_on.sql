

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem_task.due_on' ELSE 'SUCCESS' END as Message
  FROM <<tenant>>_mdsdb.problem_task_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_problem_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

 WHERE convert_tz(SRC.due_date,'GMT','America/Los_Angeles') <> TRGT.due_on 