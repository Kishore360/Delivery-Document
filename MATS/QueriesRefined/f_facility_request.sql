


SELECT  row_key,row_id,source_id,etl_run_number,facility_request_key,opened_on_key,opened_time_key,opened_by_key,opened_by_department_key,location_key,configuration_item_key,closed_on_key,closed_by_key,due_on_key,state_src_code,approval_state_src_code,impact_src_code,urgency_src_code,priority_src_code,stage_src_code,category_src_code,sub_category_src_code,open_to_close_duration,time_worked,domain_key,company_key,assignment_group_key,assigned_to_key,approval_state_src_key,impact_src_key,priority_src_key,state_src_key,urgency_src_key,stage_src_key,category_src_key,sub_category_src_key,reassignment_count,age,age_key,reported_type_src_key,expected_start_on_key,expected_start_time_key,work_start_on_key,work_start_time_key,work_end_on_key,work_end_time_key,soft_deleted_flag,created_by,changed_by,created_on,changed_on,dw_inserted_on,dw_updated_on
FROM <<tenant>>_mdwdb.f_facility_request
ORDER BY row_key,row_id,source_id,etl_run_number,facility_request_key,opened_on_key,opened_time_key,opened_by_key,opened_by_department_key,location_key,configuration_item_key,closed_on_key,closed_by_key,due_on_key,state_src_code,approval_state_src_code,impact_src_code,urgency_src_code,priority_src_code,stage_src_code,category_src_code,sub_category_src_code,open_to_close_duration,time_worked,domain_key,company_key,assignment_group_key,assigned_to_key,approval_state_src_key,impact_src_key,priority_src_key,state_src_key,urgency_src_key,stage_src_key,category_src_key,sub_category_src_key,reassignment_count,age,age_key,reported_type_src_key,expected_start_on_key,expected_start_time_key,work_start_on_key,work_start_time_key,work_end_on_key,work_end_time_key,soft_deleted_flag,created_by,changed_by,created_on,changed_on,dw_inserted_on,dw_updated_on 
