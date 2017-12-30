 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_task_approval_c.changed_on
' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.sysapproval_approver_final SRC 
LEFT JOIN qualcomm_mdsdb.task_final task 
                ON SRC.sysapproval = task.sys_id 
LEFT JOIN  qualcomm_mdwdb.d_task_approval_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE SRC.sys_updated_on <> TRGT.changed_on
 ;