SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.opened_on_key' ELSE 'SUCCESS' END as Message
 FROM pgi_mdsdb.change_request_final SRC
 LEFT JOIN pgi_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) LEFT JOIN pgi_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.sys_created_on,'GMT','UTC'),'%Y%m%d') and LKP.source_id=0 
)
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_created_on IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.opened_on_key,'')
