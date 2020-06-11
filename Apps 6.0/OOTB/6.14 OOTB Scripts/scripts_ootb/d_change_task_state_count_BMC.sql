SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_task.state_count' ELSE 'SUCCESS' END as Message
FROM ( select Task_ID, final.sourceinstance, 
count(case when audit_state.Fields_Changed like '%Status%' then 1 else 0 end) as src_state_count from
(select * FROM #MDS_TABLE_SCHEMA.hlx_tms_task_final WHERE RootRequestFormName='CHG:Infrastructure Change') final
LEFT JOIN  #MDS_TABLE_SCHEMA.hlx_chg_audit_log_final audit_state
 ON final.Task_ID = audit_state.Original_Request_ID
 and audit_state.Fields_Changed like '%Status%'
AND final.sourceinstance = audit_state.sourceinstance
 WHERE final.CDCTYPE<>'D' group by Task_ID, final.sourceinstance ) SRC
 LEFT JOIN #DWH_TABLE_SCHEMA.d_change_task TRGT 
 ON (SRC.Task_ID=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id ) 
WHERE COALESCE(SRC.src_state_count ,'') <> COALESCE(TRGT.state_count ,'')