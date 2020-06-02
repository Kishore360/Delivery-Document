SELECT a.row_key, a.row_id, a.source_id, a.etl_run_number, upper((a.task_type)) AS task_type, a.incident_key, a.survey_key, a.sent_to_key, a.requested_on_key, a.requested_time_key, a.state, a.taken_by_key, a.taken_by_department_key, a.completed_on_key, a.survey_instance_key, a.updated_count, a.soft_deleted_flag, a.created_by, a.changed_by, a.created_on, a.changed_on, a.dw_inserted_on, a.dw_updated_on, i.assigned_to_key, i.opened_by_key, i.location_key, i.closed_on_key FROM (#DWH_TABLE_SCHEMA.f_task_survey a JOIN #DWH_TABLE_SCHEMA.f_incident i ON ((a.incident_key = i.incident_key))) WHERE (a.soft_deleted_flag = 'N');
