select 
INC.incident_number incident,
d.incident_number incident_number_detail,
d.short_description shrt,
ci.name ci_name,
CNT.full_name asignee,
ORG.organization_name asgn_grp,
parent.incident_number parent_incident,
parent.incident_number parent_incident_number,
priority.dimension_name priority_name,
-- CNT.manager_name AS manager_name_INC,
-- ORG.manager_name AS manager_name_ORG,
d.major_incident_flag mi_flag,
d.reopened_flag re_flag,
coalesce(TO_CHAR(d.opened_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'') opened,
coalesce(TO_CHAR(d.last_resolved_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'') resolved,
coalesce(TO_CHAR(d.closed_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'') closed,
from_state.dimension_name old_state,
current_state.dimension_name curr_state,
to_state.dimension_name new_state,
fa.primary_sequence_id+1 state_no,
coalesce(TO_CHAR(fa.created_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'') state_on,
d.state_count state_change_count,
d.met_sla_flag met_all_sla_flag,
avg(d.state_count) avg_state_count,
trim(to_char(coalesce(round(sum(fa.primary_duration/86400.00)/count(fa.incident_key),1),0.0), '999,999,990.9')) avg_state_duration,
max(d.state_count) state_count,
trim(to_char(coalesce(round(sum(distinct fa.primary_duration/86400.00),1),0.0), '999,999,990.9')) state_duration

FROM 
(
 select t.*
   FROM #DWH_TABLE_SCHEMA.f_incident_activity t
   JOIN #DWH_TABLE_SCHEMA.f_incident f ON t.incident_key = f.incident_key AND f.soft_deleted_flag = 'N'::bpchar AND t.soft_deleted_flag = 'N'::bpchar AND t.expose_flag = 'Y'::bpchar
  WHERE t.task_wh_type::text = 'incident'::text AND t.task_attribute_wh_name::text = 'state'::text
)fa
join #DWH_TABLE_SCHEMA.d_incident d
on fa.incident_key = d.row_key 
join #DWH_TABLE_SCHEMA.f_incident INC
on INC.incident_key = d.row_key
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
select d_calendar_date.*
FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
  WHERE d_calendar_date.month_start_date_key = d_calendar_date.row_key AND d_calendar_date.source_id = 0
) cal_mon
on CAL.month_start_date_key = cal_mon.row_key
join #DWH_TABLE_SCHEMA.d_configuration_item CI
on CI.row_key = INC.configuration_item_key
join
(
 SELECT lov.*, br.dimension_wh_code priority_code, wh_lov.dimension_name as priority
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PRIORITY~INCIDENT'
UNION all
 SELECT lov.*, lov.dimension_code priority_code, lov.dimension_name as priority
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) priority
on priority.row_key = INC.priority_src_key
join 
(
 SELECT lov.*, br.dimension_wh_code state_code, wh_lov.dimension_name state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~INCIDENT'
UNION all
 SELECT lov.*, lov.dimension_code state_code, lov.dimension_name as state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) current_state
on current_state.row_key = INC.state_src_key
join 
(
 SELECT lov.*, br.dimension_wh_code from_state_code, wh_lov.dimension_name from_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~INCIDENT'
UNION all
 SELECT lov.*, lov.dimension_code from_state_code, lov.dimension_name from_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) from_state
on from_state.row_key = fa.task_attribute_wh_new_value_key
join 
(
 SELECT lov.*, br.dimension_wh_code to_state_code, wh_lov.dimension_name to_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~INCIDENT'
UNION all
 SELECT lov.*, lov.dimension_code to_state_code, lov.dimension_name to_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) to_state
on to_state.row_key = fa.task_attribute_wh_next_value_key
join 
(
   select iog.*, icm.full_name AS manager_name
   FROM #DWH_TABLE_SCHEMA.d_internal_organization iog
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact icm ON iog.manager_key = icm.row_key
  WHERE iog.group_flag = 'Y' OR iog.row_key = 0 OR iog.row_key = -1
) ORG
on ORG.row_key = INC.assignment_group_key
join
(
   select ic.*, icm.full_name AS manager_name
   FROM #DWH_TABLE_SCHEMA.d_internal_contact ic
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact icm ON ic.manager_key = icm.row_key
) CNT
on CNT.row_key = INC.assigned_to_key
join
(
   select din.*
   FROM #DWH_TABLE_SCHEMA.d_incident din
   JOIN 
   (
    SELECT DISTINCT d_incident.parent_incident_key
   FROM #DWH_TABLE_SCHEMA.d_incident
   )dpn ON din.row_key = dpn.parent_incident_key
) parent
on parent.row_key = INC.parent_incident_key
where cal_mon.lagging_count_of_month between 0 and 12
and fa.task_wh_type = 'incident'
group by incident, d.row_key, incident_number_detail, d.short_description, ci.name, asignee, asgn_grp, parent_incident, parent_incident_number, priority_name, CNT.manager_name, ORG.manager_name,mi_flag, re_flag, d.opened_on, d.last_resolved_on, d.closed_on, old_state, curr_state, new_state, state_no, fa.created_on, state_change_count, met_all_sla_flag
order by d.row_key, incident, incident_number_detail, upper(d.short_description), upper(ci.name), asignee, asgn_grp, parent_incident, parent_incident_number, priority_name, mi_flag, re_flag, d.opened_on, d.last_resolved_on, d.closed_on, old_state, curr_state, new_state, state_no, fa.created_on, state_change_count, met_all_sla_flag