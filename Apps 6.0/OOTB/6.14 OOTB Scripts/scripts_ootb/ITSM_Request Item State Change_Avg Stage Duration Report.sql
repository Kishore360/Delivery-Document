select 
from_stage.dimension_name old_stage,
round((avg(fa.primary_duration/86400.00)),1) avg_state_dur,
round((max(fa.primary_duration/86400.00)),1) max_state_dur,
round((min(fa.primary_duration/86400.00)),1) min_state_dur

FROM 
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
 SELECT lov.*, br.dimension_wh_code from_stage
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STAGE~SC_REQ_ITEM'
UNION 
 SELECT lov.*, null as from_stage
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) from_stage
on from_stage.row_key = (case when fa.task_attribute_wh_name = 'stage' then fa.task_attribute_wh_new_value_key else 0 end)
where CAL.lagging_count_of_month between 0 and 12
and REQITEMF.soft_deleted_flag = 'N'
group by old_stage
order by old_stage