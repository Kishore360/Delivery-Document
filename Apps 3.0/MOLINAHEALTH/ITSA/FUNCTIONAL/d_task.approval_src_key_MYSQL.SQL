SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_task.approval_src_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM molinahealth_mdsdb.task_final SRC 
LEFT JOIN molinahealth_mdwdb.d_task TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
LEFT JOIN molinahealth_mdwdb.d_lov LKP ON (CONCAT('APPROVAL~TASK~~~',SRC.approval)=LKP.row_id AND SRC.sourceinstance=LKP.row_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.approval IS NULL THEN 0 ELSE -1 END)<>TRGT.approval_src_key
) temp;



 