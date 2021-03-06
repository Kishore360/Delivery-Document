SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_problem_task.application_key' ELSE 'SUCCESS' END as Message 
FROM rogers_mdsdb.u_pm_action_items_final  SRC
JOIN rogers_mdwdb.f_problem_task TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )
join rogers_mdwdb.d_lov LKP
on COALESCE(CONCAT('STATE','~','problem_task','~','~','~',UPPER(SRC.u_status)),'UNSPECIFIED')= LKP.row_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_status IS NULL THEN 0 else -1 end)<>TRGT.state_src_key
and SRC.CDCTYPE='X' and LKP.soft_deleted_flag='N'


