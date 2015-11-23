SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM bhn_mdsdb.incident_final SRC
LEFT JOIN bhn_mdwdb.d_lov LKP 
 ON LKP.dimension_class like '%CALL_CATEGORY~INCIDENT%' and 
( concat('CALL_CATEGORY~INCIDENT~~~',upper(u_call_category))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id ) 
 LEFT JOIN bhn_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_call_category IS NULL THEN 0 else -1 end)<> COALESCE(TRGT.call_categroy_c_key,'')
 