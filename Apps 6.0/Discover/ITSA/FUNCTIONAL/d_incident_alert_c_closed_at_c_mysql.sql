SELECT 
CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident_alert_c.closed_at_c' ELSE 'SUCCESS' END as Message 
FROM discover_mdsdb.incident_alert_final  SRC 
JOIN discover_mdwdb.d_incident_alert_c TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
WHERE convert_tz(SRC.closed_at,'GMT','America/New_York')<> (TRGT.closed_at_c) 
and SRC.cdctype ='X'