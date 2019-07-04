SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_asc_c.open_to_resolve_duration' ELSE 'SUCCESS' END as Message
 FROM meritsa_mdsdb.u_asc_ticket_final SRC
  JOIN meritsa_mdwdb.f_incident_asc_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN meritsa_mdwdb.d_lov_map br 
 ON TRGT.asc_incident_state_c_key = br.src_key
WHERE   br.dimension_wh_code IN ('RESOLVED')
AND TIMESTAMPDIFF(SECOND,SRC.opened_at,coalesce(SRC.u_resolved,SRC.closed_at))  <> TRGT.open_to_resolve_duration;