


SELECT  row_key, row_dn_key, row_current_key, row_id, source_id, etl_run_number, sla_name, sla_condition, duration_type, sla_duration, active_flag,  domain_key, soft_deleted_flag, created_by, changed_by, current_flag FROM <<tenant>>_mdwdb.d_task_sla ORDER BY  row_key, row_dn_key, row_current_key, row_id, source_id, etl_run_number, sla_name, sla_condition, duration_type, sla_duration, active_flag,  domain_key, soft_deleted_flag, created_by, changed_by, current_flag
