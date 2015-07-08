

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.over_due_flag' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.sc_req_item_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_o_data_freshness FRESH  ON(FRESH.source_id=SRC.sourceinstance) 
 LEFT JOIN <<tenant>>_mdwdb.d_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( CASE WHEN SRC.active = 1 and due_date < FRESH.lastupdated then 'Y' else 'N' END,'')<> COALESCE(TRGT.over_due_flag ,'')

