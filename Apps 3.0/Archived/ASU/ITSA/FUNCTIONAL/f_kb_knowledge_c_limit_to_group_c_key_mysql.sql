

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_kb_knowledge_c.limit_to_group_c_key' ELSE 'SUCCESS' END as Message
 FROM asu_mdsdb.kb_knowledge_final SRC 
 LEFT JOIN asu_mdwdb.f_kb_knowledge_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN asu_mdwdb.d_internal_organization LKP 
 ON ( concat('GROUP~',SRC.u_limit_to_group )= LKP.row_id
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_limit_to_group IS NULL THEN 0 
WHEN SRC.u_limit_to_group= 'undefined' then 0 else -1 end)<>(TRGT.limit_to_group_c_key)
