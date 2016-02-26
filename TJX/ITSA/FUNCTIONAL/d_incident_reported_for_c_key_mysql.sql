SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
FROM tjx_mdsdb.incident_final SRC
LEFT JOIN tjx_mdwdb.d_internal_contact LKP 
 ON CONCAT(‘INTERNAL_CONTACT~’,u_reported_for)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id  
 LEFT JOIN tjx_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_reported_for IS NULL THEN 0 else -1 end)<> (TRGT.reported_for_c_key)