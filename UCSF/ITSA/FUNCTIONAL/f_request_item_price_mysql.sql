

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.price' ELSE 'SUCCESS' END as Message
 FROM ucsf_mdsdb.sc_req_item_final SRC 
 LEFT JOIN ucsf_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE SRC.price<> TRGT.price 
