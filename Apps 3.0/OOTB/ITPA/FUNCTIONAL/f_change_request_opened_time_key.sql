
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.opened_time_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.change_request_final SRC
 LEFT JOIN <<tenant>>_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )


 LEFT JOIN <<tenant>>_mdwdb.d_calendar_time LKP 
on (LKP.row_id  = date_format(convert_tz(SRC.opened_at,'GMT','America/Los_Angeles'),'%H%i')  and LKP.source_id=0

 
)
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.opened_at IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.opened_time_key,'')