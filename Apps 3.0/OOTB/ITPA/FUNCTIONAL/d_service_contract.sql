
SELECT row_id,source_id,etl_run_number,row_key,soft_deleted_flag,created_by,changed_by,created_on,changed_on,customer_account_key,location_key,product_model_key,service_contract_keyrow_id,source_id,etl_run_number,row_key,soft_deleted_flag,created_by,changed_by,created_on,changed_on,active_flag,auto_renew_flag,description,short_description,state_src_key,sub_state_src_key,contract_start_on,contract_end_on,renewal_start_on,renewal_end_on,contract_number,contract_expiry_age,contract_expiry_age_key FROM <<tenant>>_mdwdb.d_service_contract 
ORDER BY row_id,source_id,etl_run_number,row_key,soft_deleted_flag,created_by,changed_by,created_on,changed_on,customer_account_key,location_key,product_model_key,service_contract_keyrow_id,source_id,etl_run_number,row_key,soft_deleted_flag,created_by,changed_by,created_on,changed_on,active_flag,auto_renew_flag,description,short_description,state_src_key,sub_state_src_key,contract_start_on,contract_end_on,renewal_start_on,renewal_end_on,contract_number,contract_expiry_age,contract_expiry_age_key
