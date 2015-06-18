
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.age' ELSE 'SUCCESS' END as Message
    from <<tenant>>_mdwdb.f_request fi 
    left join <<tenant>>_mdwdb.d_lov_map lm 
  ON (lm.src_key = fi.state_src_key)
    left join app_test.lsm_ls_source_timezone tz 
  ON (tz.sourceid = 999)
    left join <<tenant>>_mdwdb.d_calendar_date co 
  ON (co.row_key = fi.opened_on_key
        and co.source_id = 0)
    left join <<tenant>>_mdwdb.d_calendar_date cc 
  ON (cc.row_key = fi.closed_on_key
        and cc.source_id = 0)
 LEFT JOIN <<tenant>>_mdwdb.d_o_data_freshness df 
  ON (fi.source_id = df.source_id
  AND fi.etl_run_number = df.etl_run_number)
 where lm.dimension_class = 'STATE~REQUEST'
 and case when lm.dimension_wh_code in ('OPEN') 
    then TIMESTAMPDIFF(DAY, co.calendar_date, convert_tz(df.lastupdated, tz.source_time_zone, tz.target_time_zone))
                else TIMESTAMPDIFF(DAY, co.calendar_date, cc.calendar_date)
            end  <> fi.age
