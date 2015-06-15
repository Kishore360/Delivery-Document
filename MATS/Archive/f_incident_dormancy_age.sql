

select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.dormancy_age' ELSE 'SUCCESS' END as Message
 
FROM  #MDS_TABLE_SCHEMA.incident_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_incident TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
    
    left join #DWH_TABLE_SCHEMA.d_lov_map lm 
  ON (lm.src_key = TRGT.state_src_key)
    left join app_test.lsm_ls_source_timezone tz 
  ON (tz.sourceid = SRC.sourceinstance)
    
 LEFT JOIN #DWH_TABLE_SCHEMA.d_o_data_freshness df 
  ON (TRGT.source_id = df.source_id
  AND TRGT.etl_run_number = df.etl_run_number)
where lm.dimension_class = 'STATE~INCIDENT'

AND  CASE WHEN lm.dimension_wh_code = 'OPEN' THEN TIMESTAMPDIFF( DAY,df.lastupdated,convert_tz(coalesce(SRC.sys_updated_on,0), tz.source_time_zone, tz.target_time_zone) )  
	ELSE 0 END <> TRGT.dormancy_age
