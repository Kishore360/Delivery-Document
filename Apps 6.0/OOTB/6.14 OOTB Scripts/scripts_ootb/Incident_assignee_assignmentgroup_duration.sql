select D.row_key inc_key,
D.incident_number inc_num,
INCACT.reassignment_type act_typ,
to_char(INCACT.assigned_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM') act_dt,
D.major_incident_flag mi_flg,
CAST(INCACT.user_sequence_id as DECIMAL(10,0)) asgn_handoff_no,
CAST(INCACT.group_sequence_id as DECIMAL(10,0)) grp_reasgn_no,
IOG.organization_name curr_org,

round(sum(INCACT.assigned_duration/86400.00), 1) duration

from 
(
 SELECT 
        CASE
            WHEN incident_activity_fact.task_attribute_wh_name = 'assigned_to' THEN incident_activity_fact.primary_sequence_id + 1
            ELSE NULL::integer
        END AS user_sequence_id, 
        CASE
            WHEN incident_activity_fact.task_attribute_wh_name = 'assigned_to' THEN 'USER'
            ELSE 'GROUP'
        END AS reassignment_type, incident_activity_fact.created_on_key AS fiscal_date_key, incident_activity_fact.created_on AS assigned_on, 
        CASE
            WHEN incident_activity_fact.task_attribute_wh_name = 'assignment_group' THEN 0::bigint
            ELSE incident_activity_fact.task_attribute_wh_next_value_key
        END AS to_assigned_to_key, incident_activity_fact.created_on_key AS date_key, 
        CASE
            WHEN incident_activity_fact.task_attribute_wh_name = 'assignment_group' THEN 0::bigint
            ELSE incident_activity_fact.task_attribute_wh_next_value_key
        END AS number_of_assignees_involved, 
        CASE
            WHEN incident_activity_fact.task_attribute_wh_name = 'assignment_group' THEN 0::bigint
            ELSE incident_activity_fact.task_attribute_wh_new_value_key
        END AS from_assigned_to_key, incident_activity_fact.assignment_group_key AS current_assignment_group_key, 
        CASE
            WHEN incident_activity_fact.task_attribute_wh_name = 'assigned_to' THEN 0::bigint
            ELSE incident_activity_fact.task_attribute_wh_next_value_key
        END AS new_assignment_group_key, incident_activity_fact.primary_duration AS assigned_duration, 
        CASE
            WHEN incident_activity_fact.task_attribute_wh_name = 'assignment_group' THEN incident_activity_fact.primary_sequence_id + 1
            ELSE NULL::integer
        END AS group_sequence_id, 
        CASE
            WHEN incident_activity_fact.task_attribute_wh_name = 'assigned_to' THEN 0::bigint
            ELSE incident_activity_fact.task_attribute_wh_new_value_key
        END AS from_assignment_group_key, 
        CASE
            WHEN incident_activity_fact.task_attribute_wh_name = 'assigned_to' THEN 0::bigint
            ELSE incident_activity_fact.task_attribute_wh_next_value_key
        END AS to_assignment_group_key, incident_activity_fact.row_key, incident_activity_fact.soft_deleted_flag, incident_activity_fact.secondary2_changed_on, 
		incident_activity_fact.created_time_key, incident_activity_fact.row_id, incident_activity_fact.changed_by, incident_activity_fact.secondary1_changed_on, 
		incident_activity_fact.source_id, incident_activity_fact.wh_old_value_changed_on_key, incident_activity_fact.etl_run_number, incident_activity_fact.created_on, 
		incident_activity_fact.dw_inserted_on, incident_activity_fact.created_on_key, incident_activity_fact.incident_key, incident_activity_fact.cdctype, 
		incident_activity_fact.dw_updated_on, incident_activity_fact.created_by, incident_activity_fact.changed_on
   FROM #DWH_TABLE_SCHEMA.f_incident_activity incident_activity_fact
   JOIN #DWH_TABLE_SCHEMA.f_incident incident_fact ON incident_activity_fact.incident_key = incident_fact.incident_key AND incident_fact.soft_deleted_flag = 'N' AND incident_activity_fact.soft_deleted_flag = 'N' AND incident_activity_fact.expose_flag = 'Y'
  WHERE incident_activity_fact.task_wh_type = 'incident' AND (incident_activity_fact.task_attribute_wh_name = 'assigned_to' OR incident_activity_fact.task_attribute_wh_name = 'assignment_group')
) INCACT
left join
(
select *
FROM #DWH_TABLE_SCHEMA.f_incident
  WHERE f_incident.soft_deleted_flag = 'N'
) F
on F.assignment_group_key = INCACT.current_assignment_group_key and 
F.incident_key = INCACT.incident_key and 
F.opened_on_key = INCACT.date_key
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
on cal.row_key = coalesce(INCACT.date_key, 0)
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
join #DWH_TABLE_SCHEMA.d_incident D
on D.row_key = INCACT.incident_key
join 
(
 SELECT lov.*, wh_lov.dimension_code AS priority_code, wh_lov.dimension_name AS priority
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PRIORITY~INCIDENT'
UNION 
 SELECT lov.*, lov.dimension_code AS priority_code, lov.dimension_name AS priority
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) priority
on D.priority_src_key = priority.row_key
join  
(
 SELECT lov.*, wh_lov.dimension_code AS state_code, wh_lov.dimension_name AS state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~INCIDENT'
UNION 
 SELECT lov.*, lov.dimension_code AS state_code, lov.dimension_name AS state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) state
on D.state_src_key = state.row_key
join  
(
select * 
from #DWH_TABLE_SCHEMA.d_internal_contact
) to_assigned_to
on to_assigned_to.row_key = INCACT.to_assigned_to_key
join  
(
select * 
from #DWH_TABLE_SCHEMA.d_internal_contact
) from_assigned_to
on from_assigned_to.row_key = INCACT.from_assigned_to_key
join 
(
   select iog.*
   FROM #DWH_TABLE_SCHEMA.d_internal_organization iog
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact icm ON iog.manager_key = icm.row_key
  WHERE iog.group_flag = 'Y' OR iog.row_key = 0 OR iog.row_key = -1
) IOG
on IOG.row_key = INCACT.current_assignment_group_key
left join 
(
select * 
from #DWH_TABLE_SCHEMA.d_internal_contact
) GRP_MAN
on GRP_MAN.row_id = IOG.manager_id
join 
(
   select iog.*
   FROM #DWH_TABLE_SCHEMA.d_internal_organization iog
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact icm ON iog.manager_key = icm.row_key
  WHERE iog.group_flag = 'Y' OR iog.row_key = 0 OR iog.row_key = -1
) IOG_FROM
on IOG_FROM.row_key = INCACT.from_assignment_group_key
join 
(
   select iog.*
   FROM #DWH_TABLE_SCHEMA.d_internal_organization iog
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact icm ON iog.manager_key = icm.row_key
  WHERE iog.group_flag = 'Y' OR iog.row_key = 0 OR iog.row_key = -1
) IOG_TO
on IOG_TO.row_key = INCACT.to_assignment_group_key
where cal_mon.lagging_count_of_month between 0 and 12
-- and F.soft_deleted_flag = 'N'
group by inc_key, inc_num, act_typ, INCACT.assigned_on, mi_flg, asgn_handoff_no, grp_reasgn_no, curr_org
order by inc_key, inc_num, act_typ, INCACT.assigned_on, mi_flg, asgn_handoff_no, grp_reasgn_no, curr_org;