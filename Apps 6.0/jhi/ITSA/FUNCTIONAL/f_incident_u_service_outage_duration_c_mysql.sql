SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for f_incident.u_service_outage_duration_c' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT 
FROM jhi_mdsdb.incident_final  SRC 
LEFT JOIN jhi_mdwdb.f_incident TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  
WHERE  TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.u_service_outage_duration) <> (TRGT.u_service_outage_duration_c) 
AND SRC.cdctype='X'
) temp;
