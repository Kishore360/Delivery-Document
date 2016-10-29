 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.source_src_c_key' ELSE 'SUCCESS' END as Message
 FROM nbcu_mdsdb.sc_req_item_final SRC
 LEFT JOIN nbcu_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id ) =(TRGT.row_id ) 
 AND (SRC.sourceinstance )=(TRGT.source_id ) 
 LEFT JOIN nbcu_mdwdb.d_lov LKP 
 ON (CONCAT('SOURCE_C~TASK~~~',UPPER(SRC.u_source)))= (LKP.src_rowid )
 AND SRC.sourceinstance= LKP.source_id
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_source IS NULL THEN 0 else -1 end)<> (TRGT.source_src_c_key)
 ;