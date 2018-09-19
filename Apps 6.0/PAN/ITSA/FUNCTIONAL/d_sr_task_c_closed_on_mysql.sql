

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for closed_on' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
FROM pan6_mdsdb.u_stask_final  SRC 
LEFT JOIN pan6_mdwdb.d_sr_task_c TRGT 
ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id )
WHERE CONVERT_TZ(SRC.closed_at,'GMT','America/Los_Angeles')<> TRGT.closed_on)temp;