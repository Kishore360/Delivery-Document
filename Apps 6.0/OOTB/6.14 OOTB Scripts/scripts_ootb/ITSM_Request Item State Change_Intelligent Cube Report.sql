select 
d.request_item_number req_item, 
d.request_item_number req_item_num,
ITEM.item_name item,
d.short_description shrt,
REQ.request_number req,
REQ.request_number req_no,
CNT.full_name asignee,
ORG.organization_name asgn_grp,
dept.organization_name dept,
ci.name ci_name,
priority.dimension_name priority_name,
coalesce(TO_CHAR(d.opened_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'') opened, 
coalesce(TO_CHAR(d.due_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'') as due_date,
coalesce(TO_CHAR(d.closed_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'') closed,
from_state.dimension_name old_state,
state.dimension_name current_state,
to_state.dimension_name new_state,
from_stage.dimension_name old_stage,
stage.dimension_name current_stage,
to_stage.dimension_name new_stage,
case when fa.task_attribute_wh_name = 'state' then fa.primary_sequence_id+1 else null end state_no,
case when fa.task_attribute_wh_name = 'stage' then fa.primary_sequence_id+1 else null end stage_no,
max(d.state_count) state_change_cnt,
max(d.stage_count) stage_change_cnt,
coalesce(TO_CHAR(fa.created_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'') state_changed_on,

max(d.state_count) state_cnt,
max(d.stage_count) stage_cnt,

case when max(fa.task_attribute_wh_name) = 'state' and (sum(fa.primary_duration)/86400.00) < 0 
then '-'||trim(to_char(coalesce(round((sum(fa.primary_duration * (-1))/86400.00)/count(fa.request_item_key),1),0.0), '999,999,990.9'))
when max(fa.task_attribute_wh_name) = 'state' and (sum(fa.primary_duration)/86400.00) >= 0
then trim(to_char(coalesce(round((sum(fa.primary_duration)/86400.00)/count(fa.request_item_key),1),0.0), '999,999,990.9'))
else null end avg_state_dur,

case when max(fa.task_attribute_wh_name) = 'stage' and (sum(fa.primary_duration)/86400.00) < 0 
then '-'||trim(to_char(coalesce(round((sum(fa.primary_duration * (-1))/86400.00)/count(fa.request_item_key),1),0.0), '999,999,990.9'))
when max(fa.task_attribute_wh_name) = 'stage' and (sum(fa.primary_duration)/86400.00) >= 0
then trim(to_char(coalesce(round((sum(fa.primary_duration)/86400.00)/count(fa.request_item_key),1),0.0), '999,999,990.9'))
else null end avg_stage_dur,

max(d.state_count) state_cnt,
max(d.stage_count) stage_cnt,

case when max(fa.task_attribute_wh_name) = 'state' and (sum(fa.primary_duration)/86400.00) < 0 
then '-'||trim(to_char(coalesce(round((sum(fa.primary_duration * (-1))/86400.00),1),0.0), '999,999,990.9'))
when max(fa.task_attribute_wh_name) = 'state' and (sum(fa.primary_duration)/86400.00) >= 0
then trim(to_char(coalesce(round((sum(fa.primary_duration)/86400.00),1),0.0), '999,999,990.9'))
else null end tot_state_dur,

case when max(fa.task_attribute_wh_name) = 'stage' and (sum(fa.primary_duration)/86400.00) < 0 
then '-'||trim(to_char(coalesce(round((sum(fa.primary_duration * (-1))/86400.00),1),0.0), '999,999,990.9'))
when max(fa.task_attribute_wh_name) = 'stage' and (sum(fa.primary_duration)/86400.00) >= 0
then trim(to_char(coalesce(round((sum(fa.primary_duration)/86400.00),1),0.0), '999,999,990.9'))
else null end tot_stage_dur,

trim(to_char(round(max(coalesce(CASE WHEN fa.task_attribute_wh_name = 'state' THEN 0
ELSE from_stage.upper_range_value end,0)/86400.00),1), '999,999,990.9')) tgt_dur
from 
(
 select t.*
 FROM #DWH_TABLE_SCHEMA.f_request_item_activity t
   JOIN #DWH_TABLE_SCHEMA.f_request_item f ON t.request_item_key = f.request_item_key AND f.soft_deleted_flag = 'N'::bpchar AND t.soft_deleted_flag = 'N'::bpchar AND t.expose_flag = 'Y'::bpchar
   JOIN #DWH_TABLE_SCHEMA.d_request_item d ON d.row_key = f.request_item_key
  WHERE t.task_wh_type = 'sc_req_item' AND (t.task_attribute_wh_name = 'state' OR t.task_attribute_wh_name = 'stage')
)fa
join #DWH_TABLE_SCHEMA.d_request_item d
on fa.request_item_key = d.row_key 
join #DWH_TABLE_SCHEMA.f_request_item REQITEMF
on REQITEMF.request_item_key = d.row_key and REQITEMF.soft_deleted_flag = 'N'
join #DWH_TABLE_SCHEMA.d_request REQ
on REQITEMF.request_key = REQ.row_key 
join #DWH_TABLE_SCHEMA.d_master_item ITEM
on ITEM.row_key = REQITEMF.catalog_item_key
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
on CI.row_key = REQITEMF.configuration_item_key
join
(
   select ic.*
   FROM #DWH_TABLE_SCHEMA.d_internal_contact ic
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact icm ON ic.manager_key = icm.row_key
) CNT
on CNT.row_key = REQITEMF.assigned_to_key
join #DWH_TABLE_SCHEMA.d_internal_contact DIC
on DIC.row_key = REQITEMF.opened_by_key
join 
(
   select iog.*
   FROM #DWH_TABLE_SCHEMA.d_internal_organization iog
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact icm ON iog.manager_key = icm.row_key
  WHERE iog.group_flag = 'Y' OR iog.row_key = 0 OR iog.row_key = -1
) ORG
on ORG.row_key = REQITEMF.assignment_group_key
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
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key AND lov.row_key <> 0 AND lov.row_key <> -1
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON br.wh_key = wh_lov.row_key
  WHERE lov.row_key = 0 OR lov.row_key = -1 OR lov.dimension_class = 'STAGE~SC_REQ_ITEM'
) to_stage
on to_stage.row_key = (case when fa.task_attribute_wh_name = 'stage' then fa.task_attribute_wh_next_value_key else 0 end)
join 
(
 SELECT lov.*, br.dimension_wh_code from_stage
 FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key AND lov.row_key <> 0 AND lov.row_key <> -1
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON br.wh_key = wh_lov.row_key
  WHERE lov.row_key = 0 OR lov.row_key = -1 OR lov.dimension_class = 'STAGE~SC_REQ_ITEM'
) from_stage
on from_stage.row_key = (case when fa.task_attribute_wh_name = 'stage' then fa.task_attribute_wh_new_value_key else 0 end)
join 
(
 SELECT lov.*, br.dimension_wh_code from_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~SC_REQ_ITEM'
UNION 
 SELECT lov.*, null as from_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) from_state
on from_state.row_key = (case when fa.task_attribute_wh_name = 'state' then fa.task_attribute_wh_new_value_key else 0 end)
join 
(
 SELECT lov.*, br.dimension_wh_code to_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~SC_REQ_ITEM'
UNION 
 SELECT lov.*, null as to_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) to_state
on to_state.row_key = (case when fa.task_attribute_wh_name = 'state' then fa.task_attribute_wh_next_value_key else 0 end)
join 
(
 SELECT lov.*, br.dimension_wh_code stage
 FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key AND lov.row_key <> 0 AND lov.row_key <> -1
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON br.wh_key = wh_lov.row_key
  WHERE lov.row_key = 0 OR lov.row_key = -1 OR lov.dimension_class = 'STAGE~SC_REQ_ITEM'
) stage
on stage.row_key = REQITEMF.stage_src_key
join 
(
 SELECT lov.*, br.dimension_wh_code state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~SC_REQ_ITEM'
UNION 
 SELECT lov.*, null as state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) state
on state.row_key = REQITEMF.state_src_key
join
(
 SELECT lov.*, br.dimension_wh_code priority_code, wh_lov.dimension_name as priority
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PRIORITY~SC_REQ_ITEM'
UNION 
 SELECT lov.*, lov.dimension_code priority_code, lov.dimension_name as priority
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) priority
on priority.row_key = REQITEMF.priority_src_key
where CAL.lagging_count_of_month between 0 and 12
and fa.task_wh_type = 'sc_req_item' 
group by req_item, req_item_num, ITEM.item_name, shrt, req, req_no, asignee, asgn_grp, dept, ci_name, priority_name, d.opened_on, d.due_on, d.closed_on, old_state, current_state, new_state, old_stage, current_stage, new_stage, state_no, stage_no, state_changed_on
order by req_item, req_item_num, upper(ITEM.item_name), shrt, req, req_no, asignee, asgn_grp, dept, ci_name, priority_name, d.opened_on, d.due_on, d.closed_on, old_state, current_state, new_state, old_stage, current_stage, new_stage, state_no, stage_no, state_change_cnt, stage_change_cnt, state_changed_on