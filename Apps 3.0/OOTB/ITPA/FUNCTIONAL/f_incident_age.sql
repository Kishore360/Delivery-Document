
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.age' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.incident_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
left join <<tenant>>_mdwdb.d_lov_map lm 
  ON (lm.src_key = TRGT.state_src_key)
    left join app_test.lsm_ls_source_timezone tz 
  ON (tz.sourceid = SRC.sourceinstance)
    
LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  <<tenant>>_mdwdb.d_o_data_freshness
 group by source_id
 ) df 
  ON (TRGT.source_id = df.source_id )
 
where lm.dimension_class = 'STATE~INCIDENT'
and case when lm.dimension_wh_code in ('OPEN') 
    then case when coalesce( SRC.opened_at,0)> convert_tz(df.lastupdated, tz.target_time_zone, tz.source_time_zone) then 0 else
    TIMESTAMPDIFF(DAY, coalesce( SRC.opened_at,0), convert_tz(df.lastupdated, tz.target_time_zone, tz.source_time_zone)) end
               else 
                case when  SRC.opened_at>coalesce( SRC.resolved_at,  SRC.closed_at) then 0 else
                TIMESTAMPDIFF(DAY, coalesce(SRC.opened_at,0),coalesce( SRC.resolved_at,  SRC.closed_at,0))
		end end  <>TRGT.age

