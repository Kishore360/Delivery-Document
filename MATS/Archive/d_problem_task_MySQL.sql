


SELECT  row_key, row_dn_key, row_current_key, row_id, source_id, etl_run_number, problem_task_number, over_due_flag, linked_incident_count, known_error_flag, met_sla_flag, knowledge_flag, active_flag, domain_key, multiple_assignment_flag, reassignment_count, priority_escalated_flag, backlog_flag, soft_deleted_flag, created_by, changed_by, current_flag FROM #TABLE_SCHEMA.d_problem_task ORDER BY  row_key, row_dn_key, row_current_key, row_id, source_id, etl_run_number, problem_task_number, over_due_flag, linked_incident_count, known_error_flag, met_sla_flag, knowledge_flag, active_flag, domain_key, multiple_assignment_flag, reassignment_count, priority_escalated_flag, backlog_flag, soft_deleted_flag, created_by, changed_by, current_flag
