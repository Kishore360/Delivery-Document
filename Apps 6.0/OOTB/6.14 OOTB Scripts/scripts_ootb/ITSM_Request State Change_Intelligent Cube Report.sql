select 
d.request_number req_num, 
d.request_number req, 
d.short_description shrt,
coalesce(TO_CHAR(d.opened_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'') opened, 
coalesce(TO_CHAR(d.due_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'') as due_date,
coalesce(TO_CHAR(d.closed_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'') closed,
CNT.full_name asignee,
ORG.organization_name asn_grp,
priority.dimension_name as priority_name,
CI.name ci_name,
state.dimension_name curr_state,
from_state.dimension_name old_state,
to_state.dimension_name new_state,
stage.dimension_name curr_stage,
from_stage.dimension_name old_stage,
to_stage.dimension_name new_stage,
case when fa.task_attribute_wh_name = 'request_state' then fa.primary_sequence_id+1 else null end state_no,
case when fa.task_attribute_wh_name = 'stage' then fa.primary_sequence_id+1 else null end stage_no,
coalesce(TO_CHAR(f.created_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'') state_changed_on,

max(d.state_count) state_cnt,
max(d.stage_count) stage_cnt,

case when max(fa.task_attribute_wh_name) = 'request_state' and (sum(fa.primary_duration)/86400.00) < 0 
then '-'||trim(to_char(coalesce(round((sum(fa.primary_duration * (-1))/86400.00)/(count(fa.request_key)),1),0.0), '999,999,990.9'))
when max(fa.task_attribute_wh_name) = 'request_state' and (avg(fa.primary_duration)/86400.00) >= 0
then trim(to_char(coalesce(round((sum(fa.primary_duration)/86400.00)/(count(fa.request_key)),1),0.0), '999,999,990.9'))
else null end avg_state_dur,

case when max(fa.task_attribute_wh_name) = 'stage' and (sum(fa.primary_duration)/86400.00)/(count(fa.request_key)) < 0 
then '-'||trim(to_char(coalesce(round((sum(fa.primary_duration * (-1))/86400.00)/(count(fa.request_key)),1),0.0), '999,999,990.9'))
when max(fa.task_attribute_wh_name) = 'stage' and (sum(fa.primary_duration)/86400.00)/(count(fa.request_key)) >= 0
then trim(to_char(coalesce(round((sum(fa.primary_duration)/86400.00)/(count(fa.request_key)),1),0.0), '999,999,990.9'))
else null end avg_stage_dur,

max(d.state_count) state_cnt,
max(d.stage_count) stage_cnt,

case when max(fa.task_attribute_wh_name) = 'request_state' and (sum(fa.primary_duration)/86400.00) < 0 
then '-'||trim(to_char(coalesce(round((sum(fa.primary_duration * (-1))/86400.00),1),0.0), '999,999,990.9'))
when max(fa.task_attribute_wh_name) = 'request_state' and (sum(fa.primary_duration)/86400.00) >= 0
then trim(to_char(coalesce(round((sum(fa.primary_duration)/86400.00),1),0.0), '999,999,990.9'))
else trim(to_char(0.0, '999,999,990.9')) end tot_state_dur,

case when max(fa.task_attribute_wh_name) = 'stage' and (sum(fa.primary_duration)/86400.00) < 0 
then '-'||trim(to_char(coalesce(round((sum(fa.primary_duration * (-1))/86400.00),1),0.0), '999,999,990.9'))
when max(fa.task_attribute_wh_name) = 'stage' and (sum(fa.primary_duration)/86400.00) >= 0
then trim(to_char(coalesce(round((sum(fa.primary_duration)/86400.00),1),0.0), '999,999,990.9'))
else trim(to_char(0.0, '999,999,990.9')) end tot_stage_dur

from 
(
select t.*
 FROM #DWH_TABLE_SCHEMA.f_request_activity t
   JOIN #DWH_TABLE_SCHEMA.f_request f ON t.request_key = f.request_key AND f.soft_deleted_flag = 'N'::bpchar AND t.soft_deleted_flag = 'N'::bpchar AND t.expose_flag = 'Y'::bpchar
   JOIN #DWH_TABLE_SCHEMA.d_request d ON d.row_key = f.request_key
  WHERE t.task_wh_type::text = 'sc_request'::text AND (t.task_attribute_wh_name::text = 'request_state'::text OR t.task_attribute_wh_name::text = 'stage'::text)
) fa
join #DWH_TABLE_SCHEMA.d_request d
on fa.request_key = d.row_key 
join #DWH_TABLE_SCHEMA.f_request f
on f.request_key = d.row_key
join 
(
   select d_calendar_date.*
   FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_day ON d_calendar_date.previous_day_key = prev_day.row_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_week ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
)CAL
on CAL.row_key = fa.created_on_key
join #DWH_TABLE_SCHEMA.d_configuration_item CI
on CI.row_key = f.configuration_item_key
join
(
   select ic.*
   FROM #DWH_TABLE_SCHEMA.d_internal_contact ic
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact icm ON ic.manager_key = icm.row_key
) CNT
on CNT.row_key = f.assigned_to_key
join #DWH_TABLE_SCHEMA.d_internal_contact DIC
on DIC.row_key = f.opened_by_key
join 
(
   select iog.*
   FROM #DWH_TABLE_SCHEMA.d_internal_organization iog
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact icm ON iog.manager_key = icm.row_key
  WHERE iog.group_flag = 'Y' OR iog.row_key = 0 OR iog.row_key = -1
) ORG
on ORG.row_key = f.assignment_group_key
join
(
 select d_internal_organization.*
 FROM #DWH_TABLE_SCHEMA.d_internal_organization d_internal_organization
  WHERE d_internal_organization.department_flag = 'Y'::bpchar OR d_internal_organization.row_key = 0 OR d_internal_organization.row_key = -1
) dept
on dept.row_key = DIC.department_key
join 
(
 SELECT lov.*, br.dimension_wh_code to_stage
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'STAGE~SC_REQUEST'
UNION 
 SELECT lov.*, null as to_stage
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) to_stage
on to_stage.row_key = (case when fa.task_attribute_wh_name = 'stage' then fa.task_attribute_wh_next_value_key else 0 end)
join 
(
 SELECT lov.*, br.dimension_wh_code from_stage
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'STAGE~SC_REQUEST'
UNION 
 SELECT lov.*, null as from_stage
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) from_stage
on from_stage.row_key = (case when fa.task_attribute_wh_name = 'stage' then fa.task_attribute_wh_new_value_key else 0 end)
join 
(
 SELECT lov.*, br.dimension_wh_code to_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'REQUEST_STATE~SC_REQUEST'::text
UNION 
 SELECT lov.*, null as to_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) to_state
on to_state.row_key = (case when fa.task_attribute_wh_name = 'request_state' then fa.task_attribute_wh_next_value_key else 0 end)
join 
(
 SELECT lov.*, br.dimension_wh_code from_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'REQUEST_STATE~SC_REQUEST'::text
UNION 
 SELECT lov.*, null as from_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) from_state
on from_state.row_key = (case when fa.task_attribute_wh_name = 'request_state' then fa.task_attribute_wh_new_value_key else 0 end)
join 
(
 SELECT lov.*, br.dimension_wh_code stage
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'STAGE~SC_REQUEST'
UNION 
 SELECT lov.*, null as stage
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) stage
on stage.row_key = f.stage_src_key
join 
(
 SELECT lov.*, br.dimension_wh_code state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'REQUEST_STATE~SC_REQUEST'::text
UNION 
 SELECT lov.*, null as state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) state
on state.row_key = f.state_src_key
join 
(
 SELECT lov.*, br.dimension_wh_code priority_code, wh_lov.dimension_name as priority
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'PRIORITY~SC_REQUEST'::text
UNION 
 SELECT lov.*, lov.dimension_code priority_code, lov.dimension_name as priority
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) priority
on priority.row_key = f.priority_src_key
where CAL.lagging_count_of_month between 0 and 12
and f.soft_deleted_flag = 'N'
and fa.task_wh_type = 'sc_request'
and fa.primary_duration is not null
group by req_num, req, shrt, d.opened_on, d.closed_on, d.due_on, asignee, asn_grp, priority_name, ci_name, curr_state, old_state, new_state, curr_stage, old_stage, new_stage, state_no, stage_no, state_changed_on
order by req_num, req, shrt, d.opened_on, d.closed_on, d.due_on, asignee, asn_grp, priority_name, ci_name, curr_state, old_state, new_state, curr_stage, old_stage, new_stage, state_no, stage_no, state_changed_on

