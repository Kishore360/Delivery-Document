SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_n_a_request_item_smpo_dppc.update_count' ELSE 'SUCCESS' END as Message

FROM (select * from #STG_TABLE_SCHEMA.f_n_a_request_item_smpo_dppc_final_base where soft_deleted_flag = 'N') SRC 
 LEFT JOIN (select * from #DWH_TABLE_SCHEMA.f_n_a_request_item_smpo_dppc where soft_deleted_flag = 'N') TRGT 
 ON (SRC.row_id = TRGT.row_id AND SRC.source_id=TRGT.source_id AND SRC.n_key=TRGT.n_key)
 
WHERE COALESCE(SRC.update_count, 0)<> COALESCE(TRGT.update_count ,'');