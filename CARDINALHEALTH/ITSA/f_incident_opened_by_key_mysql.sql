

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_key' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.incident_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN cardinalhealth_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',u_caller)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.caller_id IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.opened_by_key,'')