select cr.change_request_number crn,
cr.change_request_number cr_num,
D.change_task_number ctn,
D.change_task_number ctn1,
to_char(cr.opened_on,'FMmm/FMdd/yyyy FMhh:mi:ss AM') opnd_on,
to_char(cr.closed_on,'FMmm/FMdd/yyyy FMhh:mi:ss AM') clsd_on,
cr_cls_cd.dimension_name cls_cd,
cr_asgn_grp.organization_name cr_asg,
cr.on_hold_flag ohflg,
cr_state.dimension_name cr_st,
cr_phs.dimension_name cr_ph,
cr_phs_st.dimension_name cr_phst,
cr_prio.dimension_name cr_priority,
cr_typ.dimension_name cr_typ_nm,
count(case when state.state = 'CLOSED' and F.row_key is not null then F.row_key else null end) opened_ct

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
join #DWH_TABLE_SCHEMA.f_change_request fcr
on fcr.change_request_key = cr.row_key
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
on cal.row_key = case when state.state = 'CLOSED' then F.closed_on_key else F.opened_on_key end -- coalesce(F.closed_on_key, F.opened_on_key)
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
 SELECT lov.*, wh_lov.dimension_code AS cr_cls_cd_code, wh_lov.dimension_name AS cr_cls_cd
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'CLOSE_CODE~CHANGE_REQUEST'
UNION 
 SELECT lov.*, lov.dimension_code AS cr_cls_cd_code, lov.dimension_name AS cr_cls_cd
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) cr_cls_cd
on cr.close_code_src_key = cr_cls_cd.row_key
join  
(
 SELECT lov.*, wh_lov.dimension_code AS prio_code, wh_lov.dimension_name AS prio
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PRIORITY~CHANGE_REQUEST'
UNION 
 SELECT lov.*, lov.dimension_code AS prio_code, lov.dimension_name AS prio
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) cr_prio
on fcr.priority_src_key = cr_prio.row_key
join  
(
 SELECT lov.*, wh_lov.dimension_code AS state_code, wh_lov.dimension_name AS state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~CHANGE_REQUEST'
UNION 
 SELECT lov.*, lov.dimension_code AS state_code, lov.dimension_name AS state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) cr_state
on fcr.state_src_key = cr_state.row_key
join  
(
 SELECT lov.*, wh_lov.dimension_code AS cr_phs_code, wh_lov.dimension_name AS cr_phs
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PHASE~CHANGE_REQUEST'
UNION 
 SELECT lov.*, lov.dimension_code AS cr_phs_code, lov.dimension_name AS cr_phs
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) cr_phs
on cr.phase_src_key = cr_phs.row_key
join  
(
 SELECT lov.*, wh_lov.dimension_code AS cr_phs_st_code, wh_lov.dimension_name AS cr_phs_st
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PHASE_STATE~CHANGE_REQUEST'
UNION 
 SELECT lov.*, lov.dimension_code AS cr_phs_st_code, lov.dimension_name AS cr_phs_st
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) cr_phs_st
on cr.phase_state_src_key = cr_phs_st.row_key
join  
(
 SELECT lov.*, wh_lov.dimension_code AS cr_typ_code, wh_lov.dimension_name AS cr_typ
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'TYPE~CHANGE_REQUEST'
UNION 
 SELECT lov.*, lov.dimension_code AS cr_typ_code, lov.dimension_name AS cr_typ
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) cr_typ
on cr.type_src_key = cr_typ.row_key
join
(
select d_internal_organization.*
   FROM #DWH_TABLE_SCHEMA.d_internal_organization d_internal_organization
  WHERE d_internal_organization.group_flag = 'Y'::bpchar OR d_internal_organization.row_key = 0 OR d_internal_organization.row_key = -1
) cr_asgn_grp
on cr_asgn_grp.row_key = cr.assignment_group_key
where cal_mon.lagging_count_of_month between 0 and 12
or D.backlog_flag = 'Y'
group by crn, cr_num, ctn, ctn1, cr.opened_on, cr.closed_on, cls_cd, cr_asg, ohflg, cr_st, cr_ph, cr_phst, cr_priority, cr_typ_nm
order by crn, cr_num, ctn, ctn1, cr.opened_on, cr.closed_on, cls_cd, cr_asg, ohflg, cr_st, cr_ph, cr_phst, cr_priority, cr_typ_nm