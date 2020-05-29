SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_n_a_incident_smpo_dppc.minor_incidents_met_all_slas' ELSE 'SUCCESS' END as Message

FROM #STG_TABLE_SCHEMA.f_n_a_incident_smpo_dppc_final_base SRC

LEFT JOIN #DWH_TABLE_SCHEMA.f_n_a_incident_smpo_dppc TRGT 
ON (SRC.row_id = TRGT.row_id AND SRC.source_id=TRGT.source_id AND SRC.n_key=TRGT.n_key)
 
WHERE TRGT.soft_deleted_flag = 'N' and COALESCE(SRC.minor_incidents_met_all_slas,0) <> COALESCE(TRGT.minor_incidents_met_all_slas ,'');