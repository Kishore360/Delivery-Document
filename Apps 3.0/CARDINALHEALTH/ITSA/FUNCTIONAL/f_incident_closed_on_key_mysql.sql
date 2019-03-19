SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.closed_on_key' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.incident_final SRC
 LEFT JOIN cardinalhealth_mdwdb.d_lov_map L
 ON (concat('STATE~INCIDENT~~~',upper(SRC.incident_state))=L.src_rowid
 AND SRC.sourceinstance=L.source_id )
 LEFT JOIN cardinalhealth_mdwdb.f_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN  app_test.lsm_ls_source_timezone L 
ON (SRC.sourceinstance  = L.sourceid )
LEFT JOIN cardinalhealth_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(COALESCE( SRC.closed_at,SRC.sys_updated_on),source_time_zone,target_time_zone),'%Y%m%d') 
	and LKP.source_id=0)
WHERE CASE WHEN L.dimension_wh_code='CLOSED' THEN COALESCE(LKP.row_key,0) ELSE 0 END 
<> COALESCE(TRGT.closed_on_key,'')
