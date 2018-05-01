SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_task_sla.end_on_c' ELSE 'SUCCESS' END as  Message
FROM 
(SELECT count(1) as CNT 
FROM tjx_mdsdb.task_sla_final b 
JOIN tjx_mdwdb.f_task_sla trgt ON b.sys_id=trgt.row_id and b.sourceinstance=trgt.source_id
WHERE CONVERT_TZ(b.end_time,'GMT','America/New_York')<> trgt.end_on_c )temp;


	 
