SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for kb_knowledge_c' ELSE 'SUCCESS' END as Message
 FROM pdchs_mdsdb.kb_knowledge_final SRC
LEFT JOIN pdchs_mdwdb.d_internal_organization LKP 
 ON ( CONCAT('GROUP','~',SRC.u_knowledge_group)=LKP.row_id 
AND SRC.sourceinstance= LKP.source_id ) 
  JOIN pdchs_mdwdb.f_kb_knowledge_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_knowledge_group IS NULL THEN 0 else -1 end) <> (TRGT.knowledge_group_c_key);