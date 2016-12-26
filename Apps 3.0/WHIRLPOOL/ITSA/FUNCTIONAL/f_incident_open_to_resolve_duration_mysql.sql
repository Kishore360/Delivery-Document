 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.dormancy_age' ELSE 'SUCCESS' END as Message 
 FROM whirlpool_mdsdb.incident_final SRC
  JOIN whirlpool_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  )
 join whirlpool_mdwdb.d_incident a
 on TRGT.incident_key=a.row_key
 AND SRC.sourceinstance= TRGT.source_id  
 LEFT JOIN whirlpool_mdwdb.d_lov_map br 
 ON TRGT.state_src_key = br.src_key
WHERE   br.dimension_wh_code IN ('RESOLVED')
AND (CASE WHEN a.last_resolved_on is null THEN TIMESTAMPDIFF(SECOND,a.opened_on,coalesce( a.closed_on,a.changed_on))
else TIMESTAMPDIFF(SECOND,a.opened_on,a.last_resolved_on) END)<>TRGT.open_to_resolve_duration;
