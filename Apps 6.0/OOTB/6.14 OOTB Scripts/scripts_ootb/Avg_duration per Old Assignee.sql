select from_assigned_to.full_name old_assignee_name, 

trim(to_char(coalesce(round(avg(INCACT.assigned_duration / 86400.00), 1),0), '9,999,999,990D9')) avg_duration_old_assignee,
trim(to_char(coalesce(round(sum(INCACT.assigned_duration / 86400.00), 1),0), '9,999,999,990D9')) duration_old_assignee

from 
(
SELECT t.row_key, t.source_id, 
        CASE
            WHEN t.task_attribute_wh_name = 'assigned_to' THEN t.primary_sequence_id + 1
            ELSE NULL
        END AS user_sequence_id, 
        CASE
            WHEN t.task_attribute_wh_name = 'assignment_group' THEN t.primary_sequence_id + 1
            ELSE NULL
        END AS group_sequence_id, t.incident_key, t.created_on_key AS assigned_on_key, 
        CASE
            WHEN t.task_attribute_wh_name = 'assignment_group' THEN 0
            ELSE t.task_attribute_wh_next_value_key
        END AS to_assigned_to_key, 
        CASE
            WHEN t.task_attribute_wh_name = 'assignment_group' THEN 0
            ELSE t.task_attribute_wh_new_value_key
        END AS from_assigned_to_key, 
        CASE
            WHEN t.task_attribute_wh_name = 'assigned_to' THEN 0
            ELSE t.task_attribute_wh_next_value_key
        END AS to_assignment_group_key, 
        CASE
            WHEN t.task_attribute_wh_name = 'assigned_to' THEN 0
            ELSE t.task_attribute_wh_new_value_key
        END AS from_assignment_group_key, 
        CASE
            WHEN t.task_attribute_wh_name = 'assigned_to' THEN 'USER'
            ELSE 'GROUP'
        END AS reassignment_type, t.primary_duration AS assigned_duration, f.assignment_group_key AS current_assginment_group_key, f.assigned_to_key AS current_assigned_to_key, f.priority_src_key, t.created_on AS assigned_on, f.update_count
   FROM #DWH_TABLE_SCHEMA.f_incident_activity t
   JOIN #DWH_TABLE_SCHEMA.f_incident f ON t.incident_key = f.incident_key AND f.soft_deleted_flag = 'N' AND t.soft_deleted_flag = 'N' AND t.expose_flag = 'Y'
  WHERE t.task_wh_type = 'incident' AND (t.task_attribute_wh_name = 'assigned_to' OR t.task_attribute_wh_name = 'assignment_group')
) INCACT
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
on cal.row_key = INCACT.assigned_on_key
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
) from_assigned_to
on from_assigned_to.row_key = INCACT.from_assigned_to_key
where cal_mon.lagging_count_of_month between 0 and 12
and from_assigned_to.full_name not in ('UNSPECIFIED')
group by old_assignee_name
order by upper(from_assigned_to.full_name)