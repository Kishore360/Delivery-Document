SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM aetna_mdsdb.incident_final SRC 
 LEFT JOIN aetna_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN aetna_mdwdb.d_internal_contact LKP 
 ON ( COALESCE(CONCAT('INTERNAL_CONTACT~',SRC.caller_id),'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
AND DATE_FORMAT(SRC.opened_at, '%Y-%m-%d %H:%i:%s') BETWEEN LKP.effective_from AND LKP.effective_to
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.caller_id IS NULL THEN 0 else -1 end)<> (TRGT.caller_key)