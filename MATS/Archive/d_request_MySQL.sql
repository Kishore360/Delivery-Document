


SELECT  row_key, row_dn_key, row_current_key, row_id, source_id, etl_run_number, request_number, over_due_flag, priority_escalated_flag, first_call_resolution_flag, met_sla_flag, active_flag, domain_key, multiple_assignment_flag, reassignment_count, dormant_flag, backlog_flag, soft_deleted_flag, created_by, changed_by, current_flag FROM #TABLE_SCHEMA.d_request ORDER BY  row_key, row_dn_key, row_current_key, row_id, source_id, etl_run_number, request_number, over_due_flag, priority_escalated_flag, first_call_resolution_flag, met_sla_flag, active_flag, domain_key, multiple_assignment_flag, reassignment_count, dormant_flag, backlog_flag, soft_deleted_flag, created_by, changed_by, current_flag
