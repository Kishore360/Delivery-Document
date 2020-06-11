SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_a_request_item_smpo_dppc.generic_ci_request_item' ELSE 'SUCCESS' END as Message

FROM (select * from #STG_TABLE_SCHEMA.f_a_request_item_smpo_dppc_base where soft_deleted_flag = 'N') SRC 
 LEFT JOIN (select * from #DWH_TABLE_SCHEMA.f_a_request_item_smpo_dppc where soft_deleted_flag = 'N') TRGT 
 ON (SRC.sys_id = TRGT.row_id AND SRC.source_id=TRGT.source_id)
 
WHERE COALESCE(SRC.generic_ci_request_item, 0)<> COALESCE(TRGT.generic_ci_request_item ,'');