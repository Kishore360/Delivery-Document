
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.author_c_key' ELSE 'SUCCESS' END as Message
 FROM homedepot_mdsdb.kb_knowledge_final SRC 
  JOIN homedepot_mdwdb.f_kb_knowledge_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 JOIN homedepot_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',author)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.author IS NULL THEN 0 else -1 end)<> (TRGT.author_c_key)
 
 
 