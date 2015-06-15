


SELECT  row_key, row_dn_key, row_current_key, row_id, source_id, etl_run_number, request_item_number, over_due_flag, active_flag, met_sla_flag, domain_key, first_call_resolution_flag, multiple_assignment_flag, reassignment_count, priority_escalated_flag, backlog_flag, soft_deleted_flag, created_by, changed_by, current_flag FROM <<tenant>>_mdwdb.d_request_item ORDER BY  row_key, row_dn_key, row_current_key, row_id, source_id, etl_run_number, request_item_number, over_due_flag, active_flag, met_sla_flag, domain_key, first_call_resolution_flag, multiple_assignment_flag, reassignment_count, priority_escalated_flag, backlog_flag, soft_deleted_flag, created_by, changed_by, current_flag
