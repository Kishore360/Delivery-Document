SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_hpd_help_desk_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_incident TRGT 
 ON (SRC.incident_number=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE case WHEN (SRC.last_resolved_date is null or SRC.closed_date is null) THEN ''
 WHEN  (timestampdiff(second,SRC.last_resolved_date,SRC.closed_date)) < 0 THEN NULL 
 ELSE (timestampdiff(second,SRC.last_resolved_date,SRC.closed_date)) END <> COALESCE(TRGT.resolve_to_close_duration,'');