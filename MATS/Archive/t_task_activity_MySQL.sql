


SELECT  row_key, row_id, source_id, etl_run_number, task_key, task_wh_type, task_attribute_wh_name, task_attribute_wh_old_value, task_attribute_wh_new_value, update_reason, update_count, task_row_id, created_on_key, created_time_key, soft_deleted_flag, updated_by, created_by FROM #TABLE_SCHEMA.t_task_activity ORDER BY  row_key, row_id, source_id, etl_run_number, task_key, task_wh_type, task_attribute_wh_name, task_attribute_wh_old_value, task_attribute_wh_new_value, update_reason, update_count, task_row_id, created_on_key, created_time_key, soft_deleted_flag, updated_by, created_by
