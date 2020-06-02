select d.problem_number prob,
d.problem_number prob_num, 
d.short_description shrt,
CI.name CI,
CNT.full_name asignee, 
ORG.organization_name asgn_grp,
priority.dimension_name priority_name, 
urgency.dimension_name urgency_name,
impact.dimension_name impact_name,
coalesce(TO_CHAR(d.opened_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'') opened, 
coalesce(TO_CHAR(d.closed_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'')  closed,
coalesce(TO_CHAR(d.due_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'') as due_date,
coalesce(TO_CHAR(d.work_start_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'') act_strt,
coalesce(TO_CHAR(d.work_end_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'') act_end,
current_state.dimension_name curr_state,
coalesce(to_state.dimension_name, 'UNSPECIFIED') new_state,
coalesce(from_state.dimension_name, 'UNSPECIFIED') old_state,
d.known_error_flag known,
coalesce(TO_CHAR(f.created_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'') state_changed_on,
max(d.state_count) state_chng_cnt,
fa.primary_sequence_id+1 seq,
avg(d.state_count) avg_state_cnt,
trim(to_char(coalesce(round((sum(fa.sum_primary_duration)/86400.00)/sum(fa.count_problem_key),1),0.0), '999,999,990.9')) avg_state_dur,
max(d.state_count) state_cnt,
trim(to_char(coalesce(round((sum(distinct fa.sum_primary_duration)/86400.00),1),0.0), '999,999,990.9')) state_dur
from (
select ftt.primary_sequence_id AS primary_sequence_id, 
max(ftt.primary_duration) AS primary_duration, sum(ftt.primary_duration) AS sum_primary_duration, count(ftt.problem_key) AS count_problem_key,
 ftt.task_attribute_wh_new_value_key AS task_attribute_wh_new_value_key, ftt.task_attribute_wh_next_value_key AS task_attribute_wh_next_value_key, 
 ftt.created_on_key AS created_on_key, ftt.problem_key, 
 f.assignment_group_key, f.assigned_to_key, f.impact_src_key, f.priority_src_key, f.urgency_src_key, 
 f.configuration_item_key, d.problem_number, f.change_request_key, d.known_error_flag, d.short_description, 
 f.state_src_key AS state_src_key, d.state_count, f.created_on AS created_on,
 ftt.task_attribute_wh_name
   FROM #DWH_TABLE_SCHEMA.f_problem_activity ftt
   JOIN #DWH_TABLE_SCHEMA.f_problem f ON ftt.problem_key = f.problem_key AND ftt.expose_flag = 'Y'::bpchar
   JOIN #DWH_TABLE_SCHEMA.d_problem d ON d.row_key = f.problem_key
     WHERE ftt.task_wh_type::text = 'problem'::text AND ftt.task_attribute_wh_name::text = 'problem_state'::text 
  AND f.soft_deleted_flag = 'N'
  group by primary_sequence_id, ftt.task_attribute_wh_new_value_key, ftt.task_attribute_wh_next_value_key, 
 ftt.created_on_key, ftt.problem_key, f.assignment_group_key, f.assigned_to_key, f.impact_src_key, f.priority_src_key, f.urgency_src_key, 
 f.configuration_item_key, d.problem_number, f.change_request_key, d.known_error_flag, d.short_description, f.state_src_key, d.state_count,
 f.created_on, ftt.task_attribute_wh_name
) fa
join #DWH_TABLE_SCHEMA.f_problem f
on f.problem_key = fa.problem_key
join #DWH_TABLE_SCHEMA.d_problem d
on f.problem_key = d.row_key 
/*join 
(
 SELECT ftt.primary_sequence_id AS primary_sequence_id, ftt.task_attribute_wh_new_value_key AS from_state_key, 
 ftt.task_attribute_wh_next_value_key AS to_state_key, ftt.created_on_key AS state_on_key, ftt.problem_key, ftt.task_attribute_wh_name, d.problem_number,
 max(ftt.primary_duration) AS state_duration
   FROM #DWH_TABLE_SCHEMA.f_problem_activity ftt
   JOIN #DWH_TABLE_SCHEMA.f_problem f ON ftt.problem_key = f.problem_key AND ftt.expose_flag = 'Y'
   JOIN #DWH_TABLE_SCHEMA.d_problem d ON d.row_key = f.problem_key
     WHERE ftt.task_wh_type::text = 'problem' AND ftt.task_attribute_wh_name::text = 'problem_state'
  AND f.soft_deleted_flag = 'N' and d.problem_number = 'PRB0000008'
  group by ftt.primary_sequence_id, ftt.task_attribute_wh_new_value_key, ftt.task_attribute_wh_next_value_key, 
 ftt.created_on_key, ftt.problem_key, ftt.task_attribute_wh_name, d.problem_number
) fa_next
on fa.problem_key = fa_next.problem_key and fa.primary_sequence_id = fa_next.primary_sequence_id
and fa.task_attribute_wh_new_value_key = fa_next.from_state_key
and fa.task_attribute_wh_next_value_key = fa_next.to_state_key
and fa.task_attribute_wh_name = fa_next.task_attribute_wh_name
and fa_next.problem_number = d.problem_number*/
join #DWH_TABLE_SCHEMA.d_change_request chng
on chng.row_key = f.change_request_key
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
   select lov.*, br.dimension_wh_code priority_code, wh_lov.dimension_name priority
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PRIORITY~PROBLEM'
UNION 
 SELECT lov.*, lov.dimension_code priority_code, lov.dimension_name priority
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) PRIORITY
on PRIORITY.row_key = f.priority_src_key
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
   select lov.*, br.dimension_wh_code from_state_code, wh_lov.dimension_name from_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~PROBLEM'
UNION ALL 
 SELECT lov.*, lov.dimension_code from_state_code, lov.dimension_name from_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) from_state
on from_state.row_key = fa.task_attribute_wh_new_value_key 
join 
(
   select lov.*, br.dimension_wh_code to_state_code, wh_lov.dimension_name to_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~PROBLEM'
UNION ALL 
 SELECT lov.*, lov.dimension_code to_state_code, lov.dimension_name to_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
)to_state
on to_state.row_key = fa.task_attribute_wh_next_value_key 
join
(
   select lov.*, br.dimension_wh_code urgency_code, wh_lov.dimension_name urgency
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'URGENCY~PROBLEM'
UNION 
  SELECT lov.*, lov.dimension_code urgency_code, lov.dimension_name urgency
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) urgency
on urgency.row_key = f.urgency_src_key 
join
(
   select lov.*, br.dimension_wh_code impact_code, wh_lov.dimension_name impact
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'IMPACT~PROBLEM'
UNION 
  SELECT lov.*, lov.dimension_code impact_code, lov.dimension_name impact
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) impact
on impact.row_key = f.impact_src_key 
join
(
   select lov.*, br.dimension_wh_code state_code, wh_lov.dimension_name state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~PROBLEM'
UNION ALL 
 SELECT lov.*, lov.dimension_code state_code, lov.dimension_name state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) current_state
on current_state.row_key = f.state_src_key 
where CAL.lagging_count_of_month between 0 and 12
and f.soft_deleted_flag = 'N'
group by prob, prob_num, shrt, CI, asignee, asgn_grp, priority_name, urgency_name, impact_name, opened, d.closed_on, d.due_on, d.work_start_on, d.work_end_on, curr_state, new_state, old_state, known, state_changed_on, seq
order by prob, prob_num, upper(d.short_description), upper(CI.name), asignee, asgn_grp, priority_name, urgency_name, impact_name, opened, d.closed_on, d.due_on, d.work_start_on, d.work_end_on, curr_state, new_state, old_state, known, state_changed_on, seq

