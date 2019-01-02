SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_task_sla.incident_key' ELSE 'SUCCESS' END as  Message
FROM 
(SELECT count(1) as CNT 
FROM tjxco_mdsdb.task_sla_final src
join tjxco_mdsdb.incident_final a on src.task=a.sys_id and src.sourceinstance=a.sourceinstance
JOIN tjxco_mdwdb.f_task_sla b ON src.sys_id=b.row_id and src.sourceinstance=b.row_id
JOIN tjxco_mdwdb.d_incident c on a.sys_id=c.row_id and a.sourceinstance=c.source_id 
WHERE COALESCE(c.row_key,CASE WHEN a.sys_id IS NULL THEN 0 ELSE -1 END)<>b.incident_key)temp;