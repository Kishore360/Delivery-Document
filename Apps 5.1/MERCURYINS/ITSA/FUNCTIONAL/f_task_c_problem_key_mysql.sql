SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM mercuryins_mdsdb.task_final SRC
join  mercuryins_mdsdb.sys_user_final sys_user ON SRC.opened_by = sys_user.sys_id
JOIN mercuryins_mdwdb.f_task_c TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )
join mercuryins_mdwdb.d_problem LKP
on SRC.sys_id=LKP.row_id
WHERE coalesce(LKP.row_key,case when SRC.sys_id is null then  0 else -1 end )<> TRGT.problem_key
