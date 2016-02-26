

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.location_key' ELSE 'SUCCESS' END as Message
 FROM tjx_mdsdb.incident_final SRC 
 LEFT JOIN tjx_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN tjx_mdwdb.d_location LKP 
 ON ( SRC.u_store= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_store IS NULL THEN 0 else -1 end)<> (TRGT.location_key)
