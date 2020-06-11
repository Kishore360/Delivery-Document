select 
appli.name as application_name,
srvc.name as business_service_name,
cal_date.calendar_date as calendar_date,
cal_date.month_name as month_name,
int_org_cmp.organization_name as company_name,
config_item.name CI_name,
dmd.demand_name as demand_name,
domain.domain_name as domain_name,
proj_d.is_top_flag as is_top_proj_flag,
loc.location_name as location_name,
parent_proj.project_name as parent_proj,
concat(concat(parent_proj.project_id,' - '), parent_proj.project_name) as parent_project_number, 
portf.name as portfolio_name,
lov_portf_cate.dimension_name as portfolio_category,
prog.program_name as program,
proj_d.project_name as project,
concat(concat(proj_d.project_id,' - '), proj_d.project_name) as project_number,
proj_d.actual_end_on as project_actual_end_date,
proj_d.actual_start_on as project_start_end_date,
lov_approv.dimension_name as proj_approval,
lov_bus_allig.dimension_name as project_business_alignment,
lov_proj_cont_type.dimension_name as project_contact_type,
lov_proj_escl.dimension_name as project_escalation,
lov_proj_goal.dimension_name as project_goal,
lov_proj_impact.dimension_name as project_impact,
proj_d.is_in_schedule_flag as is_in_schedule_flag,
proj_d.is_upcoming_flag as is_upcoming_flag,
mangmnt_ofc.full_name as management_office,
int_con_mgr.full_name as manager_name,
lov_proj_phase.dimension_name as project_phase,
lov_proj_phs_typ.dimension_name as project_phase_type,
proj_d.planned_end_on as project_planned_end_date,
lov_proj_pri.dimension_name as project_priority,
lov_proj_risk.dimension_name as project_risk,
lov_proj_state.dimension_name as project_status,
lov_proj_state.wh_dimension_name as project_status_standardized,
lov_proj_urgency.dimension_name as project_urgency,
lov_proj_work_stat.dimension_name as project_work_status,
top_proj.project_name as top_project,
concat(concat(top_proj.project_id,' - '), top_proj.project_name) as top_project_number,

sum(all_facts.actual_capital_cost) as actual_capital_cost,
sum(all_facts.actual_cost) as actual_cost,
sum(all_facts.actual_operating_cost) as actual_operating_cost,
sum(all_facts.budget_cost) as budget_cost,
sum(all_facts.planned_capital_cost) as planned_capital_cost,
sum(all_facts.planned_cost) as planned_cost,
sum(all_facts.planned_operating_cost) as planned_operating_cost,
sum(all_facts.planned_return) as planned_return,
sum(all_facts.planned_effort) as planned_effort,
sum(all_facts.actual_effort) as actual_effort


from 
(select
coalesce(project_effort.calendar_date_key,project_cost.calendar_date_key) as calendar_date_key,
coalesce(project_effort.project_key,project_cost.project_key) as project_key,
coalesce(project_effort.application_key,project_cost.application_key) as application_key,
coalesce(project_effort.business_service_key,project_cost.business_service_key) as business_service_key,
coalesce(project_effort.company_key,project_cost.company_key) as company_key,
coalesce(project_effort.configuration_item_key,project_cost.configuration_item_key) as configuration_item_key,
coalesce(project_effort.demand_key,project_cost.demand_key) as demand_key,
coalesce(project_effort.domain_key,project_cost.domain_key) as domain_key,
coalesce(project_effort.location_key,project_cost.location_key) as location_key,
coalesce(project_effort.portfolio_key,project_cost.portfolio_key) as portfolio_key,
coalesce(project_effort.program_key,project_cost.program_key) as program_key,
coalesce(project_effort.project_manager_key,project_cost.project_manager_key) as project_manager_key,
coalesce(source_id) as source_id,
project_cost.project_cost_plan_key,
project_cost.project_cost_type_key,
project_cost.project_expense_type_key,
project_cost.actual_capital_cost,
project_cost.actual_cost,
project_cost.actual_operating_cost,
project_cost.budget_cost,
project_cost.planned_capital_cost,
project_cost.planned_cost,
project_cost.planned_operating_cost,
project_cost.planned_return,
project_effort.planned_effort,
project_effort.actual_effort

from(
select 
calendar_date_key,project_key,project_cost_plan_key,project_cost_type_key,project_expense_type_key,application_key,business_service_key,company_key,configuration_item_key,demand_key,domain_key,location_key,portfolio_key,program_key,project_manager_key,
sum(actual_capital_doc_cost) as actual_capital_cost,
sum(total_actual_doc_cost) as actual_cost,
sum(actual_operating_doc_cost) as actual_operating_cost,
sum(budget_doc_cost) as budget_cost,
sum(planned_capital_doc_cost) as planned_capital_cost,
sum(estimated_doc_cost) as planned_cost,
sum(planned_operating_doc_cost) as planned_operating_cost,
sum(planned_return) as planned_return

from itpa_l_dev_mdwdb.f_project_cost 
group by calendar_date_key,project_key,project_cost_plan_key,project_cost_type_key,project_expense_type_key,application_key,business_service_key,company_key,configuration_item_key,demand_key,domain_key,location_key,portfolio_key,program_key,project_manager_key)project_cost
full outer join 
(
select 
calendar_date_key,project_key,application_key,business_service_key,company_key,configuration_item_key,demand_key,domain_key,location_key,portfolio_key,program_key,project_manager_key,row_id,row_key,soft_deleted_flag,
source_id,
sum(planned_effort) as planned_effort,sum(actual_effort) as actual_effort

from itpa_l_dev_mdwdb.f_project_effort
group by calendar_date_key,project_key,application_key,business_service_key,company_key,configuration_item_key,demand_key,domain_key,location_key,portfolio_key,program_key,project_manager_key,row_id,row_key,soft_deleted_flag,
source_id
)project_effort
on project_cost.project_key=project_effort.project_key
and project_cost.calendar_date_key=project_effort.calendar_date_key
)all_facts

left outer join itpa_l_dev_mdwdb.d_project proj_d
on all_facts.project_key=proj_d.row_key
left outer join itpa_l_dev_mdwdb.d_internal_contact mangmnt_ofc
on proj_d.project_management_office_key = mangmnt_ofc.row_key
left outer join itpa_l_dev_mdwdb.d_demand dmd
on all_facts.demand_key = dmd.row_key
left outer join itpa_l_dev_mdwdb.d_program prog
on all_facts.program_key = prog.row_key
left outer join itpa_l_dev_mdwdb.d_application appli
on all_facts.application_key = appli.row_key
left outer join itpa_l_dev_mdwdb.d_service srvc
on all_facts.business_service_key = srvc.row_key
left outer join itpa_l_dev_mdwdb.d_location loc
on loc.row_key=all_facts.location_key
left outer join itpa_l_dev_mdwdb.d_portfolio portf
on portf.row_key=all_facts.portfolio_key
left outer join itpa_l_dev_mdwdb.d_configuration_item config_item
on all_facts.configuration_item_key = config_item.row_key
left outer join itpa_l_dev_mdwdb.d_internal_organization int_org_cmp
on all_facts.company_key = int_org_cmp.row_key
left outer join itpa_l_dev_mdwdb.d_internal_contact int_con_mgr
on all_facts.project_manager_key=int_con_mgr.row_key
left outer join itpa_l_dev_mdwdb.d_domain domain
on all_facts.domain_key = domain.row_key
left outer join itpa_l_dev_mdwdb.d_project parent_proj
on parent_proj.row_key = proj_d.parent_project_key
left outer join itpa_l_dev_mdwdb.d_project top_proj
on top_proj.row_key = proj_d.top_project_key
left outer join 
(
select source_id, max(lastupdated) as lastupdated
from itpa_l_dev_mdwdb.d_o_data_freshness
group by source_id
) fresh
on fresh.source_id = all_facts.source_id
left outer join 
(
select d_calendar_date.*
FROM itpa_l_dev_mdwdb.d_calendar_date d_calendar_date
) cal_date
on cal_date.row_key = all_facts.calendar_date_key
left join 
(
select calendar_year.*
   FROM itpa_l_dev_mdwdb.d_calendar_date calendar_year
  WHERE calendar_year.row_key = calendar_year.year_start_date_key AND calendar_year.source_id = 0
) cal_date_yr
on cal_date.year_start_date_key = cal_date_yr.row_key
left outer join 
(select src_lov.row_key, src_lov.dimension_name
from itpa_l_dev_mdwdb.d_lov src_lov
left outer join itpa_l_dev_mdwdb.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  itpa_l_dev_mdwdb.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where src_lov.dimension_class = 'PORTFOLIO~CATEGORY' or src_lov.row_key in (0,-1)) lov_portf_cate
on lov_portf_cate.row_key = portf.portfolio_category_src_key
left outer join 
(select src_lov.row_key, wh_lov.dimension_name as wh_dimension_name, src_lov.dimension_name
from itpa_l_dev_mdwdb.d_lov src_lov
left outer join itpa_l_dev_mdwdb.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  itpa_l_dev_mdwdb.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where src_lov.dimension_class = 'PROJECT~APPROVAL' or src_lov.row_key in (0,-1)) lov_approv
on lov_approv.row_key = proj_d.project_approval_src_key
left outer join 
(
select row_key,dimension_name FROM itpa_l_dev_mdwdb.d_lov
WHERE upper(dimension_class) = 'WH_PROJECT~BUSINESS_ALIGNMENT' OR row_key = 0 OR row_key = -1) lov_bus_allig
on lov_bus_allig.row_key = proj_d.project_business_alignment_src_key
left outer join 
(select src_lov.row_key, src_lov.dimension_name
from itpa_l_dev_mdwdb.d_lov src_lov
left outer join itpa_l_dev_mdwdb.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  itpa_l_dev_mdwdb.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where upper(src_lov.dimension_class) = 'PROJECT~GOAL' or src_lov.row_key in (0,-1)) lov_proj_goal
on lov_proj_goal.row_key = proj_d.project_goal_src_key
left outer join 
(select src_lov.row_key, src_lov.dimension_name
from itpa_l_dev_mdwdb.d_lov src_lov
left outer join itpa_l_dev_mdwdb.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  itpa_l_dev_mdwdb.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where upper(src_lov.dimension_class) = 'PROJECT~PHASE' or src_lov.row_key in (0,-1)) lov_proj_phase
on lov_proj_phase.row_key = proj_d.project_phase_src_key
left outer join 
(select src_lov.row_key, src_lov.dimension_name
from itpa_l_dev_mdwdb.d_lov src_lov
left outer join itpa_l_dev_mdwdb.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  itpa_l_dev_mdwdb.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where upper(src_lov.dimension_class) = 'PROJECT~PRIORITY' or src_lov.row_key in (0,-1)) lov_proj_pri
on lov_proj_pri.row_key = proj_d.project_priority_src_key
left outer join 
(select src_lov.row_key, wh_lov.dimension_name as wh_dimension_name, src_lov.dimension_name
from itpa_l_dev_mdwdb.d_lov src_lov
left outer join itpa_l_dev_mdwdb.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  itpa_l_dev_mdwdb.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where upper(src_lov.dimension_class) = 'PROJECT~RISK' or src_lov.row_key in (0,-1)) lov_proj_risk
on lov_proj_risk.row_key = proj_d.project_risk_src_key
left outer join 
(select src_lov.row_key, src_lov.dimension_name
from itpa_l_dev_mdwdb.d_lov src_lov
left outer join itpa_l_dev_mdwdb.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  itpa_l_dev_mdwdb.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where upper(src_lov.dimension_class) = 'PROJECT~WORK_STATUS' or src_lov.row_key in (0,-1)) lov_proj_work_stat
on lov_proj_work_stat.row_key = proj_d.project_work_status_src_key
left outer join 
(select src_lov.row_key, src_lov.dimension_name
from itpa_l_dev_mdwdb.d_lov src_lov
left outer join itpa_l_dev_mdwdb.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  itpa_l_dev_mdwdb.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where upper(src_lov.dimension_class) = 'PROJECT~CONTACT_TYPE' or src_lov.row_key in (0,-1)) lov_proj_cont_type
on lov_proj_cont_type.row_key = proj_d.project_contact_type_src_key
left outer join 
(select src_lov.row_key, src_lov.dimension_name
from itpa_l_dev_mdwdb.d_lov src_lov
left outer join itpa_l_dev_mdwdb.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  itpa_l_dev_mdwdb.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where upper(src_lov.dimension_class) = 'PROJECT~ESCALATION' or src_lov.row_key in (0,-1)) lov_proj_escl
on lov_proj_escl.row_key = proj_d.project_escalation_src_key
left outer join 
(select src_lov.row_key, src_lov.dimension_name
from itpa_l_dev_mdwdb.d_lov src_lov
left outer join itpa_l_dev_mdwdb.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  itpa_l_dev_mdwdb.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where upper(src_lov.dimension_class) = 'PROJECT~IMPACT' or src_lov.row_key in (0,-1)) lov_proj_impact
on lov_proj_impact.row_key = proj_d.project_impact_src_key
left outer join 
(select src_lov.row_key, src_lov.dimension_name
from itpa_l_dev_mdwdb.d_lov src_lov
join itpa_l_dev_mdwdb.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
join  itpa_l_dev_mdwdb.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where upper(src_lov.dimension_class) = 'PROJECT~PHASE_TYPE' or src_lov.row_key in (0,-1)) lov_proj_phs_typ
on lov_proj_phs_typ.row_key = proj_d.project_phase_type_src_key 
left outer join 
(select src_lov.row_key, wh_lov.dimension_name AS wh_dimension_name, src_lov.dimension_name
from itpa_l_dev_mdwdb.d_lov src_lov
left outer join itpa_l_dev_mdwdb.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  itpa_l_dev_mdwdb.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where upper(src_lov.dimension_class) = 'PROJECT~STATE' or src_lov.row_key in (0,-1)) lov_proj_state
on lov_proj_state.row_key = proj_d.project_state_src_key 
left outer join 
(select src_lov.row_key, wh_lov.dimension_name AS wh_dimension_name, src_lov.dimension_name
from itpa_l_dev_mdwdb.d_lov src_lov
left outer join itpa_l_dev_mdwdb.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  itpa_l_dev_mdwdb.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where upper(src_lov.dimension_class) = 'PROJECT~URGENCY' or src_lov.row_key in (0,-1)) lov_proj_urgency
on lov_proj_urgency.row_key = proj_d.project_urgency_src_key

where proj_d.is_ytd_flag = 'Y' 
and cal_date.lagging_count_of_days>= 0
and cal_date_yr.lagging_count_of_year = 0
group by appli.name, srvc.name, cal_date.calendar_date, cal_date.month_name, int_org_cmp.organization_name, config_item.name, dmd.demand_name, domain.domain_name, proj_d.is_top_flag, 
loc.location_name, parent_proj.project_name, parent_project_number, portf.name, lov_portf_cate.dimension_name, prog.program_name, proj_d.project_name, project_number, proj_d.actual_end_on,  
proj_d.actual_start_on, lov_approv.dimension_name, lov_bus_allig.dimension_name, lov_proj_cont_type.dimension_name, lov_proj_escl.dimension_name, lov_proj_goal.dimension_name, 
lov_proj_impact.dimension_name, proj_d.is_in_schedule_flag, proj_d.is_upcoming_flag, mangmnt_ofc.full_name, int_con_mgr.full_name, lov_proj_phase.dimension_name, 
lov_proj_phs_typ.dimension_name, proj_d.planned_end_on, lov_proj_pri.dimension_name, lov_proj_risk.dimension_name, lov_proj_state.dimension_name, lov_proj_state.wh_dimension_name, 
lov_proj_urgency.dimension_name, lov_proj_work_stat.dimension_name, top_proj.project_name, top_project_number