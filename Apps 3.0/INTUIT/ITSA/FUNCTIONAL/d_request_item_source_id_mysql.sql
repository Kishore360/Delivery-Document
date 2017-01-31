


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.source_id' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.d_request_item TRGT 
 ON SRC.sys_id =TRGT.row_id  

 WHERE TRGT.soft_deleted_flag ='N' and ( SRC.sourceinstance)<> (TRGT.source_id )
 