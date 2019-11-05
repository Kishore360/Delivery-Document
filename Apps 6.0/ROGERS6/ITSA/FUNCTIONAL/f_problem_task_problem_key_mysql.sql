SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_problem_task.application_key' ELSE 'SUCCESS' END as Message 
FROM rogers6_mdsdb.u_pm_action_items_final  SRC
JOIN rogers6_mdwdb.f_problem_task TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )
join rogers6_mdwdb.d_problem LKP
on SRC.u_pm_number= LKP.row_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_pm_number IS NULL THEN 0 else -1 end)<>TRGT.problem_key
AND SRC.CDCTYPE='X' and LKP.soft_deleted_flag='N'

