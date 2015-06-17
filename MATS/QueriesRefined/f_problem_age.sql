select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.age' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.problem_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
    
    left join <<tenant>>_mdwdb.d_lov_map lm 
  ON (lm.src_key = TRGT.state_src_key)
    left join app_test.lsm_ls_source_timezone tz 
  ON (tz.sourceid = SRC.sourceinstance)
    
 LEFT JOIN <<tenant>>_mdwdb.d_o_data_freshness df 
  ON (TRGT.source_id = df.source_id
  AND TRGT.etl_run_number = df.etl_run_number)
where lm.dimension_class = 'STATE~PROBLEM'
and case when lm.dimension_wh_code in ('OPEN') 
    then TIMESTAMPDIFF(DAY, convert_tz(coalesce( SRC.opened_at,0), tz.source_time_zone, tz.target_time_zone), df.lastupdated)
                else TIMESTAMPDIFF(DAY, coalesce( SRC.opened_at,0),coalesce(  SRC.closed_at,0))
            end  <>TRGT.age
