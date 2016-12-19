SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.open_to_resolve_duration' ELSE 'SUCCESS' END as Message
FROM uclahealth_mdsdb.incident_final SRC
  JOIN uclahealth_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN uclahealth_mdwdb.d_lov_map br 
 ON TRGT.state_src_key = br.src_key
WHERE   br.dimension_wh_code IN ('CLOSED','RESOLVED')
AND CASE WHEN TIMESTAMPDIFF(SECOND,
                SRC.opened_at,
                SRC.u_resolved_date) < 0 THEN NULL    
                ELSE TIMESTAMPDIFF(SECOND,SRC.opened_at,coalesce(SRC.u_resolved_date,SRC.closed_at,SRC.sys_updated_on)) END <> TRGT.open_to_resolve_duration
