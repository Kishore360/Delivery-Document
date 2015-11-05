SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.estimated_delivery_on_key' ELSE 'SUCCESS' END as Message
 FROM pgi_mdsdb.sc_req_item_final SRC
 LEFT JOIN pgi_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN pgi_mdwdb.d_calendar_date LKP 
on (LKP.row_id = COALESCE(date_format(convert_tz(SRC.estimated_delivery,"GMT","UTC"),'%Y%m%d'),'UNSPECIFIED')  and LKP.source_id=SRC.sourceinstance
)
WHERE COALESCE(LKP.row_key,case when SRC.estimated_delivery is null then 0 else -1 end) <> COALESCE(TRGT.estimated_delivery_on_key,'') 

