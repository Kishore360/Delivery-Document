SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_item.due_on_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT 
 (select * from <<tenant>>_mdsdb.sc_req_item_final cdctype<>'D') SRC
 LEFT JOIN <<tenant>>_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN <<tenant>>_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.due_date,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>),'%Y%m%d')  and LKP.source_id=0
)
left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
WHERE (SRC.cdctime<=f1.lastupdated) and coalesce(LKP.row_key,case when SRC.due_date is null then 0 else -1 end)<>  (TRGT.due_on_key)) temp;

