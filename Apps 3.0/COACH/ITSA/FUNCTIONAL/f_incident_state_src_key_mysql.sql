

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM coach_mdsdb.incident_final SRC 
 LEFT JOIN coach_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN coach_mdwdb.d_lov LKP 
 ON  LKP.dimension_class like '%STATE~INCIDENT%' and
( concat('STATE~INCIDENT~~~',upper(SRC.incident_state))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.incident_state IS NULL THEN 0 else -1 end)<> (TRGT.state_src_key)