
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.age' ELSE 'SUCCESS' END as Message
    FROM <<tenant>>_mdsdb.sc_request_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )	
    left join <<tenant>>_mdwdb.d_lov_map lm 
  ON (lm.src_key = TRGT.state_src_key)    
 where lm.dimension_class = 'STATE~REQUEST'
 and case when lm.dimension_wh_code in ('OPEN') 
    then TIMESTAMPDIFF(DAY, SRC.opened_at,convert_tz( (SELECT MAX(lastupdated) AS lastupdated
FROM <<tenant>>_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'),<<DW_TARGET_TIME_ZONE>>,<<TENANT_SSI_TIME_ZONE>>))
                else TIMESTAMPDIFF(DAY, SRC.opened_at,SRC.closed_at)
            end  <> TRGT.age
