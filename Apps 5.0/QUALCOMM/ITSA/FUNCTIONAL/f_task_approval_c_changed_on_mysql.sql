SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_task_approval_c.changed_on' ELSE 'SUCCESS' END as Message
FROM(SELECT Count(1) AS CNT 
FROM qualcomm_mdsdb.sysapproval_approver_final SRC 
LEFT JOIN qualcomm_mdsdb.task_final task  ON SRC.sysapproval = task.sys_id 
LEFT JOIN  qualcomm_mdwdb.d_task_approval_c TRGT ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id  )
WHERE 
CONVERT_TZ(SRC.sys_updated_on,'GMT','GMT') <> TRGT.changed_on
) temp
 ;