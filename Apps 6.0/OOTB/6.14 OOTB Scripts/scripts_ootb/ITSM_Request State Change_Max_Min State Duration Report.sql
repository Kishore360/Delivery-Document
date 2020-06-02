select 
from_state.dimension_name old_state,
round((max(fa.primary_duration/86400.00)),1) max_state_dur,
round((min(fa.primary_duration/86400.00)),1) min_state_dur

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
where CAL.lagging_count_of_month between 0 and 12
and f.soft_deleted_flag = 'N'
and fa.task_wh_type = 'sc_request'
-- AND fa.task_attribute_wh_name in ('state', 'stage', 'request_state')
and fa.primary_duration is not null
group by old_state
order by old_state

