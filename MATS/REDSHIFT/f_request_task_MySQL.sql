select case when count(1)<1 then 'Failure' else 'Success' end as Result,
case when count(1)<1 then 'No records found' else 'Records found' end as Message from
(

SELECT  row_key, row_id, source_id, etl_run_number, request_key, request_item_key, request_task_key, opened_on_key, opened_time_key, opened_by_key, opened_by_department_key, location_key, configuration_item_key, assignment_group_key, assigned_to_key, closed_on_key, closed_by_key, due_on_key,  state_src_code, impact_src_code, urgency_src_code, priority_src_code, open_to_close_duration, reassignment_count, time_worked, domain_key, company_key, impact_src_key, priority_src_key, state_src_key, urgency_src_key, created_by, changed_by FROM <<tenant>>_mdwdb.f_request_task 
) a;