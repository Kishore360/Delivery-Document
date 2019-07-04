

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_request_item.priority_src_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
  FROM meritsa_mdsdb.sc_req_item_final SRC 
 LEFT JOIN meritsa_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id AND SRC.cdctype<>'D')
LEFT JOIN meritsa_mdwdb.d_lov LKP
 ON ( concat('PRIORITY','~','SC_REQ_ITEM','~',upper(priority))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.priority IS NULL THEN 0 else -1 end)<> (TRGT.priority_src_key))b

 
 
 
 
