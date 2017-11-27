 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task_approval_c.approved_rejected_date' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.sysapproval_approver_final SRC 
LEFT JOIN qualcomm_mdsdb.task_final task 
                ON SRC.sysapproval = task.sys_id 
LEFT JOIN  qualcomm_mdwdb.d_task_approval_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE SRC.u_approved_rejected <> TRGT.approved_rejected_date ;