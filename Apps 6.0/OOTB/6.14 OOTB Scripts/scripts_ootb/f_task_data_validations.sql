SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task' 
 ELSE 'SUCCESS' END as Message FROM 
 (
select
min(src) as difference
,	changed_by
,	created_by
,	row_id
,	source_id
,	reassignment_count
,	update_count
,	age
,	pivot_date
,	changed_on
,	dw_inserted_on
,	created_on
,	secondary1_changed_on
,	dw_updated_on
,	secondary2_changed_on
,	cdctype
,	soft_deleted_flag
,	business_duration
-- ,	etl_run_number
,	due_on_key
,	assigned_to_key
,	time_worked
,	opened_on_key
,	application_key
,	age_key
,	configuration_item_key
,	opened_by_key
,	assignment_group_key
,	business_service_key
,	open_to_close_duration
-- ,	task_key
,	opened_by_department_key
,	location_key
-- ,	row_key
,	opened_time_key
,	closed_on_key
,	closed_by_key
from (
select
'SRC_TEST' as src
,	changed_by
,	created_by
,	row_id
,	source_id
,	reassignment_count
,	update_count
,	age
,	pivot_date
,	changed_on
,	dw_inserted_on
,	created_on
,	secondary1_changed_on
,	dw_updated_on
,	secondary2_changed_on
,	cdctype
,	soft_deleted_flag
,	business_duration
-- ,	etl_run_number
,	due_on_key
,	assigned_to_key
,	time_worked
,	opened_on_key
,	application_key
,	age_key
,	configuration_item_key
,	opened_by_key
,	assignment_group_key
,	business_service_key
,	open_to_close_duration
-- ,	task_key
,	opened_by_department_key
,	location_key
-- ,	row_key
,	opened_time_key
,	closed_on_key
,	closed_by_key
from (
select 
	changed_by
,	created_by
,	row_id
,	source_id
,	reassignment_count
,0 as	update_count
,	change_request_age as age
,	pivot_date
,	changed_on
,	dw_inserted_on
,	created_on
,	secondary1_changed_on
,	dw_updated_on
,	secondary2_changed_on
,	cdctype
,	soft_deleted_flag
 ,	0 as business_duration
-- ,	etl_run_number
,	due_on_key
,	assigned_to_key
,	time_worked
,	opened_on_key
,	application_key
 ,change_request_age_key as	age_key
,	configuration_item_key
,	opened_by_key
,	assignment_group_key
,	business_service_key
,	open_to_close_duration
-- ,	task_key
 , 0 as	opened_by_department_key
,	location_key
-- ,	row_key
,	opened_time_key
,	closed_on_key
,	closed_by_key
from #DWH_TABLE_SCHEMA.f_change_request
union
select 
changed_by
,	created_by
,	row_id
,	source_id
,	reassignment_count
,	0 as update_count
,	age
,	pivot_date
,	changed_on
,	dw_inserted_on
,	created_on
,	secondary1_changed_on
,	dw_updated_on
,	secondary2_changed_on
,	cdctype
,	soft_deleted_flag
,	0 as business_duration
-- ,	etl_run_number
,	due_on_key
,	assigned_to_key
,	time_worked
,	opened_on_key
,	0 as application_key
,	age_key
,	configuration_item_key
,	opened_by_key
,	assignment_group_key
,	0 as business_service_key
,	open_to_close_duration
-- ,	task_key
,	opened_by_department_key
,	location_key
-- ,	row_key
,	opened_time_key
,	closed_on_key
,	closed_by_key
from #DWH_TABLE_SCHEMA.f_request
union
select
	changed_by
,	created_by
,	row_id
,	source_id
,	reassignment_count
,0 as	update_count
,	age
,	pivot_date
,	changed_on
,	dw_inserted_on
,	created_on
,	secondary1_changed_on
,	dw_updated_on
,	secondary2_changed_on
,	cdctype
,	soft_deleted_flag
,	business_duration
-- ,	etl_run_number
,	due_on_key
,	assigned_to_key
,	time_worked
,	opened_on_key
,0 as	application_key
,0 as 	age_key
,	configuration_item_key
,	opened_by_key
,	assignment_group_key
,0 as	business_service_key
,	open_to_close_duration
-- ,	task_key
,	opened_by_department_key
,	location_key
-- ,	row_key
,	opened_time_key
,	closed_on_key
,	closed_by_key

from #DWH_TABLE_SCHEMA.f_request_item
union
select
	changed_by
,	created_by
,	row_id
,	source_id
,	reassignment_count
,0 as	update_count
,	age
,	pivot_date
,	changed_on
,	dw_inserted_on
,	created_on
,	secondary1_changed_on
,	dw_updated_on
,	secondary2_changed_on
,	cdctype
,	soft_deleted_flag
,	business_duration
-- ,	etl_run_number
,	due_on_key
,	assigned_to_key
,	time_worked
,	opened_on_key
,0 as 	application_key
,0 as 	age_key
,	configuration_item_key
,	opened_by_key
,	assignment_group_key
,0 as	business_service_key
,	open_to_close_duration
-- ,	task_key
,	opened_by_department_key
,	location_key
-- ,	row_key
,	opened_time_key
,	closed_on_key
,	closed_by_key

from #DWH_TABLE_SCHEMA.f_request_task
union
select
	changed_by
,	created_by
,	row_id
,	source_id
,	reassignment_count
,update_count
,	age
,	pivot_date
,	changed_on
,	dw_inserted_on
,	created_on
,	secondary1_changed_on
,	dw_updated_on
,	secondary2_changed_on
,	cdctype
,	soft_deleted_flag
,	business_duration
-- ,	etl_run_number
,	due_on_key
,	assigned_to_key
,	time_worked
,	opened_on_key
,	application_key
,	age_key
,	configuration_item_key
,	opened_by_key
,	assignment_group_key
,	business_service_key
,	open_to_close_duration
-- ,	task_key
,	opened_by_department_key
,	location_key
-- ,	row_key
,	opened_time_key
,	closed_on_key
,	closed_by_key
from #DWH_TABLE_SCHEMA.f_problem_task
union
select
	changed_by
,	created_by
,	row_id
,	source_id
,	reassignment_count
,0 as	update_count
,	age
,	pivot_date
,	changed_on
,	dw_inserted_on
,	created_on
,	secondary1_changed_on
,	dw_updated_on
,	secondary2_changed_on
,	cdctype
,	soft_deleted_flag
,0 as	business_duration
-- ,	etl_run_number
,	due_on_key
,	assigned_to_key
,	time_worked
,	opened_on_key
,	application_key
,0 as	age_key
,	configuration_item_key
,	opened_by_key
,	assignment_group_key
,	business_service_key
,	open_to_close_duration
-- ,	task_key
,	opened_by_department_key
,	location_key
-- ,	row_key
,	opened_time_key
,	closed_on_key
,	closed_by_key

from #DWH_TABLE_SCHEMA.f_problem
union
select
	changed_by
,	created_by
,	row_id
,	source_id
,	reassignment_count
,	update_count
,	age
,	pivot_date
,	changed_on
,	dw_inserted_on
,	created_on
,	secondary1_changed_on
,	dw_updated_on
,	secondary2_changed_on
,	cdctype
,	soft_deleted_flag
,0 as	business_duration
-- ,	etl_run_number
,	due_on_key
,	assigned_to_key
,	time_worked
,	opened_on_key
,	application_key
,	age_key
,	configuration_item_key
,	opened_by_key
,	assignment_group_key
,	business_service_key
,	open_to_close_duration
-- ,	task_key
,	opened_by_department_key
,	location_key
-- ,	row_key
,	opened_time_key
,	closed_on_key
,	closed_by_key
from #DWH_TABLE_SCHEMA.f_incident
union
select
	changed_by
,	created_by
,	row_id
,	source_id
,	reassignment_count
,	update_count
,	age
,	pivot_date
,	changed_on
,	dw_inserted_on
,	created_on
,	secondary1_changed_on
,	dw_updated_on
,	secondary2_changed_on
,	cdctype
,	soft_deleted_flag
,business_duration
-- ,	etl_run_number
,	due_on_key
,	assigned_to_key
,	time_worked
,	opened_on_key
,	application_key
,	age_key
,	configuration_item_key
,	opened_by_key
,	assignment_group_key
,	business_service_key
,	open_to_close_duration
-- ,	task_key
,0 as	opened_by_department_key
,	location_key
-- ,	row_key
,	opened_time_key
,	closed_on_key
,	closed_by_key

from   #DWH_TABLE_SCHEMA.f_change_task

)SRC
union all
select
'TRGT_TEST' as src
,	changed_by
,	created_by
,	row_id
,	source_id
,	reassignment_count
,	update_count
,	age
,	pivot_date
,	changed_on
,	dw_inserted_on
,	created_on
,	secondary1_changed_on
,	dw_updated_on
,	secondary2_changed_on
,	cdctype
,	soft_deleted_flag
,	business_duration
-- ,	etl_run_number
,	due_on_key
,	assigned_to_key
,	time_worked
,	opened_on_key
,	application_key
,	age_key
,	configuration_item_key
,	opened_by_key
,	assignment_group_key
,	business_service_key
,	open_to_close_duration
-- ,	task_key
,	opened_by_department_key
,	location_key
-- ,	row_key
,	opened_time_key
,	closed_on_key
,	closed_by_key
from #DWH_TABLE_SCHEMA.f_task
)DIFF
group by changed_by
,	created_by
,	row_id
,	source_id
,	reassignment_count
,	update_count
,	age
,	pivot_date
,	changed_on
,	dw_inserted_on
,	created_on
,	secondary1_changed_on
,	dw_updated_on
,	secondary2_changed_on
,	cdctype
,	soft_deleted_flag
,	business_duration
-- ,	etl_run_number
,	due_on_key
,	assigned_to_key
,	time_worked
,	opened_on_key
,	application_key
,	age_key
,	configuration_item_key
,	opened_by_key
,	assignment_group_key
,	business_service_key
,	open_to_close_duration
-- ,	task_key
,	opened_by_department_key
,	location_key
-- ,	row_key
,	opened_time_key
,	closed_on_key
,	closed_by_key
having
count(*)<>2
order by row_id
)Result