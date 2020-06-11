SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_n_lov_snapshot_smpo_dppc.upper_range_value' ELSE 'SUCCESS' END as Message

FROM #STG_TABLE_SCHEMA.f_n_lov_snapshot_smpo_dppc_final_base_filtered SRC

LEFT JOIN #DWH_TABLE_SCHEMA.f_n_lov_snapshot_smpo_dppc TRGT 
ON (SRC.row_id = TRGT.row_id AND SRC.source_id=TRGT.source_id AND SRC.n_key=TRGT.n_key)
 
WHERE TRGT.soft_deleted_flag = 'N' and COALESCE(SRC.upper_range_value,'') <> COALESCE(TRGT.upper_range_value ,'');