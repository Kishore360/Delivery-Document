
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task_c.assignment_group_manager_key' ELSE 'SUCCESS' END as Message
FROM tjx_mdsdb.task_final SRC 
LEFT JOIN tjx_mdwdb.f_task_c TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  )
left join tjx_mdsdb.sys_user_group_final src_lkp
on  SRC.assignment_group = src_lkp.sys_id 
LEFT JOIN tjx_mdwdb.d_internal_organization LKP  
ON ( coalesce(concat('GROUP~',assignment_group),'UNSPECIFIED')= LKP.row_id AND SRC.sourceinstance= LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN src_lkp.manager IS NULL THEN 0 else -1 end)<> (TRGT.assignment_group_manager_key);