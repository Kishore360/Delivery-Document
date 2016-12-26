SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM homedepot_mdsdb.kb_knowledge_final SRC
 JOIN homedepot_mdwdb.d_lov LKP 
 ON LKP.dimension_class like '%CATEGORY~KB_KNOWLEDGE%' and 
( CONCAT('CATEGORY','~','KB_KNOWLEDGE','~','~','~',UPPER(SRC.category))= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id ) 
  JOIN homedepot_mdwdb.d_kb_knowledge_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.category IS NULL THEN 0 else -1 end) <> (TRGT.CATEGORY_src_key)
 
 
 