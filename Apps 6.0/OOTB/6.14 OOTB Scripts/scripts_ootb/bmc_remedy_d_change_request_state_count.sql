SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.conflict_status' ELSE 'SUCCESS' END as Message
FROM ( select infrastructure_change_id, final.sourceinstance, 
count(case when audit_state.Fields_Changed like '%Status%' then 1 else 0 end) as src_state_count
FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final final
LEFT JOIN  #MDS_TABLE_SCHEMA.hlx_chg_audit_log_final audit_state
 ON final.infrastructure_change_id = audit_state.Original_Request_ID
 and audit_state.Fields_Changed like '%Status%'
AND final.sourceinstance = audit_state.sourceinstance
 WHERE final.CDCTYPE<>'D' group by infrastructure_change_id, final.sourceinstance ) SRC
 LEFT JOIN #DWH_TABLE_SCHEMA.d_change_request TRGT 
 ON (SRC.infrastructure_change_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id ) 
WHERE COALESCE(SRC.src_state_count ,'') <> COALESCE(TRGT.state_count ,'')