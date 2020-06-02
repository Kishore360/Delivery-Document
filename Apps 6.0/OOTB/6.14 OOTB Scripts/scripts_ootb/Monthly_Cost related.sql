select D_P.name Portfolio_name, 
case when D_P.PORTFOLIO_CATEGORY_SRC_KEY is null or D_P.PORTFOLIO_CATEGORY_SRC_KEY = 0 then 'UNSPECIFIED' 
when (LOV.row_key <> D_P.PORTFOLIO_CATEGORY_SRC_KEY and D_P.PORTFOLIO_CATEGORY_SRC_KEY is not null) or (D_P.PORTFOLIO_CATEGORY_SRC_KEY = -1) then 'UNKNOWN'
else LOV.dimension_name end Portfolio_category,
D.project_name Project_name,
D2.project_name Top_Project_Name,
CAL.month_name,
wh_lov1.dimension_name cost_variance_color,
wh_lov2.dimension_name Portfolio_cost_variance_color,

concat('$',coalesce(case when round(sum(F.total_actual_doc_cost),0)>=1000
then concat(trim(to_char(round(sum(F.total_actual_doc_cost/1000),0),'9,999,999,999')),'K') 
else cast(round(sum(F.total_actual_doc_cost),0) as varchar(200)) end, cast(0 as varchar(200)))) actual_cost,

concat('$',coalesce(case when round(sum(F.estimated_doc_cost),0)>=1000
then concat(trim(to_char(round(sum(F.estimated_doc_cost/1000),0) ,'9,999,999,999')),'K') 
else cast(round(sum(F.estimated_doc_cost),0) as varchar(200)) end, cast(0 as varchar(200)))) planned_cost,

--sum(F.budget_doc_cost)::Numeric(12,1) budgeted_cost,

concat('$',coalesce(case when round(sum(F.total_actual_doc_cost),0)>=1000 or round(sum(F.total_actual_doc_cost),0)<= -1000
then concat(trim(to_char(round(sum(F.total_actual_doc_cost/1000),0) ,'9,999,999,999')),'K') 
else cast(round(sum(F.total_actual_doc_cost),0) as varchar(200)) end, cast(0 as varchar(200)))) total_cost,

case when round((sum((coalesce(F.actual_percent_complete, 0)/100)::Numeric(17,4)* F.estimated_doc_cost::Numeric(17,4)) - sum(F.total_actual_doc_cost::Numeric(17,4))),0) <0
then concat('-$',(cast((coalesce((round((sum((coalesce(F.actual_percent_complete, 0)/100)::Numeric(17,4)* F.estimated_doc_cost::Numeric(17,4)) - sum(F.total_actual_doc_cost::Numeric(17,4))),0)*(-1)),0)) as varchar(200))))
when round((sum((coalesce(F.actual_percent_complete, 0)/100)::Numeric(17,4)* F.estimated_doc_cost::Numeric(17,4)) - sum(F.total_actual_doc_cost::Numeric(17,4))),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round(((sum((coalesce(F.actual_percent_complete, 0)/100)::Numeric(17,4)* F.estimated_doc_cost::Numeric(17,4)) - sum(F.total_actual_doc_cost::Numeric(17,4)))/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round((sum((coalesce(F.actual_percent_complete, 0)/100)::Numeric(17,4)* F.estimated_doc_cost::Numeric(17,4)) - sum(F.total_actual_doc_cost::Numeric(17,4)))),0), '9,999,999,999')))) end Cost_variance,

concat(round((coalesce(F.cost_variance,0)*100),0),'%') Perc_Cost_Variance,

max(wh_lov1.dimension_code) cost_var_color,

max(wh_lov2.dimension_code) portfolio_cost_var_color,

case when round(((sum(F.total_actual_doc_cost)) - sum(F.estimated_doc_cost::Numeric(12,1))),0) <0
then concat('-$',(cast((coalesce((round(((sum(F.total_actual_doc_cost)) - sum(F.estimated_doc_cost::Numeric(12,1))),0)*(-1)),0)) as varchar(200))))
when round(((sum(F.total_actual_doc_cost)) - sum(F.estimated_doc_cost::Numeric(12,1))),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round((((sum(F.total_actual_doc_cost)) - sum(F.estimated_doc_cost::Numeric(12,1)))/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round(((sum(F.total_actual_doc_cost)) - sum(F.estimated_doc_cost::Numeric(12,1)))),0), '9,999,999,999')))) end Cost_variance_act_vs_plnd,

case when abs(round(((sum(F.total_actual_doc_cost)) - sum(F.estimated_doc_cost::Numeric(12,1))),0)) >=1000
then concat('$',concat(trim(to_char(coalesce(abs(round((((sum(F.total_actual_doc_cost)) - sum(F.estimated_doc_cost::Numeric(12,1)))/1000),0)),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(abs(round(((sum(F.total_actual_doc_cost)) - sum(F.estimated_doc_cost::Numeric(12,1))),0)), 0),'9,999,999,999')))) end Cost_variance_act_vs_plnd_abs,

round(((case when sum(F.actual_percent_complete::numeric(12,1)* F.estimated_doc_cost::numeric(12,1)::numeric(12,1)/100) = 0 then null else
sum(F.total_actual_doc_cost)/
sum(F.actual_percent_complete::numeric(12,1)* F.estimated_doc_cost::numeric(12,1)::numeric(12,1)/100)
end
)),2) Burn_rate,

concat(round(((case when sum(F.estimated_doc_cost) = 0 then null else
sum((F.total_actual_doc_cost)::numeric(12,1)-((F.actual_percent_complete* F.estimated_doc_cost)::numeric(12,1)/100))/
sum(F.estimated_doc_cost)::numeric(12,1)
end)*100),0),'%') Prct_incrs_budget, 

concat(round(((case when sum(F.estimated_doc_cost) = 0 then null else
sum((F.total_actual_doc_cost)- (F.estimated_doc_cost))/
sum(F.estimated_doc_cost)
end)*100),0),'%') Prct_over_budget,

concat(round(sum((case when (case when CAL.lagging_count_of_month = 1 then F.total_actual_doc_cost else 0 end) = 0 then null else
((case when CAL.lagging_count_of_month = 0 then F.total_actual_doc_cost else 0 end) -
(case when CAL.lagging_count_of_month = 1 then F.total_actual_doc_cost else 0 end))/
(case when CAL.lagging_count_of_month = 1 then F.total_actual_doc_cost else 0 end)
end)*100),0),'%') Growth_in_Cost_Prev_Month,

concat(round(sum((case when (case when CAL.lagging_count_of_month = 1 then F.net_value else 0 end) = 0 then null else
((case when CAL.lagging_count_of_month = 0 then F.net_value else 0 end) -
(case when CAL.lagging_count_of_month = 1 then F.net_value else 0 end))/
(case when CAL.lagging_count_of_month = 1 then F.net_value else 0 end)
end)*100),0),'%') Growth_in_Revnue_Prev_Month

from appsqaint4_mdwdb.f_n_project_task_monthly F
join appsqaint4_mdwdb.f_project_task F2
on F.row_id = F2.row_id
join appsqaint4_mdwdb.d_calendar_date CAL
on CAL.row_key = f.n_key
join appsqaint4_mdwdb.d_project D
on F.project_key = D.row_key and
F.soft_deleted_flag = 'N' and
F.row_key not in (0,-1)
join appsqaint4_mdwdb.d_project D2
on D.top_project_key = D2.row_key
join appsqaint4_mdwdb.D_PORTFOLIO D_P
on D2.PORTFOLIO_KEY = D_P.row_key
left join appsqaint4_mdwdb.d_lov LOV
on LOV.row_key = D_P.PORTFOLIO_CATEGORY_SRC_KEY
and LOV.dimension_class = 'PORTFOLIO'
join ( SELECT d_o_data_freshness.source_id, "max"(d_o_data_freshness.lastupdated) AS lastupdated
       FROM appsqaint4_mdwdb.d_o_data_freshness
       GROUP BY d_o_data_freshness.source_id) FRESH
on FRESH.source_id = f.source_id
join appsqaint4_mdwdb.d_lov LOV1
on LOV1.row_key = f.cost_variance_color_key
and LOV1.dimension_class = 'PROJECT'
join appsqaint4_mdwdb.d_lov_map LOVMAP1
on LOV1.row_key = LOVMAP1.src_key
and LOV1.dimension_class = 'PROJECT'
JOIN appsqaint4_mdwdb.d_lov wh_lov1 
ON wh_lov1.row_key = LOVMAP1.wh_key
join appsqaint4_mdwdb.d_lov LOV2
on LOV2.row_key = f.portfolio_cost_variance_color_key
and LOV2.dimension_class = 'PROJECT'
join appsqaint4_mdwdb.d_lov_map LOVMAP2
on LOV2.row_key = LOVMAP2.src_key
and LOV2.dimension_class = 'PROJECT'
JOIN appsqaint4_mdwdb.d_lov wh_lov2
ON wh_lov2.row_key = LOVMAP2.wh_key
join appsqaint4_mdwdb.d_service SRVC
on SRVC.row_key = F.business_service_key 
and (SRVC.is_business_service_flag = 'Y' or SRVC.row_key in (0, -1))
join appsqaint4_mdwdb.d_configuration_item CI
on CI.row_key = F.configuration_item_key
join appsqaint4_mdwdb.d_internal_organization DIO
on DIO.row_key = F.assignment_group_key
and (DIO.legal_entity_flag = 'Y' OR DIO.row_key in (0, -1))
join appsqaint4_mdwdb.d_domain DM
on DM.row_key = F.domain_key
join appsqaint4_mdwdb.d_internal_contact DIC
on DIC.row_key = F.project_manager_key

join appsqaint4_mdwdb.d_location LOC
on LOC.row_key = F.location_key
join appsqaint4_mdwdb.d_lov_map approve
on D.project_approval_src_key = approve.src_key
and approve.dimension_class = 'PROJECT' AND approve.dimension_type = 'APPROVAL'
join appsqaint4_mdwdb.d_lov_map contact_type
on D.project_contact_type_src_key = contact_type.src_key
and contact_type.dimension_class = 'PROJECT' AND contact_type.dimension_type = 'CONTACT_TYPE'
join appsqaint4_mdwdb.d_lov_map ESCALATION
on D.project_escalation_src_key = ESCALATION.src_key
and ESCALATION.dimension_class = 'PROJECT' AND ESCALATION.dimension_type = 'ESCALATION'
join appsqaint4_mdwdb.d_lov_map IMPACT
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
join appsqaint4_mdwdb.d_lov_map URGENCY
on D.project_urgency_src_key = URGENCY.src_key
and URGENCY.dimension_class = 'PROJECT' AND URGENCY.dimension_type = 'URGENCY'
where 
(CAL.lagging_count_of_year = 0 or 
CAL.lagging_count_of_month between 0 and 23) and
F.source_id = 2 and 
D_p.row_key not in (0,-1) 
and F.soft_deleted_flag = 'N'
group by D_P.row_key, Portfolio_name, Portfolio_category, D.row_key, D.Project_name, D2.row_key, Top_Project_Name, cal.month_name, cal.month_id, cost_variance_color, Portfolio_cost_variance_color, Perc_Cost_Variance
order by D_P.row_key, lower(D_P.name), D.row_key, lower(D.Project_name), D2.row_key, lower(D2.project_name), cal.month_id