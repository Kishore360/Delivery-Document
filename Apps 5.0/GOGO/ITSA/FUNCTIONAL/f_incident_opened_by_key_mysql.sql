

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_key' ELSE 'SUCCESS' END as Message
 FROM gogo_mdsdb.incident_final SRC 
  JOIN gogo_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN gogo_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',caller_id)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id ) 
AND 
 TRGT.pivot_date between effective_from and effective_to
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.caller_id IS NULL THEN 0 else -1 end)<> (TRGT.opened_by_key)
 
 