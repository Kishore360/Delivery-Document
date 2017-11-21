SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_key' ELSE 'SUCCESS' END as Message
 FROM watson_mdsdb.incident_final SRC 
 LEFT JOIN watson_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN watson_mdwdb.d_internal_contact LKP 
 ON ( coalesce(concat('INTERNAL_CONTACT~',caller_id),'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.caller_id IS NULL THEN 0 else -1 end)<> (TRGT.opened_by_key)
