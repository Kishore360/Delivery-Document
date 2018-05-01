SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_task_sla.duration' ELSE 'SUCCESS' END as  Message
FROM 
(
SELECT  COUNT(1) as CNT 
FROM tjx_mdsdb.contract_sla_final a 
JOIN tjx_mdwdb.d_task_sla b ON a.sys_id=b.row_id and a.sourceinstance=b.source_id
WHERE CASE WHEN a.duration is null  THEN NULL
	 WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',a.duration) < 0 THEN NULL
	  WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',a.duration) > 214748364 THEN NULL 
	  ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',a.duration) end <>b.sla_duration
)temp;