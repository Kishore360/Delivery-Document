SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_incident.first_pass_reason_c_key' ELSE 'SUCCESS' END as  Message
FROM 
(select count(1) as CNT
FROM tjxco_mdsdb.task_sla_final src
left join tjxco_mdsdb.incident_final a on src.task=a.sys_id and src.sourceinstance=a.sourceinstance
left JOIN tjxco_mdwdb.d_incident b ON a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join tjxco_mdwdb.d_lov d on concat('FIRST_PASS_REASON~INCIDENT~', a.u_first_pass_reason_code)=d.row_id and a.sourceinstance=d.source_id
WHERE COALESCE(d.row_key,CASE WHEN a.u_first_pass_reason_code IS NULL THEN 0 ELSE -1 END)<>b.first_pass_reason_c_key)temp;