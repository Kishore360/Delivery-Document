SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for d_problem.u_rca_summary_c' ELSE 'SUCCESS' END as Message FROM rogersdev_mdsdb.problem_task_final 
 SRC JOIN rogersdev_mdwdb.d_problem_task TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
WHERE convert_tz(SRC.work_start,'GMT','America/New_York') <> (TRGT.start_on_c) 
