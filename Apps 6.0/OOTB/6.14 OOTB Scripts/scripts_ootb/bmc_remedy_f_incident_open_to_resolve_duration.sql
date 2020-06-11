 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_hpd_help_desk_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_incident TRGT 
 ON (SRC.incident_number=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE case WHEN (SRC.Submit_Date is null or SRC.last_resolved_date is null) THEN ''
 WHEN  (timestampdiff(second,SRC.Submit_Date,SRC.last_resolved_date)) < 0 THEN NULL 
 ELSE (timestampdiff(second,SRC.Submit_Date,SRC.last_resolved_date)) END <> COALESCE(TRGT.open_to_resolve_duration,'');