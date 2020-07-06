SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_request_item.request_item_number' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM ibmwatson_mdsdb.sc_req_item_final SRC 
 LEFT JOIN ibmwatson_mdwdb.d_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE  SRC.number<> TRGT.request_item_number_c )temp;
 
