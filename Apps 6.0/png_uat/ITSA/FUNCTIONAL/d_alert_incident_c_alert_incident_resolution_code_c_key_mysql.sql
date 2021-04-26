SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_alert_incident_c.alert_incident_resolution_code_c_key' ELSE 'SUCCESS' END as Message FROM png_mdsdb.incident_alert_final  SRC JOIN png_ccs_mdwdb.d_alert_incident_c TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  LEFT JOIN png_ccs_workdb.d_lov LKP ON ( concat( 'RESOLUTION_CODE~ALERT_INCIDENT~' ,upper( SRC.resolution_code)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) WHERE COALESCE(LKP.row_key,CASE WHEN SRC.resolution_code IS NULL THEN 0 else -1 end)<> (TRGT.alert_incident_resolution_code_c_key) 
