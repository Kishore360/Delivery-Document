



SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.incident_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
<<<<<<< HEAD
LEFT JOIN cardinalhealth_mdwdb.d_lov LKP 
 ON ( concat('INCIDENT_STATE','~','INCIDENT','~','~','~',upper(state))= LKP.src_rowid 
=======
LEFT JOIN <<tenant>>_mdwdb.d_lov LKP 
 ON ( concat('STATE','~','INCIDENT','~','~','~',upper(incident_state))= LKP.src_rowid 
>>>>>>> 947f1b73ccdb85ca5c852f8e02b37a10eed5ed12
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.incident_state IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.state_src_key,'')
