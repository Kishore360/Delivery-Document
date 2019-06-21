SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_service_request_c.open_to_resolve_duration' ELSE 'SUCCESS' END as Message
 FROM paloalto_mdsdb.u_stask_final SRC
  JOIN paloalto_mdwdb.f_sr_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 join paloalto_mdwdb.d_sr_task_c b
on SRC.sys_id=b.row_id and SRC.sourceinstance=b.source_id
 LEFT JOIN paloalto_mdwdb.d_lov_map br 
 ON b.state_src_key = br.src_key
WHERE br.dimension_wh_code IN ('RESOLVED')
AND TIMESTAMPDIFF(SECOND,SRC.opened_at,coalesce(SRC.u_resolved_at,SRC.closed_at)) <> TRGT.open_to_resolve_duration;





