
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.reported_type_src_key' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.incident_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN cardinalhealth_mdwdb.d_lov LKP 
 ON ( concat('CONTACT_TYPE','~','INCIDENT','~','~','~',upper(contact_type))= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.contact_type IS NULL THEN 0 else -1 end)<> (TRGT.reported_type_src_key)