SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.backlog_flag' ELSE 'SUCCESS' END as Message

FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_hpd_help_desk_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.d_lov_map L 
 ON (SRC.status=L.dimension_code
 AND SRC.sourceinstance=L.source_id AND L.dimension_class = 'STATE~INCIDENT' )

  LEFT JOIN #DWH_TABLE_SCHEMA.d_incident TRGT
  ON (SRC.incident_number=TRGT.row_id  AND SRC.sourceinstance=TRGT.source_id ) 
  
 WHERE (CASE WHEN L.dimension_wh_code IN ('OPEN') then 'Y' else 'N' end) <> COALESCE(TRGT.backlog_flag ,'');