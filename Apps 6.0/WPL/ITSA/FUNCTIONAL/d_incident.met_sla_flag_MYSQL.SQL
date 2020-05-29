


 SELECT 
 CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.met_sla_flag' ELSE 'SUCCESS' END as Message
 FROM 
 (
 SELECT count(1) as CNT
FROM wpl_mdwdb.d_incident TRGT 
JOIN 
(
SELECT inc.sys_id,inc.sourceinstance,CASE WHEN SUM(tsla.has_breached) > 0 THEN 'N' ELSE 'Y'END as MET_SLA_Flag
FROM wpl_mdsdb.incident_final inc
inner join wpl_mdsdb.task_sla_final tsla ON (inc.sys_id=tsla.task AND inc.sourceinstance=tsla.sourceinstance)
Group by 1,2
) SRC 
ON (TRGT.row_id=SRC.sys_id AND TRGT.source_id=SRC.sourceinstance)
WHERE SRC.MET_SLA_Flag<>TRGT.met_sla_flag
 ) temp;
 
