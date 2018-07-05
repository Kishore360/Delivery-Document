SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_service_request_c.open_to_resolve_duration' ELSE 'SUCCESS' END as Message
 FROM pan6_mdsdb.u_service_request_final SRC
  JOIN pan6_mdwdb.f_service_request_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 join pan6_mdwdb.d_service_request_c b
on SRC.sys_id=b.row_id and SRC.sourceinstance=b.source_id
 LEFT JOIN pan6_mdwdb.d_lov_map br 
 ON b.state_src_key = br.src_key
WHERE br.dimension_wh_code IN ('RESOLVED')
AND TIMESTAMPDIFF(SECOND,SRC.opened_at,coalesce(SRC.u_resolved_at,SRC.closed_at)) <> TRGT.open_to_resolve_duration;

