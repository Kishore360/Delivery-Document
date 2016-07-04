

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_hr_change.closed_on_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.hr_change_final SRC
 LEFT JOIN <<tenant>>_mdwdb.f_hr_change TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN  app_test.lsm_ls_source_timezone L 
ON (SRC.sourceinstance   = L.sourceid )
LEFT JOIN <<tenant>>_mdwdb.d_calendar_date LKP 
on (LKP.row_id  = date_format(convert_tz(SRC.closed_at,source_time_zone,target_time_zone),'%Y%m%d')  and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,'')  <> COALESCE(TRGT.closed_on_key,'') 
