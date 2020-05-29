 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_n_a_problem_smpo_dppc.assignment_group_key' ELSE 'SUCCESS' END as Message
FROM   #STG_TABLE_SCHEMA.f_n_a_problem_smpo_dppc_final_base SRC
LEFT JOIN  #DWH_TABLE_SCHEMA.f_n_a_problem_smpo_dppc  TRGT 
ON SRC.row_id = TRGT.row_id 
and TRGT.soft_deleted_flag='N'
and SRC.n_key=TRGT.n_key 
WHERE  COALESCE(SRC.assignment_group_key,'') <> COALESCE(TRGT.assignment_group_key, ''); 