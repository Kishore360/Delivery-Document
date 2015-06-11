


SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result , CASE WHEN COUNT(1) > 0 THEN 'Pass through columns from FS_PROBLEM to F_PROBLEM did not match' ELSE 'SUCCESS' END AS Message FROM <<tenant>>_mdwdb.fs_problem WHERE CRC32(CONCAT( IFNULL(row_id,''), IFNULL(source_id,''), IFNULL(problem_number,''), IFNULL(over_due_flag,''), IFNULL(reported_type_src_code,''), IFNULL(category_src_code,''), IFNULL(sub_category_src_code,''), IFNULL(state_src_code,''), IFNULL(linked_incident_count,''), IFNULL(known_error_flag,''), IFNULL(change_flag,''), IFNULL(met_sla_flag,''), IFNULL(knowledge_flag,''), IFNULL(active_flag,''), IFNULL(impact_src_code,''), IFNULL(urgency_src_code,''), IFNULL(severity_src_code,''), IFNULL(priority_src_code,''), IFNULL(open_to_resolve_duration,''), IFNULL(resolve_to_close_duration,''), IFNULL(open_to_close_duration,''), IFNULL(time_worked,''), IFNULL(multiple_assignment_flag,''), IFNULL(reassignment_count,''), IFNULL(priority_escalated_flag,''), IFNULL(backlog_flag,''), IFNULL(soft_deleted_flag,''), IFNULL(created_by,''), IFNULL(changed_by,''), IFNULL(created_on,''), IFNULL(changed_on,''))) NOT IN (SELECT CRC32(CONCAT( IFNULL(row_id,''), IFNULL(source_id,''), IFNULL(problem_number,''), IFNULL(over_due_flag,''), IFNULL(reported_type_src_code,''), IFNULL(category_src_code,''), IFNULL(sub_category_src_code,''), IFNULL(state_src_code,''), IFNULL(linked_incident_count,''), IFNULL(known_error_flag,''), IFNULL(change_flag,''), IFNULL(met_sla_flag,''), IFNULL(knowledge_flag,''), IFNULL(active_flag,''), IFNULL(impact_src_code,''), IFNULL(urgency_src_code,''), IFNULL(severity_src_code,''), IFNULL(priority_src_code,''), IFNULL(open_to_resolve_duration,''), IFNULL(resolve_to_close_duration,''), IFNULL(open_to_close_duration,''), IFNULL(time_worked,''), IFNULL(multiple_assignment_flag,''), IFNULL(reassignment_count,''), IFNULL(priority_escalated_flag,''), IFNULL(backlog_flag,''), IFNULL(soft_deleted_flag,''), IFNULL(created_by,''), IFNULL(changed_by,''), IFNULL(created_on,''), IFNULL(changed_on,''))) FROM <<tenant>>_mdwdb.f_problem)
