SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
FROM (select count(1) cnt from tjx_mdsdb.change_request_final                               SRC
LEFT JOIN tjx_mdwdb.d_kb_knowledge_c LKP 
 ON u_change_document_name= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id  
 LEFT JOIN tjx_mdwdb.f_change_request               TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_change_document_name IS NULL THEN 0 else -1 end)<> (TRGT.change_document_name_c_key))b
