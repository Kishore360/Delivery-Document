 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM jnj_mdsdb.incident_final SRC 
 LEFT JOIN jnj_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN jnj_mdwdb.d_lov LKP 
 ON ( concat('RESOLUTION_CATEGORY_C~incident~~~',SRC.u_resolution_category))= LKP.src_rowid 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_resolution_category IS NULL THEN 0 else -1 end)<> (TRGT.resolution_category_c_key)
 
 