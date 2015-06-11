

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.planned_end_on_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.change_request_final SRC
 LEFT JOIN <<tenant>>_mdwdb.f_change_request TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
LEFT JOIN  app_test.lsm_ls_source_timezone L 
ON (convert(SRC.sourceinstance using utf8)  = convert(L.sourceid using utf8))

 LEFT JOIN <<tenant>>_mdwdb.d_calendar_date LKP 
on (convert(LKP.row_id using utf8) = convert(date_format(convert_tz(SRC.end_date,source_time_zone,target_time_zone),'%Y%m%d') using utf8)and LKP.source_id=0
 
)
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.end_date IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.planned_end_on_key,'')
