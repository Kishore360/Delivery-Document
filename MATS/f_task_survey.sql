select case when count(1)<1 then 'Failure' else 'Success' end as Result,
case when count(1)<1 then 'No records found' else 'Records found' end as Message from
(SELECT  row_key, row_id, source_id, etl_run_number, task_type, incident_key, problem_key, request_key, request_item_key, request_task_key, problem_task_key, survey_key, sent_to_key, requested_on_key, requested_time_key, state, taken_by_key, taken_by_department_key, completed_on_key, survey_instance_key, updated_count, soft_deleted_flag, created_by, changed_by, created_on, changed_on, dw_inserted_on, dw_updated_on FROM <<tenant>>_mdwdb.f_task_survey ORDER BY  row_key, row_id, source_id, etl_run_number, task_type, incident_key, problem_key, request_key, request_item_key, request_task_key, problem_task_key, survey_key, sent_to_key, requested_on_key, requested_time_key, state, taken_by_key, taken_by_department_key, completed_on_key, survey_instance_key, updated_count, soft_deleted_flag, created_by, changed_by, created_on, changed_on, dw_inserted_on, dw_updated_on) a;
