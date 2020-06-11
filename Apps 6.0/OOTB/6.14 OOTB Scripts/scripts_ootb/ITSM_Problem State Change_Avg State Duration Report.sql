select coalesce(from_state.dimension_name, 'UNSPECIFIED') old_state,
round((avg(fa.primary_duration)/86400.00),1) avg_state_dur,
round((max(fa.primary_duration)/86400.00),1) max_state_dur,
round((min(fa.primary_duration)/86400.00),1) min_state_dur
from (
select ftt.*
   FROM #DWH_TABLE_SCHEMA.f_problem_activity ftt
   JOIN #DWH_TABLE_SCHEMA.f_problem f ON ftt.problem_key = f.problem_key AND ftt.expose_flag = 'Y'
   JOIN #DWH_TABLE_SCHEMA.d_problem d ON d.row_key = f.problem_key
  WHERE ftt.task_wh_type = 'problem' AND ftt.task_attribute_wh_name = 'problem_state' AND f.soft_deleted_flag = 'N'
) fa
join #DWH_TABLE_SCHEMA.f_problem f
on f.problem_key = fa.problem_key
join #DWH_TABLE_SCHEMA.d_problem d
on f.problem_key = d.row_key 
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
group by old_state
order by old_state