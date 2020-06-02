 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_a_problem_smpo_dppc.caused_by_change_problems' ELSE 'SUCCESS' END as Message
FROM #STG_TABLE_SCHEMA.f_a_problem_smpo_dppc_base SRC
LEFT JOIN #DWH_TABLE_SCHEMA.f_a_problem_smpo_dppc  TRGT 
ON SRC.sys_id = TRGT.row_id 
and TRGT.soft_deleted_flag='N'
WHERE  COALESCE(SRC.caused_by_change_problems,'') <> COALESCE(TRGT.caused_by_change_problems, ''); 