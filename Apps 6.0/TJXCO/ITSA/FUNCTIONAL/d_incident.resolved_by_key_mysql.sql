SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_incident.resolved_by_key' ELSE 'SUCCESS' END as  Message
FROM 
(select count(1) as CNT
FROM tjxco_mdsdb.task_sla_final src
left join tjxco_mdsdb.incident_final a on src.task=a.sys_id and src.sourceinstance=a.sourceinstance
left JOIN tjxco_mdwdb.d_incident b ON a.sys_id=b.row_id and a.sourceinstance=b.source_id
left JOIN tjxco_mdwdb.d_internal_contact c on concat('INTERNAL_CONTACT~', a.resolved_by)=c.row_id and a.sourceinstance=c.source_id 
WHERE COALESCE(c.row_key,CASE WHEN a.resolved_by IS NULL THEN 0 ELSE -1 END)<>b.resolved_by_key)temp;