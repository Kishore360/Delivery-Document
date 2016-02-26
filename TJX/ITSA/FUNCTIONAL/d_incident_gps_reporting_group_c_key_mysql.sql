SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM tjx_mdsdb.incident_final SRC
LEFT JOIN tjx_mdwdb.d_lov LKP 
 ON LKP.dimension_class like '%GPS_REPORTING_GROUP~INCIDENT%' and 
( concat('GPS_REPORTING_GROUP~INCIDENT~~~',u_gps_reporting_group)= LKP.rowid 
AND SRC.sourceinstance= LKP.source_id ) 
 LEFT JOIN tjx_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_gps_reporting_group IS NULL THEN 0 else -1 end)<> (TRGT.gps_reporting_group_c_key)