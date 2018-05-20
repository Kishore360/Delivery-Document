 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.age' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM (select sys_id,sourceinstance,opened_at FROM (select * from <<tenant>>_mdsdb.incident_final where cdctype<>'D') where opened_at < coalesce(resolved_at,closed_at)) SRC 
  join <<tenant>>_mdwdb.f_incident f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id and f.soft_deleted_flag='N' )

JOIN <<tenant>>_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code = 'OPEN' and br.dimension_class = 'STATE~INCIDENT'
left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = kb.sourceinstance)
where (SRC.cdctime<=f1.lastupdated) and TIMESTAMPDIFF(SECOND,SRC.opened_at,(SELECT CONVERT_TZ(max(lastupdated),<<DW_TARGET_TIME_ZONE>>,<<TENANT_SSI_TIME_ZONE>>) AS lastupdated FROM <<tenant>>_mdwdb.d_o_data_freshness where (SRC.cdctime<=f1.lastupdated) and sourcename like 'ServiceNow%' and etl_run_number=f.etl_run_number))<> f.age

 )A