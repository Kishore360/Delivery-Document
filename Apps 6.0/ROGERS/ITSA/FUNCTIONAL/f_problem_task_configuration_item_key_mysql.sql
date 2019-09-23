SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_problem_task.application_key' ELSE 'SUCCESS' END as Message 
FROM rogers6_mdsdb.u_pm_action_items_final  SRC 
left join rogers6_mdsdb.problem_final SRC1
on SRC.u_pm_number=SRC1.sys_id
JOIN rogers6_mdwdb.f_problem_task TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN rogers6_mdwdb.d_configuration_item LKP 
ON (COALESCE(SRC1.cmdb_ci,'UNSPECIFIED') = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id ) 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC1.cmdb_ci IS NULL THEN 0 else -1 end)<> (TRGT.configuration_item_key) 
and SRC.CDCTYPE='X' and SRC1.CDCTYPE='X' and LKP.soft_deleted_flag='N'



