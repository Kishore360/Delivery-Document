select 
f.change_request_number CR, 
f.change_request_number chng_req_num, 
CI.name CI,
priority.dimension_name priority_name,
risk.dimension_name risk_name,
coalesce(TO_CHAR(d.opened_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'') opened, 
type.dimension_name cr_type, 
CNT.full_name asignee,  
DIO.organization_name asgn_grp,
(fa.primary_sequence_id+1) sequence_no,
d.state_count state_cnt,
coalesce(current_state.dimension_name, 'UNSPECIFIED') curr_state,
coalesce(to_state.dimension_name, 'UNSPECIFIED') new_state,
coalesce(from_state.dimension_name, 'UNSPECIFIED') old_state,
coalesce(TO_CHAR(d.closed_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'') closed,
coalesce(TO_CHAR(fa.created_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'') state_change,
avg(d.state_count) avg_state_count,
max(d.state_count) state_change_cr,
case when (sum(fa.primary_duration)/86400.00) < 0 
then '-'||trim(to_char(coalesce(round((sum(fa.primary_duration * (-1))/86400.00)/count(fa.change_request_key),1),0), '999,999,990.9'))
else trim(to_char(coalesce(round((sum(fa.primary_duration)/86400.00)/count(fa.change_request_key),1),0), '999,999,990.9')) end avg_state_dur,
case when (sum(fa.primary_duration)/86400.00) < 0 
then '-'||trim(to_char(coalesce(round((sum(fa.primary_duration * (-1))/86400.00),1),0), '999,999,990.9'))
else trim(to_char(coalesce(round((sum(fa.primary_duration)/86400.00),1),0), '999,999,990.9')) end state_dur
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
 select lov.*, br.dimension_wh_code type_code, wh_lov.dimension_name type_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'TYPE~CHANGE_REQUEST'
UNION ALL 
 SELECT lov.*, lov.dimension_code type_code, lov.dimension_name type_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) type
on type.row_key = f.type_src_key
join 
(
   select ic.*
   FROM #DWH_TABLE_SCHEMA.d_internal_contact ic
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact icm ON ic.manager_key = icm.row_key
) CNT
on CNT.row_key = d.assigned_to_key
join 
(
   select iog.*
   FROM #DWH_TABLE_SCHEMA.d_internal_organization iog
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact icm ON iog.manager_key = icm.row_key
  WHERE iog.group_flag = 'Y'::bpchar OR iog.row_key = 0 OR iog.row_key = -1
) DIO
on DIO.row_key = f.assignment_group_key
join 
(
   select lov.*, br.dimension_wh_code risk_code, wh_lov.dimension_name risk
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'RISK~CHANGE_REQUEST'
UNION ALL 
 SELECT lov.*, lov.dimension_code risk_code, lov.dimension_name risk
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
)risk
on risk.row_key = d.risk_src_key 
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
join 
(
   select lov.*, br.dimension_wh_code to_state_code, wh_lov.dimension_name to_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~CHANGE_REQUEST'
UNION ALL 
 SELECT lov.*, lov.dimension_code to_state_code, lov.dimension_name to_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
)to_state
on to_state.row_key = fa.task_attribute_wh_next_value_key 
join
(
   select lov.*, br.dimension_wh_code state_code, wh_lov.dimension_name state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~CHANGE_REQUEST'
UNION ALL 
 SELECT lov.*, lov.dimension_code state_code, lov.dimension_name state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) current_state
on current_state.row_key = f.state_src_key 
join 
(
   select lov.*, br.dimension_wh_code priority_code, wh_lov.dimension_name priority
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PRIORITY~CHANGE_REQUEST'
UNION 
 SELECT lov.*, lov.dimension_code priority_code, lov.dimension_name priority
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) PRIORITY
on PRIORITY.row_key = f.priority_src_key
join #DWH_TABLE_SCHEMA.d_configuration_item CI
on CI.row_key = f.configuration_item_key
where CAL.lagging_count_of_month between 0 and 12
and f.soft_deleted_flag = 'N'
and fa.task_wh_type = 'change_request'
group by CR, chng_req_num, CI, priority_name, risk_name, d.opened_on, cr_type, asignee, asgn_grp, sequence_no, state_cnt, curr_state, new_state, old_state, closed, state_change
order by CR, chng_req_num, CI, priority_name, risk_name, d.opened_on, cr_type, asignee, asgn_grp, sequence_no, state_cnt, curr_state, new_state, old_state, closed, state_change desc