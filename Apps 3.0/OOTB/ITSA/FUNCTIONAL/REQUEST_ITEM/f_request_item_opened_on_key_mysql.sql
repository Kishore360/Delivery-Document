SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_item.opened_on_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT 
 FROM <<tenant>>_mdsdb.sc_req_item_final SRC
 LEFT JOIN <<tenant>>_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN <<tenant>>_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.opened_at,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>),'%Y%m%d')  and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,case when SRC.opened_at is null then 0 else -1 end) <> (TRGT.opened_on_key))temp;

