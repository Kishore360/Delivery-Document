select D_P.name Portfolio_name, 
case when D_P.PORTFOLIO_CATEGORY_SRC_KEY is null or D_P.PORTFOLIO_CATEGORY_SRC_KEY = 0 then 'UNSPECIFIED' 
when (LOV.row_key <> D_P.PORTFOLIO_CATEGORY_SRC_KEY and D_P.PORTFOLIO_CATEGORY_SRC_KEY is not null) or (D_P.PORTFOLIO_CATEGORY_SRC_KEY = -1) then 'UNKNOWN'
else LOV.dimension_name end Portfolio_category,
D.project_name Project_name,
D2.project_name Top_Project_Name,
CAL.week_name week_nm,
D3.project_name Parent_project_name,
CNT.full_name Project_Manager,
F.is_top_flag is_top,
LOV1.dimension_name Status_src,
BS.name BS_name,
CI.name CI_name,
COMP.organization_name as comp_name,
DOM.domain_name dom_name,
LOC.location_name as Loc_name,
case when F.project_risk_color_key = 0 or F.project_risk_color_key is null then 'UNSPECIFIED'
when F.project_risk_color_key = -1 or (F.project_risk_color_key is not null and LOV2.row_key <> F.project_risk_color_key) then 'UNKNOWN'
else wh_lov2.dimension_name end risk_color_cde,

sum(case when D.task_type = 'PROJECT' and f.actual_end_on >= cal.week_start_date 
AND f.actual_end_on <= cal.week_end_date then 1 else 0 end) Closed_Project_Count,

case when (sum(case when D.task_type = 'PROJECT' and f.planned_start_on >= cal.week_start_date AND f.planned_start_on <= cal.week_end_date then 1 else 0 end) - 
sum(case when D.task_type = 'PROJECT' and f.actual_end_on >= cal.week_start_date AND f.actual_end_on <= cal.week_end_date then 1 else 0 end))<0
then '('||trim(to_char(((sum(case when D.task_type = 'PROJECT' and f.planned_start_on >= cal.week_start_date AND f.planned_start_on <= cal.week_end_date then 1 else 0 end) - 
sum(case when D.task_type = 'PROJECT' and f.actual_end_on >= cal.week_start_date AND f.actual_end_on <= cal.week_end_date then 1 else 0 end))*(-1)), '9,999,999,999'))||')'
else trim(to_char(((sum(case when D.task_type = 'PROJECT' and f.planned_start_on >= cal.week_start_date AND f.planned_start_on <= cal.week_end_date then 1 else 0 end) - 
sum(case when D.task_type = 'PROJECT' and f.actual_end_on >= cal.week_start_date AND f.actual_end_on <= cal.week_end_date then 1 else 0 end))), '9,999,999,999')) end Planned_vs_Closed,

sum(case when D.task_type = 'PROJECT' and f.actual_start_on >= cal.week_start_date 
AND f.actual_start_on <= cal.week_end_date then 1 else 0 end) No_of_projects_started,

max(case when F.project_risk_color_key = 0 or F.project_risk_color_key is null then cast (0 as varchar(200))
when F.project_risk_color_key = -1 or (F.project_risk_color_key is not null and LOV2.row_key <> F.project_risk_color_key) then cast (-1 as varchar(200))
else wh_lov2.dimension_code end) risk_color

from appsqaint4_mdwdb.f_n_project_task_weekly F
left join appsqaint4_mdwdb.f_project_task F2
on F.row_id = F2.row_id
left join appsqaint4_mdwdb.d_calendar_date CAL
on CAL.row_key = f.n_key
left join appsqaint4_mdwdb.d_project D
on F.project_key = D.row_key and
F.soft_deleted_flag = 'N' and
F.row_key not in (0,-1)
left join appsqaint4_mdwdb.d_project D2
on D.top_project_key = D2.row_key
left join appsqaint4_mdwdb.D_PORTFOLIO D_P
on D2.PORTFOLIO_KEY = D_P.row_key
left join appsqaint4_mdwdb.d_lov LOV
on LOV.row_key = D_P.PORTFOLIO_CATEGORY_SRC_KEY
and LOV.dimension_class = 'PORTFOLIO'
left join ( SELECT d_o_data_freshness.source_id, "max"(d_o_data_freshness.lastupdated) AS lastupdated
           FROM appsqaint4_mdwdb.d_o_data_freshness
          GROUP BY d_o_data_freshness.source_id) FRESH
on FRESH.source_id = f.source_id
left join appsqaint4_mdwdb.d_project D3
on D.parent_project_key = D3.row_key
left join appsqaint4_mdwdb.d_internal_contact CNT
on F.project_manager_key = CNT.row_key
left join appsqaint4_mdwdb.d_lov LOV1
on LOV1.row_key = D.project_state_src_key
and LOV1.dimension_class = 'PROJECT'
left join appsqaint4_mdwdb.d_lov_map LOVMAP1
on LOV1.row_key = LOVMAP1.src_key
and LOV1.dimension_class = 'PROJECT'
left JOIN appsqaint4_mdwdb.d_lov wh_lov1 
ON wh_lov1.row_key = LOVMAP1.wh_key
left join appsqaint4_mdwdb.d_service BS
on BS.row_key = F.business_service_key
left join appsqaint4_mdwdb.d_configuration_item CI
on CI.row_key = F.configuration_item_key
left join appsqaint4_mdwdb.d_internal_organization COMP
on COMP.row_key = F.company_key
left join appsqaint4_mdwdb.d_domain DOM
on dom.row_key = F.domain_key
left join appsqaint4_mdwdb.d_location LOC
on LOC.row_key = F.location_key
left join appsqaint4_mdwdb.d_lov LOV2
on LOV2.row_key = F.project_risk_color_key
and LOV1.dimension_class = 'PROJECT'
left join appsqaint4_mdwdb.d_lov_map LOVMAP2
on LOV2.row_key = LOVMAP2.src_key
and LOV2.dimension_class = 'PROJECT'
left JOIN appsqaint4_mdwdb.d_lov wh_lov2 
ON wh_lov2.row_key = LOVMAP2.wh_key

join appsqaint4_mdwdb.d_service SRVC
on SRVC.row_key = F.business_service_key 
and (SRVC.is_business_service_flag = 'Y' or SRVC.row_key in (0, -1))
left join appsqaint4_mdwdb.d_internal_organization DIO
on DIO.row_key = F.assignment_group_key
and (DIO.legal_entity_flag = 'Y' OR DIO.row_key in (0, -1))
join appsqaint4_mdwdb.d_lov_map approve
on D.project_approval_src_key = approve.src_key
and approve.dimension_class = 'PROJECT' AND approve.dimension_type = 'APPROVAL'
join appsqaint4_mdwdb.d_lov_map contact_type
on D.project_contact_type_src_key = contact_type.src_key
and contact_type.dimension_class = 'PROJECT' AND contact_type.dimension_type = 'CONTACT_TYPE'
join appsqaint4_mdwdb.d_lov_map ESCALATION
on D.project_escalation_src_key = ESCALATION.src_key
and ESCALATION.dimension_class = 'PROJECT' AND ESCALATION.dimension_type = 'ESCALATION'
left join appsqaint4_mdwdb.d_lov_map IMPACT
on D.project_impact_src_key = IMPACT.src_key
and IMPACT.dimension_class = 'PROJECT' AND IMPACT.dimension_type = 'IMPACT'
join appsqaint4_mdwdb.d_lov_map PHASE_TYPE
on D.project_phase_type_src_key = PHASE_TYPE.src_key
and PHASE_TYPE.dimension_class = 'PROJECT' AND PHASE_TYPE.dimension_type = 'PHASE_TYPE'
left join appsqaint4_mdwdb.d_lov_map PHASE
on D.project_phase_src_key = PHASE.src_key
and PHASE.dimension_class = 'PROJECT' AND PHASE.dimension_type = 'PHASE'
join appsqaint4_mdwdb.d_lov_map PRIORITY
on D.project_priority_src_key = PRIORITY.src_key
and PRIORITY.dimension_class = 'PROJECT' AND PRIORITY.dimension_type = 'PRIORITY'
join appsqaint4_mdwdb.d_lov_map STATE
on D.project_state_src_key = STATE.src_key
and STATE.dimension_class = 'PROJECT' AND STATE.dimension_type = 'STATE'
left join appsqaint4_mdwdb.d_lov_map RISK
on D.project_risk_src_key= RISK.src_key
and RISK.dimension_class = 'PROJECT' AND RISK.dimension_type = 'RISK'
left join appsqaint4_mdwdb.d_lov_map URGENCY
on D.project_urgency_src_key = URGENCY.src_key
and URGENCY.dimension_class = 'PROJECT' AND URGENCY.dimension_type = 'URGENCY'
where 
(CAL.lagging_count_of_year = 0 or 
CAL.lagging_count_of_month between 0 and 23) and
F.source_id = 2 and 
D_p.row_key not in (0,-1) 
and F.soft_deleted_flag = 'N' and
(CAL.lagging_count_of_weeks between 0 and 24)
group by D_P.name , D_P.row_key, Portfolio_category,D.project_name, D.row_key, D2.row_key, D2.project_name, week_nm, Parent_project_name,
Project_Manager, Status_src, BS_name, CI_name, comp_name, dom_name, Loc_name, is_top, risk_color_cde
order by D_P.row_key, lower(D_P.name), D.row_key, lower(D.Project_name), D2.row_key, lower(D2.project_name), week_nm