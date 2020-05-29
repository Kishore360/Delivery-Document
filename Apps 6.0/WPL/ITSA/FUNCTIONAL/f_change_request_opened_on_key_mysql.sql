SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_change_request.opened_on_key' ELSE 'SUCCESS' END as Message 
FROM wpl_mdsdb.change_request_final  SRC 
JOIN wpl_mdwdb.f_change_request TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN wpl_mdwdb.d_calendar_date LKP 
ON  (COALESCE(date_format(convert_tz(SRC.opened_at,'GMT','America/New_York'),'%Y%m%d'),'UNSPECIFIED') = LKP.row_id ) 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.opened_at IS NULL THEN 0 else -1 end)<> (TRGT.opened_on_key)
 and SRC.cdctype='X'
