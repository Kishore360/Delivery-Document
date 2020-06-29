
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.age' ELSE 'SUCCESS' END as Message
FROM ibmwatson_mdwdb.f_case TRGT 
left join ibmwatson_mdwdb.d_lov_map lm 
  ON (lm.src_key = TRGT.state_src_key and lm.dimension_class = 'STATE~CASE')
   
LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  ibmwatson_mdwdb.d_o_data_freshness
 group by source_id
 ) df 
  ON (TRGT.source_id = df.source_id )
 
where    TRGT.age <>
coalesce(age,case 
    when coalesce(TRGT.opened_on, 0) > coalesce (TRGT.closed_on, TRGT.last_resolved_on, df.lastupdated) then 0
    when lm.dimension_wh_code in ('OPEN') 
    then TIMESTAMPDIFF(SECOND, coalesce(convert_tz(TRGT.opened_on, 'UTC','GMT'),0), 
         convert_tz(df.lastupdated, 'UTC','GMT'))
    when lm.dimension_wh_code in ('RESOLVED', 'CLOSED')
    then TIMESTAMPDIFF(SECOND, coalesce(convert_tz(TRGT.opened_on, 'UTC','GMT'),0),
    convert_tz(coalesce(TRGT.last_resolved_on,df.lastupdated), 'UTC','GMT'))
end)