SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.due_on' ELSE 'SUCCESS' END as Message 
FROM svb_mdsdb.sc_req_item_final SRC  
LEFT JOIN svb_mdwdb.d_request_item TRGT
  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
  WHERE date(convert_tz(SRC.due_date,'GMT','US/Mountain'))<> date(TRGT.due_date_c)