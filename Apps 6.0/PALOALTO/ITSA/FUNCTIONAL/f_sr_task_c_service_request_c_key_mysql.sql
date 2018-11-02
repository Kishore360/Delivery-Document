
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_sr_task_c.service_request_c_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
FROM paloalto_mdsdb.u_stask_final SRC 
LEFT JOIN  paloalto_mdwdb.f_sr_task_c TRGT 
ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id )
LEFT JOIN paloalto_mdwdb.d_service_request_c LKP ON (COALESCE(SRC.parent,'UNSPECIFIED')=LKP.row_id
AND SRC.sourceinstance= LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.parent IS NULL THEN 0 else -1 end)<> (TRGT.service_request_c_key))temp;