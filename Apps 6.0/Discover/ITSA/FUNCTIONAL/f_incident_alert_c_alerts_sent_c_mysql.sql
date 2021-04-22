SELECT 
CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_incident_alert_c.alerts_sent_c' ELSE 'SUCCESS' END as Message 
FROM discover_mdsdb.incident_alert_final  SRC 
JOIN discover_mdwdb.f_incident_alert_c TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
WHERE SRC.u_alerts_sent <> (TRGT.alerts_sent_c) 
and SRC.cdctype ='X'