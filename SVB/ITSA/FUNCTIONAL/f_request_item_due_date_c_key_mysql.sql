SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.due_date_key' ELSE 'SUCCESS' END as Message
 FROM svb_mdsdb.sc_req_item_final SRC
 LEFT JOIN svb_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) 
 LEFT JOIN svb_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.due_date,'GMT','US/Mountain'),'%Y%m%d') and LKP.source_id=0 
)
 WHERE LKP.row_key<> TRGT.due_date_c_key
