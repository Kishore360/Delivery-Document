SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.open_to_resolve_duration' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM (select * from <<tenant>>_mdsdb.incident_final where cdctype<>'D') SRC
  JOIN <<tenant>>_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN <<tenant>>_mdwdb.d_lov_map br 
 ON TRGT.state_src_key = br.src_key
 left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where (SRC.cdctime<=f1.lastupdated) and   br.dimension_wh_code IN ('RESOLVED')
AND TIMESTAMPDIFF(SECOND,SRC.opened_at,coalesce(SRC.resolved_at,SRC.closed_at))  <> TRGT.open_to_resolve_duration)b

