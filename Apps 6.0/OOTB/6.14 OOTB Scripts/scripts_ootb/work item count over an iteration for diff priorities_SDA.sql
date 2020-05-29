select DIT.name it_nm,
priority.dimension_name prio_nm,
trim(to_char(coalesce(round((count(distinct D.work_item_number)),0),0), '9,999,999,990')) ITR_count
from #DWH_TABLE_SCHEMA.f_work_item_iteration F
join #DWH_TABLE_SCHEMA.f_work_item FWI
on F.work_item_key = FWI.work_item_key and FWI.soft_deleted_flag = 'N'
join #DWH_TABLE_SCHEMA.d_work_item D
on F.work_item_key = D.row_key and F.soft_deleted_flag = 'N'
join #DWH_TABLE_SCHEMA.d_iteration DIT
on DIT.row_key = F.work_item_iteration_m2m_key
join
(
 SELECT lov.*, lov.dimension_code AS wi_prio_code, lov.dimension_name AS wi_prio
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   where lov.dimension_class = 'PRIORITY~WORK_ITEM'
UNION 
 SELECT lov.*, lov.dimension_code AS wi_prio_code, lov.dimension_name AS wi_prio
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) priority
on priority.row_key = D.work_item_priority_src_key
join 
(
 SELECT lov.*, wh_lov.dimension_code AS wi_sts_code, wh_lov.dimension_name AS wi_sts, lov.dimension_name sor_lov_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATUS~WORK_ITEM'
UNION 
 SELECT lov.*, lov.dimension_code AS wi_sts_code, lov.dimension_name AS wi_sts, lov.dimension_name AS sor_lov_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) status
on status.row_key = D.work_item_status_src_key
left join 
(
select d_calendar_date.*
FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_day ON d_calendar_date.previous_day_key = prev_day.row_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_week ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
) cal_dte
on cal_dte.row_key = F.work_item_m2m_key
left join 
(
select d_calendar_date.*
FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
  WHERE d_calendar_date.month_start_date_key = d_calendar_date.row_key AND d_calendar_date.source_id = 0
) cal_dte_mon
on cal_dte.month_start_date_key = cal_dte_mon.row_key
join 
(
select *
from #DWH_TABLE_SCHEMA.d_internal_contact
) INTC_RSLV
on INTC_RSLV.row_key = FWI.work_item_resolved_by_key
where ((cal_dte_mon.lagging_count_of_month between 0 and 12) or
status.wi_sts = 'PROPOSED' or status.wi_sts = 'IN PROGRESS')
group by DIT.row_key, DIT.name, priority.dimension_name
order by DIT.row_key, upper(DIT.name), upper(priority.dimension_name)