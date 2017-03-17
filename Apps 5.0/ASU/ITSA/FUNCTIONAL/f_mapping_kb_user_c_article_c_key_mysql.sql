 
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.author_c_key' ELSE 'SUCCESS' END as Message
 FROM asu_mdsdb.kb_use_final SRC 
 LEFT JOIN asu_mdwdb.f_mapping_kb_user_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN asu_mdwdb.d_kb_knowledge_c LKP 
 ON ( article= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.article IS NULL THEN 0 else -1 end)<> (TRGT.article_c_key)
 
 
 