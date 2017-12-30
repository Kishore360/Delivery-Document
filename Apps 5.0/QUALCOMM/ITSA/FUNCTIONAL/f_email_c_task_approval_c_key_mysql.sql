

		SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_email_c.task_approval_c_key

' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.sys_email_final SRC 
LEFT JOIN qualcomm_mdwdb.f_email_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
   join qualcomm_mdwdb.d_task_approval_c LKP 
	on                SRC.instance=LKP.row_id and SRC.sourceinstance=LKP.source_id and SRC.target_table = 'sysapproval_approver'

 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.instance IS NULL THEN 0 else -1 end) = (TRGT.task_approval_c_key);
