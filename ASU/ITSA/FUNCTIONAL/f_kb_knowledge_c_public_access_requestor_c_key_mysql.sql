

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_kb_knowledge_c.public_access_requestor_c_key' ELSE 'SUCCESS' END as Message
 FROM asu_mdsdb.kb_knowledge_final SRC 
 LEFT JOIN asu_mdwdb.f_kb_knowledge_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN asu_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',u_public_access_requestor)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_public_access_requestor IS NULL THEN 0 else -1 end)<> (TRGT.public_access_requestor_c_key)
