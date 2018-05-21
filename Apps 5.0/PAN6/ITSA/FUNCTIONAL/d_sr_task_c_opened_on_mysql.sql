SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for opened_on' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
FROM pan_mdsdb.u_stask_final  SRC 
LEFT JOIN pan_mdwdb.d_sr_task_c TRGT 
ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id )
WHERE CONVERT_TZ(SRC.opened_at,'GMT','America/Los_Angeles')<> TRGT.opened_on)temp;