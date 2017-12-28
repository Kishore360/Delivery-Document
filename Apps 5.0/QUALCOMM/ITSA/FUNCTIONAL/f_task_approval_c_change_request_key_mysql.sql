SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task_approval_c.change_request_key

' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.sysapproval_approver_final SRC 
LEFT JOIN qualcomm_mdwdb.f_task_approval_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  left join qualcomm_mdwdb.d_change_request LKP 
	on COALESCE(SRC.sysapproval ,'UNSPECIFIED')=LKP.row_id and SRC.sourceinstance=LKP.source_id

 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sysapproval IS NULL THEN 0 else -1 end) <> (TRGT.change_request_key


);
