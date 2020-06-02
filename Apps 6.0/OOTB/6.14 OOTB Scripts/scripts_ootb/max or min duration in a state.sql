select 
-- FA.*,
prv_st.dimension_name prev_state,

round((max(FA.primary_duration)/86400.00),1) max_state_dur,

round((min(FA.primary_duration)/86400.00),1) min_state_dur

from #DWH_TABLE_SCHEMA.f_work_item_activity FA
join #DWH_TABLE_SCHEMA.f_work_item F
on FA.work_item_key = F.work_item_key and F.soft_deleted_flag = 'N'
join #DWH_TABLE_SCHEMA.d_work_item D
on FA.work_item_key = D.row_key and D.soft_deleted_flag = 'N'
join #DWH_TABLE_SCHEMA.d_iteration ITE
on ITE.row_key = D.iteration_key
join
(
   SELECT work_item_priority_src.*, work_item_priority_src.dimension_code AS wi_prio_code, work_item_priority_src.dimension_name AS wi_prio
   FROM #DWH_TABLE_SCHEMA.d_lov work_item_priority_src
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON work_item_priority_src.row_key = br.src_key AND work_item_priority_src.row_key <> 0 AND work_item_priority_src.row_key <> -1
  WHERE work_item_priority_src.dimension_class::text = 'PRIORITY~WORK_ITEM'
  OR work_item_priority_src.row_key = 0 OR work_item_priority_src.row_key = -1
) priority
on priority.row_key = D.work_item_priority_src_key
join 
(
   SELECT lov_workitem_status.*, wh_lov.dimension_code AS wi_sts_code, wh_lov.dimension_name AS wi_sts
   FROM #DWH_TABLE_SCHEMA.d_lov lov_workitem_status
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov_workitem_status.row_key = br.src_key AND lov_workitem_status.row_key <> 0 AND lov_workitem_status.row_key <> -1
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON br.wh_key = wh_lov.row_key
  WHERE lov_workitem_status.dimension_class = 'STATUS~WORK_ITEM' 
  OR lov_workitem_status.row_key = 0 OR lov_workitem_status.row_key = -1
) status
on status.row_key = D.work_item_status_src_key
join 
(
   SELECT work_item_status_category_src.*, work_item_status_category_src.dimension_code AS wi_sts_ctgy_code, work_item_status_category_src.dimension_name AS wi_sts_ctgy
   FROM #DWH_TABLE_SCHEMA.d_lov work_item_status_category_src
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON work_item_status_category_src.row_key = br.src_key AND work_item_status_category_src.row_key <> 0 AND work_item_status_category_src.row_key <> -1
  WHERE work_item_status_category_src.dimension_class = 'STATUS_CATEGORY~WORK_ITEM' 
  OR work_item_status_category_src.row_key = 0 OR work_item_status_category_src.row_key = -1
) status_category
on status_category.row_key = D.work_item_status_category_src_key
join 
(
select d_calendar_date.*
FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_day ON d_calendar_date.previous_day_key = prev_day.row_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_week ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
) cal
on cal.row_key = FA.created_on_key
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
join 
(
select *
from #DWH_TABLE_SCHEMA.d_internal_contact
) INTC_ASGN
on INTC_ASGN.row_key = D.work_item_assigned_to_key
join 
(
select source_id, max(lastupdated) lstupdt -- , max(TO_CHAR((lastupdated),'YYYYMMDD')) lstupdt_dt
from #DWH_TABLE_SCHEMA.d_o_data_freshness
group by source_id
) fresh
on fresh.source_id = FA.source_id
join 
(
select d_calendar_date.*
FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_day ON d_calendar_date.previous_day_key = prev_day.row_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_week ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
) curr_cal
on curr_cal.row_id = TO_CHAR((fresh.lstupdt),'YYYYMMDD')
join 
(
 SELECT lov_workitem_status.*, wh_lov.dimension_code AS prv_st_code, wh_lov.dimension_name AS prv_st
   FROM #DWH_TABLE_SCHEMA.d_lov lov_workitem_status
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov_workitem_status.row_key = br.src_key AND lov_workitem_status.row_key <> 0 AND lov_workitem_status.row_key <> -1
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON br.wh_key = wh_lov.row_key
  WHERE lov_workitem_status.dimension_class = 'STATUS~WORK_ITEM' 
  OR lov_workitem_status.row_key = 0 OR lov_workitem_status.row_key = -1
) prv_st
on prv_st.row_key = FA.task_attribute_wh_new_value_key
join 
(
 SELECT lov_workitem_status.*, wh_lov.dimension_code AS curr_st_code, wh_lov.dimension_name AS curr_st
   FROM #DWH_TABLE_SCHEMA.d_lov lov_workitem_status
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov_workitem_status.row_key = br.src_key AND lov_workitem_status.row_key <> 0 AND lov_workitem_status.row_key <> -1
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON br.wh_key = wh_lov.row_key
  WHERE lov_workitem_status.dimension_class = 'STATUS~WORK_ITEM' 
  OR lov_workitem_status.row_key = 0 OR lov_workitem_status.row_key = -1
) curr_st
on curr_st.row_key = FA.task_attribute_wh_next_value_key
left join 
(
 SELECT lov_workitem_status.*, wh_lov.dimension_code AS nxt_st_code, wh_lov.dimension_name AS nxt_st
   FROM #DWH_TABLE_SCHEMA.d_lov lov_workitem_status
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov_workitem_status.row_key = br.src_key AND lov_workitem_status.row_key <> 0 AND lov_workitem_status.row_key <> -1
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON br.wh_key = wh_lov.row_key
  WHERE lov_workitem_status.dimension_class = 'STATUS~WORK_ITEM' 
  OR lov_workitem_status.row_key = 0 OR lov_workitem_status.row_key = -1
) nxt_st
on nxt_st.row_key = FA.task_attribute_wh_next_value_key
/*left join 
(
select d_calendar_date.*
FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_day ON d_calendar_date.previous_day_key = prev_day.row_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_week ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
) cal_chngd_on
on cal_chngd_on.row_key = FA.wh_old_value_changed_on_key*/
join #DWH_TABLE_SCHEMA.d_work_item_version pv
on pv.row_key = D.earliest_fixed_version_key
where (cal_mon.lagging_count_of_month between 0 and 12 or D.proposed_flag = 'Y')
and FA.task_attribute_wh_name = 'STATUS' 
AND FA.primary_sequence_id <> 0 
AND D.soft_deleted_flag = 'N' 
AND FA.soft_deleted_flag = 'N'
group by prv_st.dimension_name
order by upper(prv_st.dimension_name)
