SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.requested_for_c_key' ELSE 'SUCCESS' END as Message
FROM aon_mdsdb.incident_final SRC 
 LEFT JOIN aon_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN aon_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',u_requested_for)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_requested_for IS NULL THEN 0 else -1 end)<> (TRGT.requested_for_c_key);