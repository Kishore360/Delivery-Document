SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_a_incident_smpo_dppc.generic_ci_incidents' ELSE 'SUCCESS' END as Message

FROM #STG_TABLE_SCHEMA.f_a_incident_smpo_dppc_base SRC

LEFT JOIN #DWH_TABLE_SCHEMA.f_a_incident_smpo_dppc TRGT 
ON (SRC.assignment_group_key = TRGT.assignment_group_key AND SRC.assigned_to_key=TRGT.assigned_to_key AND SRC.calendar_date_key=TRGT.calendar_date_key AND SRC.source_id=TRGT.source_id)
 
WHERE TRGT.soft_deleted_flag = 'N' and COALESCE(SRC.generic_ci_incidents,0) <> COALESCE(TRGT.generic_ci_incidents ,'');