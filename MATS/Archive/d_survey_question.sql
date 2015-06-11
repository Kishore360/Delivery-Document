


SELECT  row_key, row_dn_key, row_current_key, row_id, source_id, etl_run_number, active_flag, question, question_order, min_value, MAX_VALUE, question_type_src_code, question_type_src_key, updated_count, effective_from, effective_to, current_flag, created_by, changed_by, created_on, changed_on, soft_deleted_flag, dw_inserted_on, dw_updated_on FROM #TABLE_SCHEMA.d_survey_question ORDER BY  row_key, row_dn_key, row_current_key, row_id, source_id, etl_run_number, active_flag, question, question_order, min_value, MAX_VALUE, question_type_src_code, question_type_src_key, updated_count, effective_from, effective_to, current_flag, created_by, changed_by, created_on, changed_on, soft_deleted_flag, dw_inserted_on, dw_updated_on
