select 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_incident.application_key' ELSE 'SUCCESS' END as Message  
FROM 
(
Select Count(1) as CNT
FROM jhi_mdsdb.incident_final a 
LEFT JOIN jhi_mdwdb.f_incident b ON a.sys_id=b.row_id AND a.sourceinstance=b.source_id
LEFT JOIN jhi_mdwdb.d_application c ON CONCAT('APPLICATION~',a.cmdb_ci)=c.row_id AND a.sourceinstance=c.source_id
WHERE COALESCE(c.row_key, CASE WHEN a.cmdb_ci IS NULL THEN 0 ELSE -1 END)<>b.application_key
AND a.cdctype='X'
) temp;


