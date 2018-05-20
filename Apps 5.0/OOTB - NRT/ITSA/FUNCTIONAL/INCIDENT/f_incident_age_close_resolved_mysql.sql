
 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.age' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
from
 (select sys_updated_on,sys_id,sourceinstance,opened_at,resolved_at,closed_at 
FROM (select * from <<tenant>>_mdsdb.incident_final where cdctype<>'D') where  opened_at < coalesce(resolved_at,closed_at)) SRC 
  join <<tenant>>_mdwdb.f_incident f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id  )
JOIN <<tenant>>_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code IN ('RESOLVED','CLOSED')
JOIN <<tenant>>_mdwdb.d_incident a ON a.row_key = f.incident_key
AND f.source_id = a.source_id
left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = kb.sourceinstance)
where (SRC.cdctime<=f1.lastupdated) and
timestampdiff(SECOND, convert_tz(convert_tz(SRC.opened_at,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>),<<DW_TARGET_TIME_ZONE>>,<<TENANT_SSI_TIME_ZONE>>), 
coalesce(convert_tz(convert_tz(SRC.resolved_at,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>),<<DW_TARGET_TIME_ZONE>>,<<TENANT_SSI_TIME_ZONE>>), 
convert_tz(convert_tz(SRC.closed_at,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>),<<DW_TARGET_TIME_ZONE>>,<<TENANT_SSI_TIME_ZONE>>),
convert_tz(convert_tz(SRC.sys_updated_on,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>),<<DW_TARGET_TIME_ZONE>>,
<<TENANT_SSI_TIME_ZONE>>))) <> f.age
  )a
  
  
  
  