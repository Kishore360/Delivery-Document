SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem_task.start_on_c' ELSE 'SUCCESS' END as Message 
FROM rogers6_mdsdb.u_pm_action_items_final  SRC 
JOIN rogers6_mdwdb.d_problem_task TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
WHERE (SRC.u_start_date)<> (TRGT.start_on_c) 
and SRC.CDCTYPE='X' ;