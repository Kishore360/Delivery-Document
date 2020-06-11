select 
d.request_task_number task, 
d.request_task_number task_num, 
d.short_description shrt,
REQ.request_number req,
REQ.request_number req_num,
REQ_ITEM.request_item_number req_item,
REQ_ITEM.request_item_number req_item_num,
ritm_state.dimension_name ritm_curr_state,
ritm_stage.dimension_name ritm_curr_stage,
coalesce(TO_CHAR(d.opened_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'') opened, 
coalesce(TO_CHAR(d.due_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'') due_date,
coalesce(TO_CHAR(d.work_start_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'') act_strt,
coalesce(TO_CHAR(d.work_end_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'') act_end,
coalesce(TO_CHAR(d.closed_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'') closed,
to_state.dimension_name new_state,
current_state.dimension_name curr_state,
from_state.dimension_name old_state,
fa.primary_sequence_id+1 as state_no,
coalesce(TO_CHAR(fa.created_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'') state_on,
max(d.state_count) state_chng_cnt,
PRIORITY.dimension_name priority_name, 
CNT.full_name asignee, 
ORG.organization_name asgn_grp,
CI.name ci_name,
upon_aproval.dimension_name upon_aprv,
approval.dimension_name approval_name,
avg(d.state_count) avg_state_cnt,
max(d.state_count) state_cnt,
trim(to_char(coalesce(round((sum(fa.primary_duration)/86400.00)/count(fa.request_task_key),1),0.0), '999,999,990.9')) avg_state_dur,
trim(to_char(coalesce(round(sum(fa.primary_duration)/86400.00,1),0.0), '999,999,990.9')) state_dur
FROM 
(
 select ftt.*, f.request_key, frq.request_item_key, frq.state_src_key, frq.stage_src_key
   FROM #DWH_TABLE_SCHEMA.f_request_task_activity ftt
   JOIN #DWH_TABLE_SCHEMA.f_request_task f ON ftt.request_task_key = f.request_task_key AND ftt.expose_flag = 'Y'::bpchar
   JOIN #DWH_TABLE_SCHEMA.d_request_task d ON d.row_key = f.request_task_key
   JOIN #DWH_TABLE_SCHEMA.f_request_item frq ON frq.row_key = f.request_item_key
  WHERE ftt.task_wh_type::text = 'sc_task' AND ftt.task_attribute_wh_name = 'state' AND f.soft_deleted_flag = 'N'
) fa
join #DWH_TABLE_SCHEMA.d_request_task d
on fa.request_task_key = d.row_key 
join #DWH_TABLE_SCHEMA.f_request_task f
on d.row_key = f.request_task_key and f.soft_deleted_flag = 'N'
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
join #DWH_TABLE_SCHEMA.d_request REQ
on REQ.row_key = fa.request_key
join #DWH_TABLE_SCHEMA.d_request_item REQ_ITEM
on REQ_ITEM.row_key = fa.request_item_key
join #DWH_TABLE_SCHEMA.d_configuration_item CI
on CI.row_key = f.configuration_item_key
join 
(
   select ic.*
   FROM #DWH_TABLE_SCHEMA.d_internal_contact ic
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact icm ON ic.manager_key = icm.row_key
) CNT
on CNT.row_key = f.assigned_to_key
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
    SELECT lov.*, br.dimension_wh_code approval_code, wh_lov.dimension_name approval
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'APPROVAL~SC_TASK'
UNION 
 SELECT lov.*, lov.dimension_code approval_code, lov.dimension_name as approval
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) approval
on approval.row_key = f.approval_state_src_key
join 
(
 SELECT lov.*, br.dimension_wh_code from_state_code, wh_lov.dimension_name from_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~SC_TASK'
UNION ALL
 SELECT lov.*, lov.dimension_code from_state_code, lov.dimension_name as from_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) from_state
on from_state.row_key = fa.task_attribute_wh_new_value_key
join 
(
 SELECT lov.*, br.dimension_wh_code to_state_code, wh_lov.dimension_name to_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~SC_TASK'
UNION ALL
 SELECT lov.*, lov.dimension_code to_state_code, lov.dimension_name as to_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) to_state
on to_state.row_key = fa.task_attribute_wh_next_value_key
join 
(
 SELECT lov.*, br.dimension_wh_code current_state_code, wh_lov.dimension_name current_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~SC_TASK'
UNION 
 SELECT lov.*, lov.dimension_code current_state_code, lov.dimension_name as current_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) current_state
on current_state.row_key = f.state_src_key
join 
(
 SELECT lov.*, br.dimension_wh_code priority_code, wh_lov.dimension_name as priority
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PRIORITY~SC_TASK'
UNION 
 SELECT lov.*, lov.dimension_code priority_code, lov.dimension_name as priority
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) PRIORITY
on PRIORITY.row_key = f.priority_src_key 
join 
(
 SELECT lov.*, br.dimension_wh_code upon_aproval_code, wh_lov.dimension_name as upon_aproval
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'UPON_APPROVAL~SC_TASK'
UNION ALL
 SELECT lov.*, lov.dimension_code upon_aproval_code, lov.dimension_name as upon_aproval
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) upon_aproval
on upon_aproval.row_key = f.upon_approval_src_key 
join 
(
 SELECT lov.*, br.dimension_wh_code ritm_state_code, wh_lov.dimension_name ritm_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~SC_REQ_ITEM'
UNION 
 SELECT lov.*, lov.dimension_code ritm_state_code, lov.dimension_name as ritm_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) ritm_state
on ritm_state.row_key = fa.state_src_key
join 
(
 SELECT lov.*, br.dimension_wh_code ritm_stage_code, wh_lov.dimension_name ritm_stage
 FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key AND lov.row_key <> 0 AND lov.row_key <> -1
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON br.wh_key = wh_lov.row_key
  WHERE lov.row_key = 0 OR lov.row_key = -1 OR lov.dimension_class = 'STAGE~SC_REQ_ITEM'
) ritm_stage
on ritm_stage.row_key = fa.stage_src_key
where CAL.lagging_count_of_month between 0 and 12
and fa.task_wh_type = 'sc_task' and f.soft_deleted_flag = 'N'
group by task, task_num, shrt, req, req_num, req_item, req_item_num, ritm_curr_state, ritm_curr_stage, opened, due_date, act_strt, act_end, closed, new_state, curr_state, old_state, state_no, state_on, upon_aprv,
priority_name, asignee, asgn_grp, ci_name, approval_name
order by d.request_task_number, task_num, shrt, req, req_num, req_item, req_item_num, ritm_curr_state, ritm_curr_stage, opened, due_date, act_strt, act_end, closed, new_state, curr_state, old_state, state_no, state_on, state_chng_cnt, upon_aprv,
priority_name, asignee, asgn_grp, ci_name, approval_name;