


SELECT  row_key, row_id, source_id, etl_run_number, response_value, response, updated_count, survey_instance_key, question_key, soft_deleted_flag, created_by, changed_by, created_on, changed_on, dw_inserted_on, dw_updated_on FROM #TABLE_SCHEMA.f_response ORDER BY  row_key, row_id, source_id, etl_run_number, response_value, response, updated_count, survey_instance_key, question_key, soft_deleted_flag, created_by, changed_by, created_on, changed_on, dw_inserted_on, dw_updated_on
