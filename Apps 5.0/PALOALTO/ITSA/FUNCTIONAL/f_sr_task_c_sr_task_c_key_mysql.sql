
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_sr_task_c.service_request_c_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
FROM  pan_mdsdb.u_stask_final SRC 
LEFT JOIN    pan_mdwdb.f_sr_task_c TRGT 
ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id )
LEFT JOIN pan_mdwdb.d_sr_task_c LKP ON (COALESCE(SRC.sys_id,'UNSPECIFIED')=LKP.row_id
AND SRC.sourceinstance= LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_id IS NULL THEN 0 else -1 end)<> (TRGT.sr_task_c_key))temp;

