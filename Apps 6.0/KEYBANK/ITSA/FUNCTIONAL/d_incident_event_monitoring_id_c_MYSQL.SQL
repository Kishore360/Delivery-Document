SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_incident.event_monitoring_id_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM keybank_mdsdb.incident_final SRC 
LEFT JOIN keybank_mdwdb.d_incident TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(SRC.u_event_monitoring_id,'UNSPECIFIED')<>TRGT.event_monitoring_id_c
AND SRC.cdctype='X' ) temp; 




