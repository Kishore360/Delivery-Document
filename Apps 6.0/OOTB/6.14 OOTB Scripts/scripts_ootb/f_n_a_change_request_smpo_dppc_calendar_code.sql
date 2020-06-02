SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_n_a_change_request_smpo_dppc.calendar_code' ELSE 'SUCCESS' END as Message
FROM (select * from #STG_TABLE_SCHEMA.f_n_a_change_request_smpo_dppc_final_base where soft_deleted_flag = 'N')SRC
LEFT JOIN (select * from #DWH_TABLE_SCHEMA.f_n_a_change_request_smpo_dppc where soft_deleted_flag = 'N')TRGT 
ON (SRC.row_id = TRGT.row_id AND SRC.source_id=TRGT.source_id and SRC.n_key=TRGT.n_key)
WHERE COALESCE(SRC.calendar_code,-100)<> COALESCE(TRGT.calendar_code ,'');