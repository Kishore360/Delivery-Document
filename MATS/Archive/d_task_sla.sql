


SELECT  row_key, row_dn_key, row_current_key, row_id, source_id, etl_run_number, sla_name, sla_condition, duration_type, sla_duration, active_flag, sla_category, domain_key, soft_deleted_flag, created_by, changed_by, created_on, changed_on, current_flag, effective_from, effective_to, dw_inserted_on, dw_updated_on FROM #TABLE_SCHEMA.d_task_sla ORDER BY  row_key, row_dn_key, row_current_key, row_id, source_id, etl_run_number, sla_name, sla_condition, duration_type, sla_duration, active_flag, sla_category, domain_key, soft_deleted_flag, created_by, changed_by, created_on, changed_on, current_flag, effective_from, effective_to, dw_inserted_on, dw_updated_on
