SELECT 
CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident_alert_c.incident_alert_detection_type_c_key' ELSE 'SUCCESS' END as Message 
FROM discover_mdsdb.incident_alert_final  SRC 
JOIN discover_mdwdb.d_incident_alert_c TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN discover_mdwdb.d_lov LKP ON (concat('DETECTION_TYPE~ALERT_INCIDENT_C~' ,upper( SRC.u_detection_type)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_detection_type IS NULL THEN 0 else -1 end)<> (TRGT.incident_alert_detection_type_c_key) 
and SRC.cdctype ='X'