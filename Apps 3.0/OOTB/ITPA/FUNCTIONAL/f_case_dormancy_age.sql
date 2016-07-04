select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.dormancy_age' ELSE 'SUCCESS' END as Message
FROM  <<tenant>>_mdsdb.sn_customerservice_case_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_case TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 left join <<tenant>>_mdwdb.d_lov_map lm 
  ON (lm.src_key = TRGT.state_src_key and lm.source_id = TRGT.source_id and lm.dimension_class = 'STATE~CASE')
 left join app_test.lsm_ls_source_timezone tz 
  ON (tz.sourceid = SRC.sourceinstance)
 LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  <<tenant>>_mdwdb.d_o_data_freshness
 group by source_id
 ) df 
  ON (TRGT.source_id = df.source_id
 -- AND TRGT.etl_run_number = df.etl_run_number
 )
where lm.dimension_class = 'STATE~CASE'
AND  CASE WHEN lm.dimension_wh_code = 'OPEN' THEN TIMESTAMPDIFF( DAY,coalesce(date_format(SRC.sys_updated_on,'%Y%m%d'),0),
date_format(convert_tz(df.lastupdated, tz.target_time_zone, tz.source_time_zone),'%Y%m%d'))  
	ELSE 0 END <> TRGT.dormancy_age
