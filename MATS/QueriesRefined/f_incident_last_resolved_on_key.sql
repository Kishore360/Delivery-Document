

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.last_resolved_on_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.incident_final SRC
 LEFT JOIN <<tenant>>_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN  app_test.lsm_ls_source_timezone L 
ON (SRC.sourceinstance  = L.sourceid )
LEFT JOIN <<tenant>>_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.resolved_at,source_time_zone,target_time_zone),'%Y%m%d')  and LKP.source_id=0
)
LEFT JOIN <<tenant>>_mdwdb.d_calendar_date LKP1 
on (LKP1.row_id = date_format(convert_tz(SRC.closed_at,source_time_zone,target_time_zone),'%Y%m%d')  and LKP1.source_id=0
)
LEFT JOIN <<tenant>>_mdwdb.d_calendar_date LKP2
on (LKP2.row_id = date_format(convert_tz(SRC.sys_updated_on,source_time_zone,target_time_zone),'%Y%m%d')  and LKP2.source_id=0
)

LEFT JOIN <<tenant>>_mdwdb.d_lov_map LKP3
on  SRC.state=LKP3.dimension_code  
and LKP3.dimension_class = 'STATE~INCIDENT'
WHERE COALESCE(
case when LKP3.dimension_wh_code  ='OPEN' then
case when LKP.row_key is not null then 0 else LKP.row_key end
when LKP3.dimension_wh_code in ('RESOLVED','CLOSED') 
then
coalesce(LKP.row_key,LKP1.row_key,LKP2.row_key) end,'') <> COALESCE(TRGT.last_resolved_on_key,'') 
