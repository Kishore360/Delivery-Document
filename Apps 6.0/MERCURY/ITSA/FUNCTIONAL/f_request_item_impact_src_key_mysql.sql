

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_request_item.approval_state_src_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
  FROM mercury_mdsdb.sc_req_item_final SRC 
 LEFT JOIN mercury_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id AND SRC.cdctype<>'D')
LEFT JOIN mercury_mdwdb.d_lov LKP
 ON ( concat('IMPACT','~','SC_REQ_ITEM','~',upper(impact))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.impact IS NULL THEN 0 else -1 end)<> (TRGT.impact_src_key))b

 
 
 
 
