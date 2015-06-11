

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.last_resolved_on_key' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.incident_final SRC
 LEFT JOIN #DWH_TABLE_SCHEMA.f_incident TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
LEFT JOIN  app_test.lsm_ls_source_timezone L 
ON (convert(SRC.sourceinstance using utf8)  = convert(L.sourceid using utf8))
LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP 
on (convert(LKP.row_id using utf8) = convert(date_format(convert_tz(SRC.resolved_at,source_time_zone,target_time_zone),'%Y%m%d') using utf8) and LKP.source_id=0
)
LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP1 
on (convert(LKP1.row_id using utf8) = convert(date_format(convert_tz(SRC.closed_at,source_time_zone,target_time_zone),'%Y%m%d') using utf8) and LKP1.source_id=0
)
LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP2
on (convert(LKP2.row_id using utf8) = convert(date_format(convert_tz(SRC.sys_updated_on,source_time_zone,target_time_zone),'%Y%m%d') using utf8) and LKP2.source_id=0
)

LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LKP3
on  SRC.state=LKP3.dimension_code  
and LKP3.dimension_class = 'STATE~INCIDENT'
WHERE CONVERT(COALESCE(
case when LKP3.dimension_wh_code  ='OPEN' then
case when LKP.row_key is not null then 0 else LKP.row_key end
when LKP3.dimension_wh_code in ('RESOLVED','CLOSED') 
then
coalesce(LKP.row_key,LKP1.row_key,LKP2.row_key) end,'') using utf8) <> CONVERT(COALESCE(TRGT.last_resolved_on_key,'') using utf8)
