SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.estimated_delivery_on_key' ELSE 'SUCCESS' END as Message
 FROM usf_mdsdb.sc_req_item_final SRC
 LEFT JOIN   usf_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN usf_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.estimated_delivery,'GMT','America/Los_Angeles'),'%Y%m%d') )
WHERE LKP.row_key <> TRGT.delevered_on_c_key

