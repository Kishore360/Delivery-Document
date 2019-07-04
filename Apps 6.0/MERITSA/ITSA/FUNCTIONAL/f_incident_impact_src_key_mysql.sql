SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.impact_src_key' ELSE 'SUCCESS' END as Message
 FROM meritsa_mdsdb.incident_final SRC 
 LEFT JOIN meritsa_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN meritsa_mdwdb.d_lov LKP 
 ON ( concat('IMPACT~incident~',upper(impact))= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.impact IS NULL THEN 0 else -1 end)<> (TRGT.impact_src_key)
 AND SRC.CDCTYPE='X'
