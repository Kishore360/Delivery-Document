SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_problem_task.application_key' ELSE 'SUCCESS' END as Message 
FROM rogers_mdsdb.u_pm_action_items_final  SRC
JOIN rogers_mdwdb.d_problem_task TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )
WHERE char_length(SRC.u_resolution)=1000 and SRC.u_resolution <>TRGT.u_resolution_c
