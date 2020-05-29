SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.closed_by_key' ELSE 'SUCCESS' END as Message

FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_hpd_help_desk_final WHERE CDCTYPE<>'D') SRC

LEFT JOIN #MDS_TABLE_SCHEMA.hlx_hpd_audit_log_final audit_closed
 ON SRC.Entry_ID = audit_closed.Original_Request_ID
AND SRC.Closed_Date = audit_closed.Audit_Date
AND audit_closed.Log like '%Status: Closed%'
AND SRC.sourceinstance = audit_closed.sourceinstance
LEFT JOIN #MDS_TABLE_SCHEMA.hlx_ctm_people_final closed_by_lkp
 ON audit_closed.User=closed_by_lkp.Remedy_Login_ID
AND audit_closed.sourceinstance=closed_by_lkp.sourceinstance  
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map L
 ON (SRC.status=L.dimension_code
 AND SRC.sourceinstance=L.source_id AND L.dimension_class = 'STATE~INCIDENT' )
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',closed_by_lkp.Person_ID) = LKP.row_id 
 AND SRC.sourceinstance = LKP.source_id )	
 LEFT JOIN #DWH_TABLE_SCHEMA.f_incident TRGT 
 ON (SRC.incident_number=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 
WHERE 
(case when L.dimension_wh_code='CLOSED' and LKP.ROW_KEY IS NOT NULL THEN LKP.ROW_KEY
WHEN (L.dimension_wh_code<>'CLOSED' or L.dimension_wh_code is null)  THEN 0 
ELSE -1 end)
<> COALESCE(TRGT.closed_by_key ,'')