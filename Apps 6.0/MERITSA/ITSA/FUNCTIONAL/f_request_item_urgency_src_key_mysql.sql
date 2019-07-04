
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_item.urgency_src_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT 
 FROM meritsa_mdsdb.sc_req_item_final SRC 
 LEFT JOIN meritsa_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id AND SRC.cdctype<>'D')
LEFT JOIN meritsa_mdwdb.d_lov LKP 
 ON ( concat('URGENCY','~','SC_REQ_ITEM','~',upper(urgency))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.urgency IS NULL THEN 0 else -1 end)<> (TRGT.urgency_src_key))temp;
 
