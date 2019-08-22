SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_problem_task.application_key' ELSE 'SUCCESS' END as Message 
FROM rogers_mdsdb.u_pm_action_items_final  SRC 
JOIN rogers_mdwdb.f_problem_task TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN rogers_mdwdb.d_internal_organization LKP 
ON (COALESCE(CONCAT('GROUP~',SRC.u_assignment_group),'UNSPECIFIED') = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_assignment_group IS NULL THEN 0 else -1 end)<> (TRGT.assignment_group_key) 
and SRC.CDCTYPE='X'


