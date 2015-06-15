


SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result , CASE WHEN COUNT(1) > 0 THEN 'Pass through columns from FS_PROBLEM_TASK to D_PROBLEM_TASK did not match' ELSE 'SUCCESS' END AS Message FROM #TABLE_SCHEMA.fs_problem_task WHERE CRC32(CONCAT( IFNULL(row_id,''), IFNULL(source_id,''), IFNULL(problem_task_number,''), IFNULL(opened_on,''), IFNULL(closed_on,''), IFNULL(due_on,''), IFNULL(over_due_flag,''), IFNULL(linked_incident_count,''), IFNULL(known_error_flag,''), IFNULL(knowledge_flag,''), IFNULL(active_flag,''), IFNULL(multiple_assignment_flag,''), IFNULL(reassignment_count,''), IFNULL(priority_escalated_flag,''), IFNULL(backlog_flag,''), IFNULL(soft_deleted_flag,''), IFNULL(created_by,''), IFNULL(changed_by,''), IFNULL(created_on,''), IFNULL(changed_on,''), IFNULL(description,''), IFNULL(short_description,''))) NOT IN (SELECT CRC32(CONCAT( IFNULL(row_id,''), IFNULL(source_id,''), IFNULL(problem_task_number,''), IFNULL(opened_on,''), IFNULL(closed_on,''), IFNULL(due_on,''), IFNULL(over_due_flag,''), IFNULL(linked_incident_count,''), IFNULL(known_error_flag,''), IFNULL(knowledge_flag,''), IFNULL(active_flag,''), IFNULL(multiple_assignment_flag,''), IFNULL(reassignment_count,''), IFNULL(priority_escalated_flag,''), IFNULL(backlog_flag,''), IFNULL(soft_deleted_flag,''), IFNULL(created_by,''), IFNULL(changed_by,''), IFNULL(created_on,''), IFNULL(changed_on,''), IFNULL(description,''), IFNULL(short_description,''))) FROM #TABLE_SCHEMA.d_problem_task)
