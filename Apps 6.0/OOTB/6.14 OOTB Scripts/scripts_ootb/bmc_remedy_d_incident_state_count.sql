SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.state_counnt' ELSE 'SUCCESS' END as Message

FROM ( select incident_number, final.sourceinstance, 
count(case when audit_state.Fields_Changed like '%Status%' then 1 else 0 end) as count
FROM #MDS_TABLE_SCHEMA.hlx_hpd_help_desk_final final

LEFT JOIN #MDS_TABLE_SCHEMA.hlx_hpd_audit_log_final audit_state
 ON final.Entry_ID = audit_state.Original_Request_ID
 and audit_state.Fields_Changed like '%Status%'
AND final.sourceinstance = audit_state.sourceinstance
 WHERE final.CDCTYPE<>'D' group by incident_number, final.sourceinstance ) SRC

 LEFT JOIN #DWH_TABLE_SCHEMA.d_incident TRGT 
 ON (SRC.incident_number=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id ) 
 
WHERE 
COALESCE(SRC.count ,'') <> COALESCE(TRGT.state_count ,'')