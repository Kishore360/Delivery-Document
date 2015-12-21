SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.open_to_resolve_duration' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.incident_final SRC
 LEFT JOIN <<tenant>>_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN <<tenant>>_mdwdb.d_lov_map br 
 ON TRGT.state_src_key = br.src_key
WHERE  case when br.dimension_wh_code IN ('OPEN') THEN NULL
ELSE TIMESTAMPDIFF(SECOND,SRC.opened_at,SRC.resolved_at) END <>  COALESCE(TRGT.open_to_resolve_duration,'') 