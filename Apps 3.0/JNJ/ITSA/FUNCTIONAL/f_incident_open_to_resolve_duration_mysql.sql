SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.open_to_resolve_duration' ELSE 'SUCCESS' END as Message
 FROM jnj_mdsdb.incident_final SRC
  JOIN jnj_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN jnj_mdwdb.d_lov_map br 
 ON TRGT.state_src_key = br.src_key
WHERE   br.dimension_wh_code IN ('RESOLVED')
AND TIMESTAMPDIFF(SECOND,convert_tz(SRC.opened_at,'GMT','America/Los_Angeles'),
convert_tz(coalesce(SRC.u_resolved_at,SRC.closed_at),'GMT','America/Los_Angeles'))
 <> TRGT.open_to_resolve_duration;