select prio.dimension_name priority,

case when count(case when aprvl.aprvl = 'APPROVED' then F.change_task_key else null end) <> 0 then 
round((sum(case when aprvl.aprvl = 'APPROVED' then F.approval_duration else 0 end)/86400.00)/
count(case when aprvl.aprvl = 'APPROVED' then F.change_task_key else null end),1)
-- when count(case when aprvl.aprvl = 'APPROVED' and F.change_task_key is not null then F.change_task_key else null end) = 0 then round(0,1)
else null end avg_aprvl_dur,

case when count(case when D.overdue_flag = 'Y' then F.change_task_key else null end) <> 0 then 
round((sum(case when D.overdue_flag = 'Y' then F.overdue_duration else 0 end)/86400.00)/
count(case when D.overdue_flag = 'Y' then F.change_task_key else null end),1)
-- when count(case when D.overdue_flag = 'Y' and F.change_task_key is not null then F.change_task_key else null end) = 0 then round(0,1)
else null end avg_ovrdue_dur

from
(
   select f_change_task.*
   FROM #DWH_TABLE_SCHEMA.f_change_task f_change_task
   LEFT JOIN #DWH_TABLE_SCHEMA.d_change_request d_change_request ON f_change_task.change_request_key = d_change_request.row_key
   LEFT JOIN #DWH_TABLE_SCHEMA.f_change_request f_change_request ON f_change_task.change_request_key = f_change_request.change_request_key
  WHERE f_change_task.soft_deleted_flag = 'N'
) F
join 
(
   select d_change_task.*
   FROM #DWH_TABLE_SCHEMA.d_change_task d_change_task
   JOIN #DWH_TABLE_SCHEMA.f_change_task f_change_task ON f_change_task.change_task_key = d_change_task.row_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact v1 ON f_change_task.opened_by_key = v1.row_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact v2 ON f_change_task.closed_by_key = v2.row_key
  WHERE d_change_task.soft_deleted_flag = 'N'
) D
on F.change_task_key = D.row_key
join  
(
 SELECT lov.*, wh_lov.dimension_code AS state_code, wh_lov.dimension_name AS state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~CHANGE_TASK'
UNION 
 SELECT lov.*, lov.dimension_code AS state_code, lov.dimension_name AS state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) state
on D.state_src_key = state.row_key
join #DWH_TABLE_SCHEMA.d_change_request cr
on cr.row_key = F.change_request_key
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
on cal.row_key = F.opened_on_key -- case when state.state = 'CLOSED' then F.closed_on_key else F.opened_on_key end -- coalesce(F.closed_on_key, F.opened_on_key)
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
join #DWH_TABLE_SCHEMA.d_application app
on app.row_key = F.application_key
join 
(
select d_service.*
   FROM #DWH_TABLE_SCHEMA.d_service d_service
  WHERE d_service.is_business_service_flag = 'Y' OR d_service.row_key = 0 OR d_service.row_key = -1
) srvc
on srvc.row_key = F.business_service_key
join #DWH_TABLE_SCHEMA.d_configuration_item CI
on CI.row_key = F.configuration_item_key
join  
(
 SELECT lov.*, wh_lov.dimension_code AS aprvl_code, wh_lov.dimension_name AS aprvl
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'APPROVAL~CHANGE_TASK'
UNION 
 SELECT lov.*, lov.dimension_code AS aprvl_code, lov.dimension_name AS aprvl
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) aprvl
on D.approval_src_key = aprvl.row_key
join  
(
 SELECT lov.*, wh_lov.dimension_code AS prio_code, wh_lov.dimension_name AS prio
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PRIORITY~CHANGE_TASK'
UNION 
 SELECT lov.*, lov.dimension_code AS prio_code, lov.dimension_name AS prio
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) prio
on D.priority_src_key = prio.row_key
join  
(
 SELECT lov.*, wh_lov.dimension_code AS impct_code, wh_lov.dimension_name AS impct
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'IMPACT~CHANGE_TASK'
UNION 
 SELECT lov.*, lov.dimension_code AS impct_code, lov.dimension_name AS impct
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) impct
on D.impact_src_key = impct.row_key
join  
(
 SELECT lov.*, wh_lov.dimension_code AS rprt_typ_code, wh_lov.dimension_name AS rprt_typ
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'CONTACT_TYPE~CHANGE_TASK'
UNION 
 SELECT lov.*, lov.dimension_code AS rprt_typ_code, lov.dimension_name AS rprt_typ
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) rprt_typ
on D.reported_type_src_key = rprt_typ.row_key
join  
(
 SELECT lov.*, wh_lov.dimension_code AS tsk_typ_code, wh_lov.dimension_name AS tsk_typ
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'TASK_TYPE~TASK'
UNION 
 SELECT lov.*, lov.dimension_code AS tsk_typ_code, lov.dimension_name AS tsk_typ
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) tsk_typ
on D.task_type_src_key = tsk_typ.row_key
join  
(
 SELECT lov.*, wh_lov.dimension_code AS urg_code, wh_lov.dimension_name AS urg
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'URGENCY~CHANGE_TASK'
UNION 
 SELECT lov.*, lov.dimension_code AS urg_code, lov.dimension_name AS urg
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) urg
on D.urgency_src_key = urg.row_key
join #DWH_TABLE_SCHEMA.d_internal_contact OPN_DIC
on OPN_DIC.row_key = F.opened_by_key
join #DWH_TABLE_SCHEMA.d_internal_contact CLS_DIC
on CLS_DIC.row_key = F.closed_by_key
join
(
   select a.*
   FROM #DWH_TABLE_SCHEMA.d_location a
   LEFT JOIN #DWH_TABLE_SCHEMA.d_geography b ON a.geo_key = b.row_key AND a.source_id = b.source_id
) LOC
on F.location_key = LOC.row_key
join
(
select ic.*
   FROM #DWH_TABLE_SCHEMA.d_internal_contact ic
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact icm ON ic.manager_key = icm.row_key
) asgn_to
on asgn_to.row_key = F.assigned_to_key
join 
(
select iog.*
   FROM #DWH_TABLE_SCHEMA.d_internal_organization iog
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact icm ON iog.manager_key = icm.row_key
  WHERE iog.group_flag = 'Y' OR iog.row_key = 0 OR iog.row_key = -1
) asgn_grp
on asgn_grp.row_key = F.assignment_group_key
where cal_mon.lagging_count_of_month between 0 and 12
or D.backlog_flag = 'Y'
group by priority
order by priority