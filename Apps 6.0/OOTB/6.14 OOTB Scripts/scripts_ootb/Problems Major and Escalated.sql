select p_state.dimension_name as "state", cal_mon.year_name , cal_mon.month_name_abbreviated,  '' as metrics , 
coalesce(sum(dp.reassignment_count),0) as problem_reassignment,
sum(case when dp.priority_escalated_flag = 'Y'then 1 else 0 end)as"Priority escalated flags", 
sum(case when dp.known_error_flag = 'Y'then 1 else 0 end )as "known error"
from #DWH_TABLE_SCHEMA.f_problem fp
left join(
SELECT lov.*, wh_lov.dimension_code AS state_code, wh_lov.dimension_name AS state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~PROBLEM'
UNION ALL 
 SELECT lov.*, lov.dimension_code AS state_code, lov.dimension_name AS state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0) p_state
  on p_state.row_key = fp.state_src_key
left join #DWH_TABLE_SCHEMA.d_problem dp
on fp.problem_key = dp.row_key
left join #DWH_TABLE_SCHEMA.d_internal_organization dio
on fp.opened_by_department_key = dio.row_key
/*left join #DWH_TABLE_SCHEMA.d_lov dv
on dv.row_key = fp.state_src_key
left join #DWH_TABLE_SCHEMA.d_lov_map dvm
on dvm.dimension_code  = dv.dimension_code
and dvm.dimension_class=dv.dimension_class*/
left join 
(
SELECT d_calendar_date.*
   FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_day ON d_calendar_date.previous_day_key = prev_day.row_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_week ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
) CAL
on fp.opened_on_key = CAL.row_key
join 
(
select d_calendar_date.*
FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
  WHERE d_calendar_date.month_start_date_key = d_calendar_date.row_key AND d_calendar_date.source_id = 0
) cal_mon
on cal.month_start_date_key = cal_mon.row_key
where p_state.dimension_name is not NULL
group by p_state.dimension_name ,cal_mon.year_name ,cal_mon.month_name_abbreviated,p_state.row_key,cal_mon.row_key
order by p_state.row_key asc,cal_mon.row_key asc

