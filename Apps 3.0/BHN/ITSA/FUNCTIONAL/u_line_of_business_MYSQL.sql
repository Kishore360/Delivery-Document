SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM bhn_mdsdb.incident_final SRC
LEFT JOIN bhn_mdwdb.d_lov LKP 
 ON LKP.dimension_class like '%LOB~INCIDENT%' and 
( concat('LOB~INCIDENT~~~',upper(u_line_of_business))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id ) 
 LEFT JOIN bhn_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_line_of_business IS NULL THEN 0 else -1 end)<> COALESCE(TRGT.line_of_business_c_key,'')