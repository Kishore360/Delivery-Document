select 
coalesce(from_state.dimension_name, 'UNSPECIFIED') old_state,
round((avg(fa.primary_duration/86400.00)),1) avg_state_dur,
round((max(fa.primary_duration/86400.00)),1) max_state_dur,
round((min(fa.primary_duration/86400.00)),1) min_state_dur
from 
(
   select ftt.*
   FROM #DWH_TABLE_SCHEMA.f_change_request_activity ftt
   JOIN #DWH_TABLE_SCHEMA.f_change_request f ON ftt.change_request_key = f.change_request_key
   JOIN #DWH_TABLE_SCHEMA.d_change_request d ON d.row_key = f.change_request_key
WHERE ftt.task_wh_type = 'change_request' AND ftt.task_attribute_wh_name = 'state' AND f.soft_deleted_flag = 'N' AND ftt.expose_flag = 'Y'
) fa
join #DWH_TABLE_SCHEMA.f_change_request f
on f.change_request_key = fa.change_request_key
join #DWH_TABLE_SCHEMA.d_change_request d
on f.change_request_key = d.row_key 
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
   select lov.*, br.dimension_wh_code from_state_code, wh_lov.dimension_name from_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~CHANGE_REQUEST'
UNION ALL 
 SELECT lov.*, lov.dimension_code from_state_code, lov.dimension_name from_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) from_state
on from_state.row_key = fa.task_attribute_wh_new_value_key 
where CAL.lagging_count_of_month between 0 and 12
and f.soft_deleted_flag = 'N'
group by old_state
order by old_state