select case when count(1)<1 then 'Failure' else 'Success' end as Result,
case when count(1)<1 then 'No records found' else 'Records found' end as Message from
(SELECT  row_key, row_id, source_id, etl_run_number, task_type, sla_key, incident_key, problem_key, request_key, request_item_key, request_task_key, problem_task_key, start_on_key, start_time_key, due_on_key, end_on_key, stage_src_key, stage_src_code, outcome_flag, actual_duration, percentage_taken, pause_duration, soft_deleted_flag, created_by, changed_by FROM <<tenant>>_mdwdb.f_task_sla ) a;
