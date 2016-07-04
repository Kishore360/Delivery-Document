
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.age' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdwdb.f_case TRGT 
left join <<tenant>>_mdwdb.d_lov_map lm 
  ON (lm.src_key = TRGT.state_src_key)
    left join app_test.lsm_ls_source_timezone tz 
  ON (tz.sourceid = TRGT.source_id)
    
LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  <<tenant>>_mdwdb.d_o_data_freshness
 group by source_id
 ) df 
  ON (TRGT.source_id = df.source_id )
 
where lm.dimension_class = 'STATE~CASE'
and case when lm.dimension_wh_code in ('OPEN') 
    then case when coalesce(TRGT.opened_on,0)> convert_tz(df.lastupdated, tz.target_time_zone, tz.source_time_zone) then 0 else
    TIMESTAMPDIFF(DAY, coalesce(TRGT.opened_on,0), convert_tz(df.lastupdated, tz.target_time_zone, tz.source_time_zone)) end
               else 
                case when  TRGT.opened_on>coalesce(TRGT.closed_on, TRGT.last_resolved_on) then 0 else
                TIMESTAMPDIFF(DAY, coalesce(TRGT.opened_on,0),coalesce(TRGT.closed_on, TRGT.last_resolved_on,0))
		end end  <>TRGT.age
