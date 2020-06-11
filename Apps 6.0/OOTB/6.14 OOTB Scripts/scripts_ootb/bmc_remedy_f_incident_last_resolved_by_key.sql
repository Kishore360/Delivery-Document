SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.last_resolved_by_key' ELSE 'SUCCESS' END as Message

FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_hpd_help_desk_final WHERE CDCTYPE<>'D') SRC

LEFT JOIN #MDS_TABLE_SCHEMA.hlx_hpd_audit_log_final audit_resolved
 ON SRC.Entry_ID = audit_resolved.Original_Request_ID
AND SRC.Last_Resolved_Date = audit_resolved.Audit_Date
/*and SRC.status = 'Resolved'*/
AND audit_resolved.Log like '%Status: Resolved%'
AND SRC.sourceinstance = audit_resolved.sourceinstance
LEFT JOIN #MDS_TABLE_SCHEMA.hlx_ctm_people_final resolved_by_lkp
 ON audit_resolved.User=resolved_by_lkp.Remedy_Login_ID
AND audit_resolved.sourceinstance=resolved_by_lkp.sourceinstance  
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map L
 ON (SRC.status=L.dimension_code
 AND SRC.sourceinstance=L.source_id AND L.dimension_class = 'STATE~INCIDENT' )
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',resolved_by_lkp.Person_ID) = LKP.row_id 
 AND SRC.sourceinstance = LKP.source_id )	
 LEFT JOIN #DWH_TABLE_SCHEMA.f_incident TRGT 
 ON (SRC.incident_number=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 
WHERE 
(case when L.dimension_wh_code in ('RESOLVED','CLOSED') and LKP.ROW_KEY IS NOT NULL THEN LKP.ROW_KEY
WHEN (L.dimension_wh_code not in ('RESOLVED','CLOSED') or L.dimension_wh_code is null)  THEN 0 
ELSE -1 end) <> COALESCE(TRGT.last_resolved_by_key ,'')