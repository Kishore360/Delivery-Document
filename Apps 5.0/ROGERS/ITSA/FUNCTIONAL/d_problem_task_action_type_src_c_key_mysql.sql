SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_problem_task.application_key' ELSE 'SUCCESS' END as Message 
FROM rogers_mdsdb.u_pm_action_items_final  SRC
JOIN rogers_mdwdb.d_problem_task TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )
join rogers_mdwdb.d_lov LKP
on COALESCE(CONCAT('ACTION_TYPE~PROBLEM_TASK~~~',UPPER(SRC.u_action_type)),'UNSPECIFIED')=LKP.row_id
WHERE coalesce(LKP.row_key,case when SRC.u_action_type is null then 0 else -1 end )<>TRGT.action_type_src_c_key
and SRC.CDCTYPE='X' and LKP.soft_deleted_flag='N'

