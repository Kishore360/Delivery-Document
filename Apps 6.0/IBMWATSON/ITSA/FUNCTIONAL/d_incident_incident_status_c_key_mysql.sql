SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.incident_status_c_key' ELSE 'SUCCESS' END as Message
 FROM ibmwatson_mdsdb.incident_final SRC 
 LEFT JOIN ibmwatson_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN ibmwatson_mdwdb.d_lov LKP 
 ON ( coalesce(concat('U_STATUS~INCIDENT~~~',u_status),'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_status IS NULL THEN 0 else -1 end)<> (TRGT.incident_status_c_key)