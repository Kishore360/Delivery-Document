select case when count(1)<1 then 'Failure' else 'Success' end as Result,
case when count(1)<1 then 'No records found' else 'Records found' end as Message from
(SELECT  row_key, row_id, source_id, etl_run_number, response_value, response, updated_count, survey_instance_key, question_key, soft_deleted_flag, created_by, changed_by, created_on, changed_on, dw_inserted_on, dw_updated_on FROM <<tenant>>_mdwdb.f_response )a ;
