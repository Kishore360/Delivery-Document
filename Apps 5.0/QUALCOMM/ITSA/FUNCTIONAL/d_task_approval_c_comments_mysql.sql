
		SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_task_approval_c.comments' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.sysapproval_approver_final SRC 
 LEFT JOIN qualcomm_mdwdb.d_task_approval_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE SRC.comments  <> TRGT.comments;