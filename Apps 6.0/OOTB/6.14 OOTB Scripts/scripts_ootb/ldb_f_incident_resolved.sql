SELECT FI.opened_time_key, FI.open_to_resolve_duration, FI.last_resolved_on_key, FI.reopened_count, FI.changed_by, FI.urgency_src_code, FI.sub_category_src_code, FI.outage_start_time_key, FI.reassignment_count, FI.pivot_date, FI.customer_key, FI.dormancy_age, FI.secondary1_changed_on, FI.service_level_src_code, FI.urgency_src_key, FI.time_worked, FI.state_src_key, FI.secondary2_changed_on, FI.outage_end_on_key, FI.incident_number, FI.priority_src_code, FI.company_key, FI.resolved_by_group_key, FI.problem_key, FI.severity_src_key, FI.category_src_key, FI.outage_start_on_key, FI.priority_src_key, FI.sub_category_src_key, FI.caused_by_change_key, FI.location_key, FI.opened_on_key, FI.cdctype, FI.state_src_code, FI.soft_deleted_flag, FI.dw_inserted_on, FI.domain_key, FI.row_id, FI.due_on_key, FI.created_on, FI.dormancy_age_key, FI.incident_key, FI.closed_on_key, FI.category_src_code, FI.row_key, FI.open_to_close_duration, FI.reported_type_src_key, FI.outage_duration, FI.change_request_key, FI.dw_updated_on, FI.close_code_src_key, FI.assignment_group_key, FI.last_resolved_by_key, FI.configuration_item_key, FI.etl_run_number, FI.severity_src_code, FI.grand_parent_incident_key, FI.reported_type_src_code, FI.opened_by_key, FI.opened_by_department_key, FI.created_by, FI.resolve_to_close_duration, FI.business_service_key, FI.closed_by_key, FI.parent_incident_key, FI.child_incidents, FI.source_id, FI.impact_src_key, FI.age, FI.close_code_src_code, FI.changed_on, FI.impact_src_code, FI.assigned_to_key, FI.outage_end_time_key, FI.service_level_src_key, FI.age_key FROM (#DWH_TABLE_SCHEMA.f_incident  FI JOIN #DWH_TABLE_SCHEMA.d_lov a12 ON (((FI.state_src_key = a12.row_key) AND (FI.soft_deleted_flag = 'N')))) WHERE (((a12.wh_dimension_code) = 'RESOLVED') OR ((a12.wh_dimension_code) = 'CLOSED'));
