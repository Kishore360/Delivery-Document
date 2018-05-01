


SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for incident_final.last_resolved_on_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT COUNT(1) as CNT 
FROM tjx_mdsdb.task_final a 
JOIN tjx_mdsdb.incident_final b ON a.sys_id=b.sys_id and a.sourceinstance=b.sourceinstance
JOIN tjx_mdwdb.d_task c ON a.sys_id=c.row_id and a.sourceinstance=c.source_id
WHERE CONVERT_TZ(COALESCE(b.resolved_at,a.closed_at),'GMT','America/New_York')<>c.last_resolved_on_c
)temp;


