SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.resolve_to_close_duration' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D') SRC
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map L
 ON (concat('STATE~INCIDENT~',upper(SRC.state))=L.src_rowid
 AND SRC.sourceinstance=L.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.f_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
    left join #DWH_TABLE_SCHEMA.d_lov_map lm 
  ON (lm.src_key = TRGT.state_src_key)
WHERE case when L.dimension_wh_code in ('CLOSED') THEN
		CASE WHEN coalesce(SRC.resolved_at,0) <= coalesce(SRC.closed_at,SRC.sys_updated_on) then COALESCE( TIMESTAMPDIFF(SECOND, SRC.resolved_at, 
			COALESCE( SRC.closed_at,SRC.sys_updated_on)) ,0) else '' end
	  else '' end
<> COALESCE(TRGT.resolve_to_close_duration ,'')