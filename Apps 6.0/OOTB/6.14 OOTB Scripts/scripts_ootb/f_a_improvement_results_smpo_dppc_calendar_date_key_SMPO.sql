SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_a_improvement_results_smpo_dppc.month_key' ELSE 'SUCCESS' END as Message
FROM #STG_TABLE_SCHEMA.f_a_improvement_results_smpo_dppc_base SRC
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_a_improvement_results_smpo_dppc TRGT 
 ON (SRC.assignment_group_key = TRGT.assignment_group_key AND SRC.assigned_to_key=TRGT.assigned_to_key AND SRC.month_key=TRGT.month_key AND SRC.source_id=TRGT.source_id)
 
WHERE TRGT.soft_deleted_flag = 'N' and COALESCE(SRC.month_key, -1)<> COALESCE(TRGT.month_key ,'');