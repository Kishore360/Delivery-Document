SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_problem_task.application_key' ELSE 'SUCCESS' END as Message 
FROM rogersdev_mdsdb.u_pm_action_items_final  SRC 
JOIN rogersdev_mdwdb.f_problem_task TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN rogersdev_mdwdb.d_internal_contact LKP 
ON (case when SRC.u_assigned_to is null then 'UNSPECIFIED' else concat('INTERNAL_CONTACT~',SRC.u_assigned_to) end = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_assigned_to IS NULL THEN 0 else -1 end)<> (TRGT.assigned_to_key) 

