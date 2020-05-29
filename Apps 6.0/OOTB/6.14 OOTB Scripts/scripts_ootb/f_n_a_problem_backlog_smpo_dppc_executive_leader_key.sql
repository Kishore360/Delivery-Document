 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_n_a_problem_backlog_smpo_dppc.executive_leader_key' ELSE 'SUCCESS' END as Message
FROM #STG_TABLE_SCHEMA.f_n_a_problem_backlog_smpo_dppc_final_base SRC
LEFT JOIN #DWH_TABLE_SCHEMA.f_n_a_problem_backlog_smpo_dppc  TRGT 
ON SRC.row_id = TRGT.row_id 
and SRC.n_key=TRGT.n_key
and TRGT.soft_deleted_flag='N'
WHERE  COALESCE(SRC.executive_leader_key,'') <> COALESCE(TRGT.executive_leader_key, ''); 