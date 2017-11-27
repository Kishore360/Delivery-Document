SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task_approval_c.task_approval_group_c_key' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.sysapproval_approver_final SRC 
LEFT JOIN qualcomm_mdsdb.task_final task 
                ON SRC.sysapproval = task.sys_id 

LEFT JOIN qualcomm_mdwdb.f_task_approval_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  left join qualcomm_mdwdb.d_task_approval_group_c LKP 
	on COALESCE( SRC.group,'UNSPECIFIED') =LKP.row_id and SRC.sourceinstance=LKP.source_id

 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.group IS NULL THEN 0 else -1 end)   <> (TRGT.task_approval_group_c_key




);
