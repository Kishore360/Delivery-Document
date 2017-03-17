 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_kb_knowledge_c.article_type_src_c_key' ELSE 'SUCCESS' END as Message
 FROM asu_mdsdb.kb_knowledge_final SRC 
 LEFT JOIN asu_mdwdb.d_kb_knowledge_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN asu_mdwdb.d_lov LKP 
 ON ( concat('TOPIC_C','~','KNOWLEDGE_C','~','~','~',upper(topic))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.article_type IS NULL THEN 0 else -1 end)<> COALESCE(TRGT.topic_src_c_key) 
