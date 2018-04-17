SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_item.due_on_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT 
 FROM tjx_mdsdb.sc_req_item_final SRC
 LEFT JOIN tjx_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN tjx_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.due_date,'GMT','America/New_York'),'%Y%m%d')  and LKP.source_id=0
)
 join tjx_mdwdb.d_request_item a19 on (TRGT.request_item_key = a19.row_key)  where category_name_c in ('ARMS') and coalesce(LKP.row_key,case when SRC.due_date is null then 0 else -1 end)<>  (TRGT.due_on_key)) temp;

