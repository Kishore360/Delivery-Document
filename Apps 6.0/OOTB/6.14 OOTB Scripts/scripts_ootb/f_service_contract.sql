
SELECT row_id,source_id,etl_run_number,row_key,soft_deleted_flag,created_by,changed_by,created_on,changed_on,customer_account_key,location_key,product_model_key,service_contract_key FROM #DWH_TABLE_SCHEMA.f_service_contract 
ORDER BY row_id,source_id,etl_run_number,row_key,soft_deleted_flag,created_by,changed_by,created_on,changed_on,customer_account_key,location_key,product_model_key,service_contract_key
