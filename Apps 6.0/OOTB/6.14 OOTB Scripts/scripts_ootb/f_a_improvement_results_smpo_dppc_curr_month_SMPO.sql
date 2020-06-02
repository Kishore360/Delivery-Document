drop table if exists #STG_TABLE_SCHEMA.f_a_improvement_results_smpo_dppc_curr_mn;

create table if not exists #STG_TABLE_SCHEMA.f_a_improvement_results_smpo_dppc_curr_mn
(
assigned_to_key BIGINT(20) DEFAULT NULL,
assignment_group_key BIGINT(20) DEFAULT NULL,
change_requests_lead_time BIGINT(20) DEFAULT 0,
closed_change_failure_requests BIGINT(20) DEFAULT 0,
closed_incidents BIGINT(20) DEFAULT 0,
closed_problem_tasks BIGINT(20) DEFAULT 0,
closed_request_items BIGINT(20) DEFAULT 0,
incident_met_all_slas BIGINT(20) DEFAULT 0,
incident_open_to_resolve_duration BIGINT(20) DEFAULT 0,
month_start_date datetime DEFAULT NULL,
month_key BIGINT(20) DEFAULT NULL,
opened_change_requests BIGINT(20) DEFAULT 0,
opened_incidents BIGINT(20) DEFAULT 0,
opened_problems BIGINT(20) DEFAULT 0,
opened_request_items BIGINT(20) DEFAULT 0,
overdue_change_requests BIGINT(20) DEFAULT 0,
overdue_problem_tasks BIGINT(20) DEFAULT 0,
pending_incidents BIGINT(20) DEFAULT 0,
pending_request_items BIGINT(20) DEFAULT 0,
problem_age BIGINT(20) DEFAULT 0,
problem_tasks_met_all_slas BIGINT(20) DEFAULT 0,
request_items_met_all_slas BIGINT(20) DEFAULT 0,
request_items_open_to_close_duration BIGINT(20) DEFAULT 0,
resolved_incidents BIGINT(20) DEFAULT 0,
sys_id VARCHAR(255) DEFAULT NULL,
soft_deleted_flag CHAR(1) DEFAULT 'N',
source_id SMALLINT(6) DEFAULT NULL,
successful_change_failure_requests BIGINT(20) DEFAULT 0,
to_delete_flag CHAR(1) DEFAULT 'Y',
inserted_on datetime DEFAULT NULL,
updated_on datetime DEFAULT NULL,

PRIMARY KEY (sys_id, source_id, month_key)
);

insert into #STG_TABLE_SCHEMA.f_a_improvement_results_smpo_dppc_curr_mn
(sys_id, assigned_to_key, assignment_group_key, source_id, month_start_date, month_key, inserted_on, updated_on)
select concat(base.assignment_group_key, '_', base.assigned_to_key, '_', calendar.row_key) as sys_id, base.assigned_to_key, base.assignment_group_key, base.source_id, calendar.month_start_date as month_start_date, calendar.month_start_date_key as month_key, current_timestamp as inserted_on, current_timestamp as updated_on
from
(
select distinct base.assigned_to_key, base.assignment_group_key, base.source_id
from #DWH_TABLE_SCHEMA.f_a_incident_smpo_dppc base
left join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on base.calendar_date_key = CAL.row_key
where base.soft_deleted_flag = 'N' and base.row_key not in (0, -1) and CAL.lagging_count_of_days between 0 and 29
union 
select distinct base.assigned_to_key, base.assignment_group_key, base.source_id
from #DWH_TABLE_SCHEMA.f_a_change_request_smpo_dppc base
left join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on base.calendar_date_key = CAL.row_key
where base.soft_deleted_flag = 'N' and base.row_key not in (0, -1) and CAL.lagging_count_of_days between 0 and 29
union 
select distinct base.assigned_to_key, base.assignment_group_key, base.source_id
from #DWH_TABLE_SCHEMA.f_a_request_item_smpo_dppc base
left join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on base.calendar_date_key = CAL.row_key
where base.soft_deleted_flag = 'N' and base.row_key not in (0, -1) and CAL.lagging_count_of_days between 0 and 29
union 
select distinct base.assigned_to_key, base.assignment_group_key, base.source_id
from #DWH_TABLE_SCHEMA.f_a_problem_smpo_dppc base
left join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on base.calendar_date_key = CAL.row_key
where base.soft_deleted_flag = 'N' and base.row_key not in (0, -1) and CAL.lagging_count_of_days between 0 and 29
) base
join (select sourcename, source_id, max(lastupdated) as lastupdated
from #DWH_TABLE_SCHEMA.d_o_data_freshness 
where sourcename = 'ServiceNow_Tenant' and soft_deleted_flag = 'N'
group by sourcename, source_id) ODF
on ODF.sourcename = 'ServiceNow_Tenant'
left join #DWH_TABLE_SCHEMA.d_calendar_date calendar
ON (date_format(ODF.lastupdated,'%Y%m%d') = calendar.row_id)
where calendar.lagging_count_of_month = 0;

SET SQL_SAFE_UPDATES = 0;

use #STG_TABLE_SCHEMA;

-- incident aggregate table metrics populate --

update #STG_TABLE_SCHEMA.f_a_improvement_results_smpo_dppc_curr_mn base
join (
select F.assignment_group_key, F.assigned_to_key,
  sum(F.incidents_met_all_slas) as incident_met_all_slas,
  sum(F.opened_incidents) as opened_incidents,
  sum(F.resolved_incidents) as resolved_incidents,
  sum(F.open_to_resolve_duration) as incident_open_to_resolve_duration,
  sum(F.closed_incidents) as closed_incidents,
  sum(F.pending_incidents) as pending_incidents
from #DWH_TABLE_SCHEMA.f_a_incident_smpo_dppc F
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on F.calendar_date_key = CAL.row_key
where F.soft_deleted_flag <> 'Y' and CAL.lagging_count_of_days between 0 and 29
and (F.incidents_met_all_slas > 0 or F.opened_incidents > 0 or F.resolved_incidents > 0 or F.open_to_resolve_duration > 0 
or F.closed_incidents > 0 or F.pending_incidents > 0)
group by F.assignment_group_key, F.assigned_to_key
) incidents
on base.assignment_group_key = incidents.assignment_group_key and base.assigned_to_key = incidents.assigned_to_key
set base.incident_met_all_slas = incidents.incident_met_all_slas, base.opened_incidents = incidents.opened_incidents, 
base.resolved_incidents = incidents.resolved_incidents, base.incident_open_to_resolve_duration = incidents.incident_open_to_resolve_duration,
base.closed_incidents = incidents.closed_incidents, base.pending_incidents = incidents.pending_incidents,
base.updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

-- request item aggregate table metrics populate --

update #STG_TABLE_SCHEMA.f_a_improvement_results_smpo_dppc_curr_mn base
join (
select F.assignment_group_key, F.assigned_to_key,
  sum(F.pending_request_items) as pending_request_items,
  sum(F.request_items_met_all_slas) as request_items_met_all_slas,
  sum(F.open_to_close_duration) as request_items_open_to_close_duration,
  sum(F.opened_request_items) as opened_request_items,
  sum(F.closed_request_items) as closed_request_items
from #DWH_TABLE_SCHEMA.f_a_request_item_smpo_dppc F
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on F.calendar_date_key = CAL.row_key
where F.soft_deleted_flag <> 'Y' and CAL.lagging_count_of_days between 0 and 29
and (F.pending_request_items > 0 or F.request_items_met_all_slas > 0 or F.open_to_close_duration > 0 or F.opened_request_items > 0 
or F.closed_request_items > 0)
group by F.assignment_group_key, F.assigned_to_key
) request_item
on base.assignment_group_key = request_item.assignment_group_key and base.assigned_to_key = request_item.assigned_to_key
set base.incident_met_all_slas = request_item.pending_request_items, base.request_items_met_all_slas = request_item.request_items_met_all_slas, 
base.request_items_open_to_close_duration = request_item.request_items_open_to_close_duration, base.opened_request_items = request_item.opened_request_items,
base.closed_request_items = request_item.closed_request_items,
base.updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

-- problem aggregate table metrics populate --

update #STG_TABLE_SCHEMA.f_a_improvement_results_smpo_dppc_curr_mn base
join (
select F.assignment_group_key, F.assigned_to_key,
  sum(F.opened_problems) as opened_problems,
  sum(F.problem_tasks_met_all_slas) as problem_tasks_met_all_slas,
  sum(F.closed_problem_tasks) as closed_problem_tasks,
  sum(F.age) as problem_age,
  sum(F.overdue_problem_tasks) as overdue_problem_tasks
from #DWH_TABLE_SCHEMA.f_a_problem_smpo_dppc F
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on F.calendar_date_key = CAL.row_key
where F.soft_deleted_flag <> 'Y' and CAL.lagging_count_of_days between 0 and 29
and (F.opened_problems > 0 or F.closed_problem_tasks > 0 or F.problem_tasks_met_all_slas > 0 or F.age > 0 
or F.overdue_problem_tasks > 0)
group by F.assignment_group_key, F.assigned_to_key
) problem
on base.assignment_group_key = problem.assignment_group_key and base.assigned_to_key = problem.assigned_to_key
set base.opened_problems = problem.opened_problems, base.problem_tasks_met_all_slas = problem.problem_tasks_met_all_slas, 
base.closed_problem_tasks = problem.closed_problem_tasks, base.problem_age = problem.problem_age,
base.overdue_problem_tasks = problem.overdue_problem_tasks,
base.updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

-- change request aggregate table metrics populate --

update #STG_TABLE_SCHEMA.f_a_improvement_results_smpo_dppc_curr_mn base
join (
select F.assignment_group_key, F.assigned_to_key,
  sum(F.successful_change_failure_requests) as successful_change_failure_requests,
  sum(F.closed_change_failure_requests) as closed_change_failure_requests,
  sum(F.overdue_change_requests) as overdue_change_requests,
  sum(F.opened_change_requests) as opened_change_requests,
  sum(F.lead_time) as change_requests_lead_time
from #DWH_TABLE_SCHEMA.f_a_change_request_smpo_dppc F
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on F.calendar_date_key = CAL.row_key
where F.soft_deleted_flag <> 'Y' and CAL.lagging_count_of_days between 0 and 29
and (F.successful_change_failure_requests > 0 or F.closed_change_failure_requests > 0 or F.overdue_change_requests > 0 or F.opened_change_requests > 0 
or F.lead_time > 0)
group by F.assignment_group_key, F.assigned_to_key
) change_request
on base.assignment_group_key = change_request.assignment_group_key and base.assigned_to_key = change_request.assigned_to_key
set base.successful_change_failure_requests = change_request.successful_change_failure_requests, base.closed_change_failure_requests = change_request.closed_change_failure_requests, 
base.overdue_change_requests = change_request.overdue_change_requests, base.opened_change_requests = change_request.opened_change_requests,
base.change_requests_lead_time = change_request.change_requests_lead_time,
base.updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

delete from #STG_TABLE_SCHEMA.f_a_improvement_results_smpo_dppc_curr_mn where to_delete_flag = 'Y';