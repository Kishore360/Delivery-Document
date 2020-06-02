
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.closed_on_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.bmc_incident_final WHERE CDCTYPE<>'D') SRC
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map L
 ON (concat('STATE~INCIDENT~',upper(SRC.state))=L.src_rowid
 AND SRC.sourceinstance=L.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.f_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP 
on (LKP.row_id = date_format(COALESCE( SRC.closed_at,SRC.sys_updated_on),'%Y%m%d') 
	and LKP.source_id=0)
WHERE CASE WHEN L.dimension_wh_code='CLOSED' THEN LKP.row_key ELSE 0 END 
<> COALESCE(TRGT.closed_on_key,'')
