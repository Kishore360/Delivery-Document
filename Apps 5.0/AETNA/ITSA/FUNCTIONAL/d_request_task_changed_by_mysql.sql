SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_request_task.changed_by' ELSE 'SUCCESS' END as Message
FROM (
SELECT count(1) as CNT
FROM aetna_mdsdb.sc_task_final SRC 
LEFT JOIN aetna_mdwdb.d_request_task TRGT 
ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id  )
WHERE TRGT.soft_deleted_flag='N'
AND COALESCE( SRC.sys_updated_by,'')<> COALESCE(TRGT.changed_by)
)temp;
 
