SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM jnj_mdsdb.incident_final SRC
LEFT JOIN jnj_mdwdb.d_lov LKP 
 ON LKP.dimension_class like '%STATE~INCIDENT%' and 
( concat('STATE~INCIDENT~~~',u_site)= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id ) 
 LEFT JOIN jnj_mdwdb.d_location TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_site IS NULL THEN 0 else -1 end)<> (TRGT.site_c_key)
 
 
 