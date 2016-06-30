SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.source_id' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.sc_req_item_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_request_item TRGT 
 ON SRC.sys_id =TRGT.row_id  

 WHERE ( SRC.sourceinstance)<> (TRGT.source_id )