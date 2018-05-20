SELECT CASE WHEN cnt> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.last_resolved_on' ELSE 'data matched' END as
 Message from (
select count(1) as cnt  FROM (select * from <<tenant>>_mdsdb.incident_final where cdctype<>'D') SRC  
 JOIN <<tenant>>_mdwdb.d_incident TRGT  
ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  )
 join <<tenant>>_mdwdb.f_incident f on f.incident_key=TRGT.row_key
JOIN <<tenant>>_mdwdb.d_lov_map dlm 
ON f.state_src_key = dlm.src_key
left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = kb.sourceinstance)
 where (SRC.cdctime<=f1.lastupdated) and 
case when
 dlm.dimension_wh_code = 'RESOLVED' then 
 convert_tz(SRC.resolved_at,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>) else null end 
<> TRGT.last_resolved_on)x
