SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_n_a_change_request_smpo_dppc.row_count' ELSE 'SUCCESS' END as Message
FROM (select count(*) SRC_COUNT,source_id from #STG_TABLE_SCHEMA.f_n_a_change_request_smpo_dppc_final_base where soft_deleted_flag = 'N')SRC,
(select count(*) TRGT_COUNT,source_id from #DWH_TABLE_SCHEMA.f_n_a_change_request_smpo_dppc where soft_deleted_flag = 'N')TRGT 
where (SRC.SRC_COUNT <> TRGT.TRGT_COUNT AND SRC.source_id=TRGT.source_id)