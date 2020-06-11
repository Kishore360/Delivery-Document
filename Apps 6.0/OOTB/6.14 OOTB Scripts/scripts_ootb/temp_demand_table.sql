drop table if exists #DWH_TABLE_SCHEMA.temp_demand_icube;
create table #DWH_TABLE_SCHEMA.temp_demand_icube AS

select int_org_cmp.organization_name as company, 
dmd_d.demand_name as demand,dmd_d.row_key as demand_key1,
dmd_d.demand_approval_date as demand_approval_date,
dmd_d.approval_delay_flag as demand_approval_delay_flag,
lov_bus_alig.dimension_name AS demand_business_alignment,
lov_catg.dimension_name as demand_category, 
dmd_d.demand_finish_date as demand_due_date, 
dmd_d.demand_conversion_date as demand_conversion_date,
dmd_d.created_on as demand_creation_date,
dmd_d.fulfilled_within_budget_flag as demand_fulfilled_within_budget_flag,
dmd_d.fulfilled_within_time_flag as demand_fulfilled_within_time_flag,
dmd_d.demand_fulfillment_date as demand_fulfillment_date,
lov_goal.dimension_name as demand_goal, 
dmd_d.row_key as demand_key,
lov_impact.dimension_name as demand_impact, 
dmd_d.is_fulfilled_flag as is_fulfilled_flag,
dmd_mgr.full_name as demand_manager, 
dmd_d.demand_name as demand_number,
lov_priority.dimension_name as demand_priority,
lov_proj_state.dimension_name as demand_project_state,
dmd_d.demand_start_date as demand_start_date,
dmd_requestor.full_name as demand_requestor,
lov_risk.dimension_name as demand_risk, 
dmd_d.demand_start_date as date, 
lov_state.dimension_name as demand_state,
lov_status.dimension_name as demand_status, 
lov_tsize.dimension_name as demand_tshirt_size, 
lov_type.dimension_name as demand_type,
lov_work_status.dimension_name as demand_work_status, 
dept.organization_name as department,
 domain.domain_name, 
dmd_d.is_project_demand_flag as is_project_demand_flag,
loc.location_name as location,
 dmd_d.objective, 
port.name as portfolio,
 proj.project_name as project, 
concat(concat(proj.project_id,' - '),proj.project_name) as project_number,

dmd_f.financial_return, 

1 as no_of_demands, 

case when upper(coalesce(lov_proj_state.wh_dimension_name,'')) in ('CLOSED') OR
upper(lov_status.wh_dimension_name) in ('CONVERTED')
then 1 else 0 end  as no_of_converted_demands,

case when  
upper(coalesce(lov_proj_state.wh_dimension_name,'')) in ('CLOSED') 
then 1 else 0 end  as no_of_fulfilled_demands,

case when UPPER(lov_status.wh_dimension_name)IN ('APPROVED') then 1 else 0 end as no_of_approved_demands,

case when UPPER(lov_status.wh_dimension_name) in('CANCELLED') then 1 else 0 end as no_of_cancelled_demands,

case when UPPER(lov_status.wh_dimension_name) IN ('NEW') then 1 else 0 end as no_of_new_demands,

case when UPPER(lov_status.wh_dimension_name) in('PENDING') then 1 else 0 end as no_of_pending_demands,
(dmd_f.planned_doc_cost) as planned_cost, 
dmd_f.planned_benifit as planned_financial_benifit,
dmd_f.planned_operating_doc_cost as planned_operating_doc_cost,
dmd_f.planned_capital_doc_cost as planned_capital_doc_cost,
dmd_f.planned_doc_cost as planned_doc_cost,
(dmd_f.actual_doc_cost) as demand_actual_cost,

dmd_f.actual_effort as demand_actual_effort,
demand_approval_time as demand_approval_time,
demand_approval_delay as demand_approval_delay,
dmd_f.planned_effort as demand_planned_effort,

dmd_f.percent_roi as percent_roi,

case when dmd_d.is_project_demand_flag='Y' then 1 else 0 end as no_of_project_demands,

(dmd_f.project_planned_doc_cost) as project_planned_cost,
(dmd_f.project_actual_doc_cost) as project_actual_cost,

round(coalesce((dmd_f.project_planned_doc_cost),0)-coalesce((dmd_f.planned_doc_cost),0),1) as planned_project_to_demand_cost_variance,

round(coalesce((dmd_f.project_actual_doc_cost),0)-coalesce((dmd_f.planned_doc_cost),0),1) as actual_project_to_demand_cost_variance,

dmd_f.demand_fulfillment_delay  as demand_fulfillment_delay,

case when UPPER(lov_status.wh_dimension_name) in ('APPROVED') then
coalesce((dmd_f.planned_doc_cost),0) else null end as demand_approved_cost,

case when UPPER(lov_priority.wh_dimension_name) in ('HIGH') then 1 else 0 end as no_of_p1_demands,
case when UPPER(lov_status.wh_dimension_name) in ('APPROVED','CONVERTED') and  UPPER(dmd_d.approval_delay_flag)='N' then 1 else 0 end as no_of_approval_compliance_demands,
case when UPPER(lov_status.wh_dimension_name) in ('PENDING') then 1 else 0 end as no_of_unapproved_demands,

case when UPPER(lov_priority.wh_dimension_name) in ('HIGH') and 
UPPER(lov_status.wh_dimension_name) in ('APPROVED') then 1 else 0 end as no_of_p1_approved_demands,

case when UPPER(lov_priority.wh_dimension_name) in ('HIGH') and 
UPPER(lov_status.wh_dimension_name) in ('APPROVED','CONVERTED') and
UPPER(lov_proj_state.wh_dimension_name) in ('CLOSED')
then 1 else 0 end as no_of_p1_fulfilled_demands,

case when UPPER(lov_status.wh_dimension_name) in ('APPROVED','CONVERTED') and
UPPER(lov_proj_state.wh_dimension_name) in ('CLOSED')
then coalesce(dmd_f.planned_doc_cost,0) else null end as fulfilled_demand_cost,

case when UPPER(dmd_d.fulfilled_within_time_flag)='Y' then 1 else 0 end as no_of_fulfilled_demands_within_time,

case when UPPER(dmd_d.fulfilled_within_budget_flag)='Y' then 1 else 0 end as no_of_fulfilled_demands_within_budget,

case when UPPER(lov_status.wh_dimension_name) in('REJECTED') then 1 else 0 end as no_of_rejected_demands,

dmd_f.demand_fulfilment_time as fulfilment_time,

case when UPPER(lov_status.wh_dimension_name) in('PENDING') and 
UPPER(lov_priority.wh_dimension_name) in ('HIGH') 
then 1 else 0 end as no_of_p1_pending_demands,

case when UPPER(lov_status.wh_dimension_name) in('PENDING') and 
UPPER(lov_priority.wh_dimension_name) in ('MEDIUM') 
then 1 else 0 end as no_of_p2_pending_demands,

case when UPPER(lov_status.wh_dimension_name) in ('PENDING') then
coalesce(dmd_f.planned_doc_cost,0) else null end as pending_demand_cost,										

case when UPPER(lov_status.wh_dimension_name) IN ('NEW') then 
(dmd_f.planned_doc_cost) else 0 end as new_demand_cost

from #DWH_TABLE_SCHEMA.f_demand dmd_f
left outer join #DWH_TABLE_SCHEMA.d_demand dmd_d
on dmd_f.demand_key=dmd_d.row_key
left outer join #DWH_TABLE_SCHEMA.d_internal_organization int_org_cmp
on dmd_f.company_key = int_org_cmp.row_key
left outer join 
(select src_lov.row_key, src_lov.dimension_name
from #DWH_TABLE_SCHEMA.d_lov src_lov
left outer join #DWH_TABLE_SCHEMA.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  #DWH_TABLE_SCHEMA.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where src_lov.dimension_class = 'WH_DEMAND~BUSINESSALIGNMENT' or src_lov.row_key in (0,-1)) lov_bus_alig
on lov_bus_alig.row_key = dmd_d.demand_business_alignment_src_key
left outer join 
(select src_lov.row_key, src_lov.dimension_name
from #DWH_TABLE_SCHEMA.d_lov src_lov
left outer join #DWH_TABLE_SCHEMA.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  #DWH_TABLE_SCHEMA.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where src_lov.dimension_class = 'DEMAND~CATEGORY' or src_lov.row_key in (0,-1)) lov_catg
on lov_catg.row_key = dmd_d.demand_category_src_key
left outer join 
(select src_lov.row_key, src_lov.dimension_name,wh_lov.dimension_name as wh_dimension_name
from #DWH_TABLE_SCHEMA.d_lov src_lov
left outer join #DWH_TABLE_SCHEMA.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  #DWH_TABLE_SCHEMA.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where src_lov.dimension_class = 'DEMAND~GOAL' or src_lov.row_key in (0,-1)) lov_goal
on lov_goal.row_key = dmd_d.demand_goal_src_key
left outer join 
(select src_lov.row_key, src_lov.dimension_name
from #DWH_TABLE_SCHEMA.d_lov src_lov
left outer join #DWH_TABLE_SCHEMA.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  #DWH_TABLE_SCHEMA.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where src_lov.dimension_class = 'DEMAND~IMPACT' or src_lov.row_key in (0,-1)) lov_impact
on lov_impact.row_key = dmd_d.demand_impact_src_key
left outer join #DWH_TABLE_SCHEMA.d_internal_contact dmd_mgr
on dmd_mgr.row_key=dmd_f.demand_manager_key
left outer join 
(select src_lov.row_key, src_lov.dimension_name,wh_lov.dimension_name as wh_dimension_name
from #DWH_TABLE_SCHEMA.d_lov src_lov
left outer join #DWH_TABLE_SCHEMA.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  #DWH_TABLE_SCHEMA.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where src_lov.dimension_class = 'DEMAND~PRIORITY' or src_lov.row_key in (0,-1)) lov_priority
on lov_priority.row_key = dmd_d.demand_priority_src_key
left outer join #DWH_TABLE_SCHEMA.d_internal_contact dmd_requestor
on dmd_requestor.row_key=dmd_f.demand_requestor_key
left outer join 
(select src_lov.row_key, src_lov.dimension_name
from #DWH_TABLE_SCHEMA.d_lov src_lov
left outer join #DWH_TABLE_SCHEMA.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  #DWH_TABLE_SCHEMA.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where src_lov.dimension_class = 'DEMAND~RISK' or src_lov.row_key in (0,-1)) lov_risk
on lov_risk.row_key = dmd_d.demand_risk_src_key
left outer join 
(select src_lov.row_key, src_lov.dimension_name, wh_lov.dimension_name as wh_dimension_name
from #DWH_TABLE_SCHEMA.d_lov src_lov
left outer join #DWH_TABLE_SCHEMA.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  #DWH_TABLE_SCHEMA.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where src_lov.dimension_class = 'DEMAND~STATUS' or src_lov.row_key in (0,-1)) lov_status
on lov_status.row_key = dmd_d.demand_status_src_key
left outer join 
(select src_lov.row_key, src_lov.dimension_name
from #DWH_TABLE_SCHEMA.d_lov src_lov
left outer join #DWH_TABLE_SCHEMA.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  #DWH_TABLE_SCHEMA.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where src_lov.dimension_class = 'DEMAND~STATE' or src_lov.row_key in (0,-1)) lov_state
on lov_state.row_key = dmd_d.demand_state_src_key
left outer join 
(select src_lov.row_key, src_lov.dimension_name
from #DWH_TABLE_SCHEMA.d_lov src_lov
left outer join #DWH_TABLE_SCHEMA.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  #DWH_TABLE_SCHEMA.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where src_lov.dimension_class = 'DEMAND~TSHIRTSIZE' or src_lov.row_key in (0,-1)) lov_tsize
on lov_tsize.row_key = dmd_d.demand_tshirt_size_src_key
left outer join 
(select src_lov.row_key, src_lov.dimension_name
from #DWH_TABLE_SCHEMA.d_lov src_lov
left outer join #DWH_TABLE_SCHEMA.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  #DWH_TABLE_SCHEMA.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where src_lov.dimension_class = 'DEMAND~TYPE' or src_lov.row_key in (0,-1)) lov_type
on lov_type.row_key = dmd_d.demand_type_src_key
left outer join 
(select src_lov.row_key, src_lov.dimension_name
from #DWH_TABLE_SCHEMA.d_lov src_lov
left outer join #DWH_TABLE_SCHEMA.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  #DWH_TABLE_SCHEMA.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where src_lov.dimension_class = 'DEMAND~WORK_STATUS' or src_lov.row_key in (0,-1)) lov_work_status
on lov_work_status.row_key = dmd_d.demand_work_status_src_key
left outer join #DWH_TABLE_SCHEMA.d_internal_organization dept
on dept.row_key=dmd_f.department_key
left outer join #DWH_TABLE_SCHEMA.d_domain domain
on dmd_f.domain_key = domain.row_key
left outer join #DWH_TABLE_SCHEMA.d_location loc
on loc.row_key=dmd_f.location_key
left outer join #DWH_TABLE_SCHEMA.d_portfolio port
on port.row_key=dmd_f.portfolio_key
left outer join #DWH_TABLE_SCHEMA.d_project proj
on proj.row_key=dmd_f.project_key
left outer join 
(select src_lov.row_key, wh_lov.dimension_name as wh_dimension_name, src_lov.dimension_name,
wh_map.dimension_wh_code as dimension_wh_code
from #DWH_TABLE_SCHEMA.d_lov src_lov
left outer join #DWH_TABLE_SCHEMA.d_lov_map wh_map
on
src_lov.row_key = wh_map.src_key
left outer join  #DWH_TABLE_SCHEMA.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where upper(src_lov.dimension_class) = 'DEMAND~PROJECT_STATUS' or src_lov.row_key in (0,-1)) lov_proj_state
on lov_proj_state.row_key = dmd_d.demand_project_status_src_key
left outer join 
(
select source_id, max(lastupdated) as lastupdated
from #DWH_TABLE_SCHEMA.d_o_data_freshness
group by source_id
) fresh
on fresh.source_id = dmd_f.source_id
left outer join 
(
select d_calendar_date.*
FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_day ON d_calendar_date.previous_day_key = prev_day.row_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_week ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = 
prev_week.week_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = 
prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = 
prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = 
prev_year.year_start_date_key
) cal_date
on cal_date.row_key = dmd_f.start_on_key