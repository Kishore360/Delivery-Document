 
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_incident.reported_time_c' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) AS CNT 
FROM equifax_mdsdb.incident_final SRC 
LEFT JOIN equifax_mdwdb.d_incident TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE CONVERT_TZ(SRC.u_reported_time,'<<TENANT_SSI_TIME_ZONE>>','America/New_York')<>TRGT.reported_time_c
) temp;