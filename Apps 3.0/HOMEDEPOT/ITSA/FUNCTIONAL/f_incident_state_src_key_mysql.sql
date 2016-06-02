

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM homedepot_mdsdb.incident_final SRC 
 LEFT JOIN homedepot_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN homedepot_mdwdb.d_lov LKP 
 ON  LKP.dimension_class like '%STATE~INCIDENT%' and
( concat('STATE~INCIDENT~~~',upper(SRC.state))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id ) and LKP.current_flag ='Y'
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else -1 end)<> (TRGT.state_src_key)