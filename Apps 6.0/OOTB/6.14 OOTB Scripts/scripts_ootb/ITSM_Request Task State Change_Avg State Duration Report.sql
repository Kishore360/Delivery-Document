select 
from_state.dimension_name old_state,
round((avg(fa.primary_duration/86400.00)),1) avg_state_dur,
round((max(fa.primary_duration/86400.00)),1) max_state_dur,
round((min(fa.primary_duration/86400.00)),1) min_state_dur

FROM 
(
 select ftt.*, f.request_key, f.request_item_key
 FROM #DWH_TABLE_SCHEMA.f_request_task_activity ftt
   JOIN #DWH_TABLE_SCHEMA.f_request_task f ON ftt.request_task_key = f.request_task_key AND ftt.expose_flag = 'Y'::bpchar
   JOIN #DWH_TABLE_SCHEMA.d_request_task d ON d.row_key = f.request_task_key
   JOIN #DWH_TABLE_SCHEMA.f_request_item frq ON frq.row_key = f.request_item_key
  WHERE ftt.task_wh_type = 'sc_task' AND ftt.task_attribute_wh_name = 'state' AND f.soft_deleted_flag = 'N'
) fa
join #DWH_TABLE_SCHEMA.f_request_task f
on f.request_task_key = fa.request_task_key 
join #DWH_TABLE_SCHEMA.d_request_task d
on f.request_task_key = d.row_key 
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
where CAL.lagging_count_of_month between 0 and 12
and f.soft_deleted_flag = 'N'
group by old_state
order by old_state