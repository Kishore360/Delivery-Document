SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_incident.met_sla_flag' ELSE 'SUCCESS' END as Message
FROM 
(
Select count(1) as cnt  FROM  
(Select a.sys_id,a.sourceinstance,
CASE  WHEN SUM(b.has_breached) > 0 THEN 'N' ELSE 'Y'END as Source_Met_sla_Flag
FROM png_mdsdb.incident_final a 
LEFT JOIN png_mdsdb.task_sla_final b ON a.sys_id=b.task AND a.sourceinstance=b.sourceinstance
Where b.stage <>'cancelled' Group by 1,2) SRC 
LEFT JOIN png_mdwdb.d_incident TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id 
WHERE SRC.Source_Met_sla_Flag<>TRGT.met_sla_flag
 ) temp;
 
 
 
 
 
 
 