SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.resolve_to_close_duration' ELSE 'SUCCESS' END as Message
FROM cardinalhealth_mdsdb.incident_final SRC
 LEFT JOIN cardinalhealth_mdwdb.d_lov_map L
 ON (concat('STATE~INCIDENT~~~',upper(SRC.incident_state))=L.src_rowid
 AND SRC.sourceinstance=L.source_id )
 LEFT JOIN cardinalhealth_mdwdb.f_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
    left join cardinalhealth_mdwdb.d_lov_map lm 
  ON (lm.src_key = TRGT.state_src_key)
 WHERE case when L.dimension_wh_code in ('CLOSED') THEN
		CASE WHEN SRC.resolved_at <= SRC.closed_at then COALESCE( TIMESTAMPDIFF(SECOND, SRC.resolved_at, 
			COALESCE( SRC.closed_at,SRC.sys_updated_on)) ,0) else '' end
	  else '' end
<> COALESCE(TRGT.resolve_to_close_duration ,'')