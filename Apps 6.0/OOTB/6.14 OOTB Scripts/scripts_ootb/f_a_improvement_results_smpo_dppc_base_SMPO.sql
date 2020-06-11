drop table if exists #STG_TABLE_SCHEMA.f_a_improvement_results_smpo_dppc_base;

create table if not exists #STG_TABLE_SCHEMA.f_a_improvement_results_smpo_dppc_base
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

insert into #STG_TABLE_SCHEMA.f_a_improvement_results_smpo_dppc_base
(sys_id, assigned_to_key, assignment_group_key, source_id, month_start_date, month_key, inserted_on, updated_on)
select concat(SQ.assignment_group_key, '_', SQ.assigned_to_key, '_', calendar.row_key) as sys_id, SQ.assigned_to_key, SQ.assignment_group_key, SQ.source_id, calendar.calendar_date as month_start_date, calendar.row_key as month_key, current_timestamp as inserted_on, current_timestamp as updated_on
from
(
select distinct assigned_to_key, assignment_group_key, source_id
from #DWH_TABLE_SCHEMA.f_incident where soft_deleted_flag = 'N' and row_key not in (0, -1)
union 
select distinct change_assigned_to_key, change_assignment_group_key, source_id
from #DWH_TABLE_SCHEMA.d_change_failure where soft_deleted_flag = 'N' and row_key not in (0, -1)
union 
select distinct assigned_to_key, assignment_group_key, source_id
from #DWH_TABLE_SCHEMA.f_request_item where soft_deleted_flag = 'N' and row_key not in (0, -1)
union 
select distinct assigned_to_key, assignment_group_key, source_id
from #DWH_TABLE_SCHEMA.f_problem where soft_deleted_flag = 'N' and row_key not in (0, -1)
union 
select distinct assigned_to_key, assignment_group_key, source_id
from #DWH_TABLE_SCHEMA.f_problem_task where soft_deleted_flag = 'N' and row_key not in (0, -1)
union 
select distinct assigned_to_key, assignment_group_key, source_id
from #DWH_TABLE_SCHEMA.f_change_request where soft_deleted_flag = 'N' and row_key not in (0, -1)
union 
select distinct assigned_to_key, assignment_group_key, source_id
from #DWH_TABLE_SCHEMA.f_request_item where soft_deleted_flag = 'N' and row_key not in (0, -1)
union 
select distinct assigned_to_key, assignment_group_key, source_id
from #DWH_TABLE_SCHEMA.f_change_request where soft_deleted_flag = 'N' and row_key not in (0, -1)
) SQ
cross join 
(
select distinct CAL_MN.calendar_date, CAL_MN.row_key, CAL.lagging_count_of_month
from #DWH_TABLE_SCHEMA.d_calendar_date CAL
left join #DWH_TABLE_SCHEMA.d_calendar_date CAL_MN
ON (date_format(CAL.month_start_date,'%Y%m%d') = CAL_MN.row_id)
join (select sourcename, source_id, max(lastupdated) as lastupdated
from #DWH_TABLE_SCHEMA.d_o_data_freshness 
where sourcename = 'ServiceNow_Tenant' and soft_deleted_flag = 'N'
group by sourcename, source_id) ODF
on ODF.sourcename = 'ServiceNow_Tenant'
left join #DWH_TABLE_SCHEMA.d_calendar_date CAL_CURR
ON (date_format(ODF.lastupdated,'%Y%m%d') = CAL_CURR.row_id)
where CAL.lagging_count_of_month between (CAL_CURR.lagging_count_of_month + 1) and 12
) calendar;

SET SQL_SAFE_UPDATES = 0;

use #STG_TABLE_SCHEMA;

-- Incident Opened date as canonical date --

update #STG_TABLE_SCHEMA.f_a_improvement_results_smpo_dppc_base base
join (
select F.assignment_group_key, F.assigned_to_key, CAL.month_start_date_key,
  count(F.incident_key) as opened_incidents,
  count(case when INC_ST.dimension_wh_code = 'OPEN' then F.incident_key else null end) as pending_incidents
from #DWH_TABLE_SCHEMA.f_incident F
left join #DWH_TABLE_SCHEMA.d_incident D
on D.row_key = F.incident_key and D.source_id = F.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map INC_ST
on F.state_src_key = INC_ST.src_key and F.source_id = INC_ST.source_id
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on F.opened_on_key = CAL.row_key
where F.soft_deleted_flag <> 'Y'
group by F.assignment_group_key, F.assigned_to_key, CAL.month_start_date_key
) opened_incidents
on base.assignment_group_key = opened_incidents.assignment_group_key and base.assigned_to_key = opened_incidents.assigned_to_key and opened_incidents.month_start_date_key = base.month_key
set base.opened_incidents = opened_incidents.opened_incidents, base.pending_incidents = opened_incidents.pending_incidents, 
base.updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

-- Incident Resolved date as canonical date --

update #STG_TABLE_SCHEMA.f_a_improvement_results_smpo_dppc_base base
join (
select F.assignment_group_key, F.assigned_to_key, CAL.month_start_date_key,
  sum(case when INC_ST.dimension_wh_code in ('RESOLVED', 'CLOSED') then F.open_to_resolve_duration else 0 end) as incident_open_to_resolve_duration,
  count(case when INC_ST.dimension_wh_code in ('RESOLVED', 'CLOSED') then F.incident_key else null end) as resolved_incidents
from #DWH_TABLE_SCHEMA.f_incident F
left join #DWH_TABLE_SCHEMA.d_incident D
on D.row_key = F.incident_key and D.source_id = F.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map INC_ST
on F.state_src_key = INC_ST.src_key and F.source_id = INC_ST.source_id
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on F.last_resolved_on_key = CAL.row_key
where F.soft_deleted_flag <> 'Y' and INC_ST.dimension_wh_code in ('RESOLVED', 'CLOSED')
group by F.assignment_group_key, F.assigned_to_key, CAL.month_start_date_key
) resolved_incidents
on base.assignment_group_key = resolved_incidents.assignment_group_key and base.assigned_to_key = resolved_incidents.assigned_to_key and resolved_incidents.month_start_date_key = base.month_key
set base.incident_open_to_resolve_duration = resolved_incidents.incident_open_to_resolve_duration, base.resolved_incidents = resolved_incidents.resolved_incidents, 
base.updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

-- Incident Closed date as canonical date --

update #STG_TABLE_SCHEMA.f_a_improvement_results_smpo_dppc_base base
join (
select F.assignment_group_key, F.assigned_to_key, CAL.month_start_date_key,
  count(case when INC_ST.dimension_wh_code in ('CLOSED') then F.incident_key else null end) as closed_incidents,
  count(case when D.met_sla_flag = 'Y' and INC_ST.dimension_wh_code in ('CLOSED') then F.incident_key else null end) as incident_met_all_slas
from #DWH_TABLE_SCHEMA.f_incident F
left join #DWH_TABLE_SCHEMA.d_incident D
on D.row_key = F.incident_key and D.source_id = F.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map INC_ST
on F.state_src_key = INC_ST.src_key and F.source_id = INC_ST.source_id
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on F.closed_on_key = CAL.row_key
where F.soft_deleted_flag <> 'Y' and INC_ST.dimension_wh_code in ('CLOSED')
group by F.assignment_group_key, F.assigned_to_key, CAL.month_start_date_key
) closed_incidents
on base.assignment_group_key = closed_incidents.assignment_group_key and base.assigned_to_key = closed_incidents.assigned_to_key and closed_incidents.month_start_date_key = base.month_key
set base.closed_incidents = closed_incidents.closed_incidents, base.incident_met_all_slas = closed_incidents.incident_met_all_slas, 
base.updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

-- Change Request Opened date as canonical date --

update #STG_TABLE_SCHEMA.f_a_improvement_results_smpo_dppc_base base
join (
select F.assignment_group_key, F.assigned_to_key, CAL.month_start_date_key,
sum(case when (CR_ST.dimension_wh_code not in ('CANCELED')) then F.lead_time end) as change_requests_lead_time,
count(F.change_request_key) as opened_change_requests

from #DWH_TABLE_SCHEMA.f_change_request F
left join #DWH_TABLE_SCHEMA.d_change_request D
on D.row_key = F.change_request_key and D.source_id = F.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map CR_ST
on F.state_src_key = CR_ST.src_key and F.source_id = CR_ST.source_id
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on F.opened_on_key = CAL.row_key
where F.soft_deleted_flag <> 'Y'
group by F.assignment_group_key, F.assigned_to_key, CAL.month_start_date_key
) opened_cr
on base.assignment_group_key = opened_cr.assignment_group_key and base.assigned_to_key = opened_cr.assigned_to_key and opened_cr.month_start_date_key = base.month_key
set base.change_requests_lead_time = opened_cr.change_requests_lead_time, base.opened_change_requests = opened_cr.opened_change_requests, 
base.updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

-- Change Request Closed date as canonical date --

update #STG_TABLE_SCHEMA.f_a_improvement_results_smpo_dppc_base base
join (
select F.assignment_group_key, F.assigned_to_key, CAL.month_start_date_key,
count(case when CR_ST.dimension_wh_code in ('CLOSED') then DF.change_request_key else null end) as closed_change_failure_requests,
count(case when DF.numerify_change_failure_flag='N' then DF.change_request_key else null end) as successful_change_failure_requests

from #DWH_TABLE_SCHEMA.f_change_request F
left join #DWH_TABLE_SCHEMA.d_change_request D
on D.row_key = F.change_request_key and D.source_id = F.source_id
left join #DWH_TABLE_SCHEMA.d_change_failure DF
on D.row_key=DF.change_request_key and D.source_id=DF.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map CR_ST
on F.state_src_key = CR_ST.src_key and F.source_id = CR_ST.source_id
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on F.closed_on_key = CAL.row_key
where F.soft_deleted_flag <> 'Y'
group by F.assignment_group_key, F.assigned_to_key, CAL.month_start_date_key
) closed_cr
on base.assignment_group_key = closed_cr.assignment_group_key and base.assigned_to_key = closed_cr.assigned_to_key and closed_cr.month_start_date_key = base.month_key
set base.closed_change_failure_requests = closed_cr.closed_change_failure_requests, base.successful_change_failure_requests = closed_cr.successful_change_failure_requests, 
base.updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

-- Change Request Due date as canonical date --

update #STG_TABLE_SCHEMA.f_a_improvement_results_smpo_dppc_base base
join (
select F.assignment_group_key, F.assigned_to_key, CAL.month_start_date_key,
count(case when D.overdue_flag='Y' then F.change_request_key else null end) as overdue_change_requests

from #DWH_TABLE_SCHEMA.f_change_request F
left join #DWH_TABLE_SCHEMA.d_change_request D
on D.row_key = F.change_request_key and D.source_id = F.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map CR_ST
on F.state_src_key = CR_ST.src_key and F.source_id = CR_ST.source_id
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on F.due_on_key = CAL.row_key
where F.soft_deleted_flag <> 'Y' and D.overdue_flag = 'Y'
group by F.assignment_group_key, F.assigned_to_key, CAL.month_start_date_key
) due_cr
on base.assignment_group_key = due_cr.assignment_group_key and base.assigned_to_key = due_cr.assigned_to_key and due_cr.month_start_date_key = base.month_key
set base.overdue_change_requests = due_cr.overdue_change_requests,
base.updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

-- Request Item Open date as canonical date --

update #STG_TABLE_SCHEMA.f_a_improvement_results_smpo_dppc_base base
join (
select F.assignment_group_key, F.assigned_to_key, CAL.month_start_date_key,
count(F.request_item_key) as opened_request_items,
count(case when REQ_ST.dimension_wh_code = 'OPEN' then F.request_item_key else null end) as pending_request_items

from #DWH_TABLE_SCHEMA.f_request_item F
left join #DWH_TABLE_SCHEMA.d_request_item D
  on D.row_key = F.request_item_key and D.source_id = F.source_id
  left join #DWH_TABLE_SCHEMA.d_lov_map REQ_ST
on F.state_src_key = REQ_ST.src_key and F.source_id = REQ_ST.source_id
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on F.opened_on_key = CAL.row_key
where F.soft_deleted_flag <> 'Y'
group by F.assignment_group_key, F.assigned_to_key, CAL.month_start_date_key
) open_req_itm
on base.assignment_group_key = open_req_itm.assignment_group_key and base.assigned_to_key = open_req_itm.assigned_to_key and open_req_itm.month_start_date_key = base.month_key
set base.opened_request_items = open_req_itm.opened_request_items, base.pending_request_items = open_req_itm.pending_request_items,
base.updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

-- Request Item Closed date as canonical date --

update #STG_TABLE_SCHEMA.f_a_improvement_results_smpo_dppc_base base
join (
select F.assignment_group_key, F.assigned_to_key, CAL.month_start_date_key,
count(case when REQ_ST.dimension_wh_code in ('CLOSED') then F.request_item_key else null end) as closed_request_items,
sum(case when REQ_ST.dimension_wh_code in ('CLOSED') then F.open_to_close_duration else 0 end) as request_items_open_to_close_duration,
count(case when D.met_sla_flag = 'Y' then F.request_item_key else null end) as request_items_met_all_slas

from #DWH_TABLE_SCHEMA.f_request_item F
left join #DWH_TABLE_SCHEMA.d_request_item D
  on D.row_key = F.request_item_key and D.source_id = F.source_id
  left join #DWH_TABLE_SCHEMA.d_lov_map REQ_ST
on F.state_src_key = REQ_ST.src_key and F.source_id = REQ_ST.source_id
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on F.closed_on_key = CAL.row_key
where F.soft_deleted_flag <> 'Y' and REQ_ST.dimension_wh_code in ('CLOSED')
group by F.assignment_group_key, F.assigned_to_key, CAL.month_start_date_key
) close_req_itm
on base.assignment_group_key = close_req_itm.assignment_group_key and base.assigned_to_key = close_req_itm.assigned_to_key and close_req_itm.month_start_date_key = base.month_key
set base.closed_request_items = close_req_itm.closed_request_items, base.request_items_open_to_close_duration = close_req_itm.request_items_open_to_close_duration, 
base.request_items_met_all_slas = close_req_itm.request_items_met_all_slas,
base.updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

-- Problem Opened date as canonical date --

update #STG_TABLE_SCHEMA.f_a_improvement_results_smpo_dppc_base base
join (
select F.assignment_group_key, F.assigned_to_key, CAL.month_start_date_key,
count(distinct F.problem_key) as opened_problems,
sum(distinct F.age) as problem_age

from #DWH_TABLE_SCHEMA.f_problem F
left join #DWH_TABLE_SCHEMA.d_problem D
  on D.row_key = F.problem_key and D.source_id = F.source_id
  left join #DWH_TABLE_SCHEMA.d_lov_map PROB_ST
on F.state_src_key = PROB_ST.src_key and F.source_id = PROB_ST.source_id
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on F.opened_on_key = CAL.row_key
where F.soft_deleted_flag <> 'Y'
group by F.assignment_group_key, F.assigned_to_key, CAL.month_start_date_key
) opened_problem
on base.assignment_group_key = opened_problem.assignment_group_key and base.assigned_to_key = opened_problem.assigned_to_key and opened_problem.month_start_date_key = base.month_key
set base.opened_problems = opened_problem.opened_problems, base.problem_age = opened_problem.problem_age,
base.updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

-- Problem Task Closed date as canonical date --

update #STG_TABLE_SCHEMA.f_a_improvement_results_smpo_dppc_base base
join (
select F.assignment_group_key, F.assigned_to_key, CAL.month_start_date_key,
count(case when D.met_sla_flag = 'Y'  then F.problem_task_key else null end) as problem_tasks_met_all_slas,
count(distinct F.problem_task_key) as closed_problem_tasks

from #DWH_TABLE_SCHEMA.f_problem_task F
left join #DWH_TABLE_SCHEMA.d_problem_task D
on D.row_key = F.problem_task_key and D.source_id = F.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map PROB_ST
on F.state_src_key = PROB_ST.src_key and F.source_id = PROB_ST.source_id
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on F.closed_on_key = CAL.row_key
where F.soft_deleted_flag <> 'Y'
group by F.assignment_group_key, F.assigned_to_key, CAL.month_start_date_key
) closed_problem_task
on base.assignment_group_key = closed_problem_task.assignment_group_key and base.assigned_to_key = closed_problem_task.assigned_to_key and closed_problem_task.month_start_date_key = base.month_key
set base.problem_tasks_met_all_slas = closed_problem_task.problem_tasks_met_all_slas, base.closed_problem_tasks = closed_problem_task.closed_problem_tasks,
base.updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

-- Problem Task Overdue date as canonical date --

update #STG_TABLE_SCHEMA.f_a_improvement_results_smpo_dppc_base base
join (
select F.assignment_group_key, F.assigned_to_key, CAL.month_start_date_key,
count(distinct case when D.over_due_flag = 'Y' then F.problem_task_key else null end)  as overdue_problem_tasks

from #DWH_TABLE_SCHEMA.f_problem_task F
left join #DWH_TABLE_SCHEMA.d_problem_task D
on D.row_key = F.problem_task_key and D.source_id = F.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map PROB_ST
on F.state_src_key = PROB_ST.src_key and F.source_id = PROB_ST.source_id
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on F.due_on_key = CAL.row_key
where F.soft_deleted_flag <> 'Y' and D.over_due_flag = 'Y'
group by F.assignment_group_key, F.assigned_to_key, CAL.month_start_date_key
) due_problem_task
on base.assignment_group_key = due_problem_task.assignment_group_key and base.assigned_to_key = due_problem_task.assigned_to_key and due_problem_task.month_start_date_key = base.month_key
set base.overdue_problem_tasks = due_problem_task.overdue_problem_tasks,
base.updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

delete from #STG_TABLE_SCHEMA.f_a_improvement_results_smpo_dppc_base where to_delete_flag = 'Y';