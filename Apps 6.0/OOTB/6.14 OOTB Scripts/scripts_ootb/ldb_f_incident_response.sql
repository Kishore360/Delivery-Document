SELECT a.row_key, a.row_id, a.source_id, a.etl_run_number, (upper((a.task_type)))  AS task_type, a.incident_key, a.survey_key, a.sent_to_key, a.requested_on_key, a.requested_time_key, a.state, a.taken_by_key, a.taken_by_department_key, a.completed_on_key, a.survey_instance_key, a.updated_count, a.soft_deleted_flag, a.created_by, a.changed_by, a.created_on, a.changed_on, a.dw_inserted_on, a.dw_updated_on, i.assigned_to_key, i.opened_by_key, i.location_key, i.closed_on_key, i.opened_by_department_key, i.configuration_item_key, i.assignment_group_key, i.domain_key, i.problem_key, i.company_key, i.category_src_key, i.impact_src_key, i.priority_src_key, i.reported_type_src_key, i.severity_src_key, i.state_src_key, i.sub_category_src_key, i.urgency_src_key, i.age_key, i.close_code_src_key, i.dormancy_age_key, i.service_level_src_key, i.resolved_by_group_key, i.customer_key, i.caused_by_change_key, i.change_request_key, (NULL)(10,5) AS response_value, q.row_key AS question_key, (NULL ) (255) AS response FROM ((#DWH_TABLE_SCHEMA.f_task_survey a JOIN #DWH_TABLE_SCHEMA.f_incident i ON ((a.incident_key = i.incident_key))) JOIN #DWH_TABLE_SCHEMA.d_survey_question q ON ((a.survey_key = q.survey_key))) WHERE ((((a.survey_instance_key = 0) OR (a.survey_instance_key = -1)) AND (a.soft_deleted_flag = 'N')) AND (i.soft_deleted_flag = 'N')) UNION SELECT a.row_key, a.row_id, a.source_id, a.etl_run_number, (upper((a.task_type)))  AS task_type, a.incident_key, a.survey_key, a.sent_to_key, a.requested_on_key, a.requested_time_key, a.state, a.taken_by_key, a.taken_by_department_key, a.completed_on_key, a.survey_instance_key, a.updated_count, a.soft_deleted_flag, a.created_by, a.changed_by, a.created_on, a.changed_on, a.dw_inserted_on, a.dw_updated_on, i.assigned_to_key, i.opened_by_key, i.location_key, i.closed_on_key, i.opened_by_department_key, i.configuration_item_key, i.assignment_group_key, i.domain_key, i.problem_key, i.company_key, i.category_src_key, i.impact_src_key, i.priority_src_key, i.reported_type_src_key, i.severity_src_key, i.state_src_key, i.sub_category_src_key, i.urgency_src_key, i.age_key, i.close_code_src_key, i.dormancy_age_key, i.service_level_src_key, i.resolved_by_group_key, i.customer_key, i.caused_by_change_key, i.change_request_key, ((r.response_value))(10,5) AS response_value, COALESCE(r.question_key, (0)) AS question_key, (r.response) (255) AS response FROM ((#DWH_TABLE_SCHEMA.f_task_survey a JOIN #DWH_TABLE_SCHEMA.f_incident i ON ((a.incident_key = i.incident_key))) JOIN #DWH_TABLE_SCHEMA.f_response r ON ((a.survey_instance_key = r.survey_instance_key))) WHERE (((((a.survey_instance_key <> 0) AND (a.survey_instance_key <> -1)) AND (a.soft_deleted_flag = 'N')) AND (i.soft_deleted_flag = 'N')) AND (r.soft_deleted_flag = 'N'));
