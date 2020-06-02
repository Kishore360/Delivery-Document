select distinct Resource, 
demand_name, 
is_top_flag,
top_project,
project, 
primary_role, 

case when coalesce(resource_planned_effort_hours,0)=0 then '0.0'
	 when round(((resource_planned_effort_hours-coalesce(resource_allocated_hour,0))),1) <= 0 then '0.0'
-- then '('||trim(to_char(round(((resource_planned_effort_hours-coalesce(resource_allocated_hour,0))),1)*(-1), '9,999,999,990D9'))||')'
else trim(to_char(round(((resource_planned_effort_hours-coalesce(resource_allocated_hour,0))),1), '9,999,999,990D9')) end as Availability_gap_hours,


case when coalesce(resource_planned_effort_hours,0)=0 then null
	  when resource_planned_effort_hours is not null and resource_allocated_hour is null then '100.0%'
	  when (resource_planned_effort_hours-resource_allocated_hour)=0 then '0.0%'
	  when (resource_planned_effort_hours-resource_allocated_hour)<0 then
	  '('||(cast((coalesce((round(((((resource_planned_effort_hours-resource_allocated_hour)*100.0)/resource_planned_effort_hours)),1)*(-1)),0)) as varchar(200)))||'%)'
	  else concat(trim(to_char(coalesce(round(((((resource_planned_effort_hours-resource_allocated_hour)*100.0)/resource_planned_effort_hours)),1),0), '9,999,999,990D9')),'%') 
	  end	as Availability_gap_percentage 

from
(
select distinct Resource, 
demand_name, 
is_top_flag,
top_project,
project, 
primary_role, 
sum(resource_assigned_hours) resource_assigned_hours, 

case when sum(resource_planned_effort_hours)=0 then 0
when sum(resource_planned_effort_hours) is null  or sum(resource_planned_effort_cost) is null then null 
when sum(resource_planned_effort_hours)=0 and sum(resource_planned_effort_cost)=0 then null
when sum(resource_planned_effort_hours)=0 then 0
else sum(coalesce(resource_planned_effort_cost,0))/sum(coalesce(resource_planned_effort_hours,0)) end as Avg_Hourly_Rate,

-- Avg(Avg_Hourly_Rate) Avg_Hourly_Rate, 
sum(resource_actual_hours) resource_actual_hours, sum(coalesce(resource_allocated_cost,0)) resource_allocated_cost,
sum(resource_allocated_hour) resource_allocated_hour, 

case when sum(resource_allocated_hour) is null  or sum(resource_allocated_cost) is null then null 
when sum(resource_allocated_hour)=0 and sum(resource_allocated_cost)=0 then null
when sum(resource_allocated_hour)=0 then 0
else sum(coalesce(resource_allocated_cost,0))/sum(coalesce(resource_allocated_hour,0)) end as Resource_Per_Hour_Cost,
-- sum(Resource_Per_Hour_Cost) Resource_Per_Hour_Cost,
sum(resource_planned_effort_hours) resource_planned_effort_hours , sum(coalesce(resource_planned_effort_cost,0)) resource_planned_effort_cost
from
(
select distinct cal_date.calendar_date, all_facts.calendar_date_key, all_facts.resource_key,
demand.demand_name, dept.organization_name as department, emp_type.employment_type, proj.is_top_flag,
loc.location_name, parent_proj.project_name as parent_project_name, portfolio.name as portfolio,
res_role.role_name primary_role, program.program_name as program, proj.project_name as project, 
concat(concat(proj.project_id,' - '),proj.project_name) as project_number, proj_task.name as project_task,
proj_task.project_task_id,  int_con.full_name as Resource, int_org.organization_name as resource_group, 
inter_con_mgr.full_name as resource_manager, res_plan.resource_plan_number as resource_plan,
res_role1.role_name as resource_role, res_plan.planned_start_on, res_plan.planned_end_on, 
res_plan.actual_start_on, res_plan.actual_end_on, res_plan.user_type as resource_type,
case when int_con.termination_date is not null then (((datediff(day,int_con.hire_date,int_con.termination_date)/(365*1.0)))) 
else ((datediff(day,int_con.hire_date,fresh.lastupdated)/365)) end,
case when int_con.termination_date is not null then (((datediff(day,int_con.hire_date,int_con.termination_date)/(365*1.0)))) 
else ((datediff(day,int_con.hire_date,fresh.lastupdated)/(365*1.0))) end as Tenure_Years,
top_proj.project_name top_project, concat(concat(top_proj.project_id,' - '),top_proj.project_name) as top_project_number,
all_facts.resource_assigned_hours, -- all_facts.Avg_Hourly_Rate, 
all_facts.resource_actual_hours, 
all_facts.resource_allocated_cost, all_facts.resource_allocated_hour, -- all_facts.Resource_Per_Hour_Cost,
all_facts.resource_planned_effort_hours, all_facts.resource_planned_effort_cost
from
(
select distinct coalesce(res_alloc.allocation_on_key,time_card.timecard_on_key) as calendar_date_key,
coalesce(res_alloc.resource_key,time_card.employee_key) as resource_key,
coalesce(res_alloc.portfolio_key,time_card.portfolio_key) as portfolio_key,
coalesce(res_alloc.program_key,time_card.program_key) as program_key,
coalesce(res_alloc.project_key,time_card.project_key) as project_key,
coalesce(res_alloc.project_task_key,time_card.project_task_key) as project_task_key,
coalesce(res_alloc.resource_plan_key,time_card.resource_plan_key) as resource_plan_key,
coalesce(res_alloc.resource_role_key,time_card.resource_role_key) as resource_role_key,
coalesce(res_alloc.group_resource_key,time_card.group_resource_key) as group_resource_key,
coalesce(res_alloc.demand_key,time_card.demand_key) as demand_key,
coalesce(res_alloc.source_id,time_card.source_id) as source_id,
res_alloc.resource_assigned_hours, -- res_alloc_per_day.resource_per_hour_cost as Avg_Hourly_Rate, 
time_card.Capacity_utilization as resource_actual_hours, res_alloc.resource_allocated_cost, res_alloc.resource_allocated_hour,
-- res_alloc_per_day.resource_per_hour_cost as Resource_Per_Hour_Cost,
res_alloc.resource_planned_hours as resource_planned_effort_hours,res_alloc.resource_planned_cost as resource_planned_effort_cost
from
(
select allocation_on_key, resource_key, portfolio_key,program_key,project_key,project_task_key,
group_resource_key, res_alloc.demand_key, resource_plan_key, resource_role_key, 
res_alloc.source_id,res_alloc.soft_deleted_flag,
sum(planned_hours) as resource_planned_hours,  sum(allocated_hours) as resource_allocated_hour,
sum(assigned_hours) as resource_assigned_hours, sum(planned_doc_cost) as resource_planned_cost,
sum(allocated_doc_cost) as resource_allocated_cost, sum(requested_hours) as resource_requested_hour
from #DWH_TABLE_SCHEMA.f_resource_allocation res_alloc
left outer join #DWH_TABLE_SCHEMA.d_demand demand
on demand.row_key = res_alloc.demand_key
left outer join 
(select src_lov.row_key, src_lov.dimension_name, 
COALESCE(wh_lov.dimension_code, src_lov.dimension_code) wh_dimension_code
from #DWH_TABLE_SCHEMA.d_lov src_lov
join #DWH_TABLE_SCHEMA.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
join  #DWH_TABLE_SCHEMA.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where src_lov.dimension_class = 'Demand~Status') demand_status
on demand_status.row_key=demand.demand_status_src_key
where res_alloc.soft_deleted_flag = 'N' AND coalesce(demand_status.wh_dimension_code,' ') <> 'CONVERTED'
group by allocation_on_key, resource_key, portfolio_key,program_key,project_key,project_task_key,
group_resource_key, res_alloc.demand_key, resource_plan_key, resource_role_key,
res_alloc.source_id,res_alloc.soft_deleted_flag
) res_alloc
full outer join
(
select f.timecard_on_key,f.employee_key, f.portfolio_key,f.program_key,f.project_key,f.project_task_key,
  f.resource_plan_key, f.resource_role_key, f.soft_deleted_flag,f.source_id, plan.group_resource_key,
  0 as demand_key, sum(time_entered) as Capacity_utilization 
  from #DWH_TABLE_SCHEMA.f_time_card f
left outer join #DWH_TABLE_SCHEMA.d_resource_plan plan 
ON f.resource_plan_key = plan.row_key
group by  f.timecard_on_key,f.employee_key, f.portfolio_key,f.program_key,f.project_key,f.project_task_key,
f.resource_plan_key, f.resource_role_key, f.soft_deleted_flag,f.source_id, plan.group_resource_key, demand_key
) time_card
on res_alloc.resource_key  = time_card.employee_key and res_alloc.allocation_on_key = time_card.timecard_on_key
and res_alloc.portfolio_key=time_card.portfolio_key and res_alloc.program_key=time_card.program_key 
and res_alloc.project_key=time_card.project_key and res_alloc.project_task_key=time_card.project_task_key 
and res_alloc.resource_plan_key=time_card.resource_plan_key and res_alloc.resource_role_key=time_card.resource_role_key 
and res_alloc.group_resource_key=time_card.group_resource_key and res_alloc.demand_key=time_card.demand_key 
) all_facts
left outer join 
(
select source_id, max(lastupdated) as lastupdated
from #DWH_TABLE_SCHEMA.d_o_data_freshness
group by source_id
) fresh
on fresh.source_id = all_facts.source_id
left outer join
#DWH_TABLE_SCHEMA.d_internal_contact int_con
on all_facts.resource_key=int_con.row_key
left outer join 
(select src_lov.row_key, src_lov.dimension_name as employment_type
from #DWH_TABLE_SCHEMA.d_lov src_lov
join #DWH_TABLE_SCHEMA.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
join  #DWH_TABLE_SCHEMA.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where src_lov.dimension_class = 'Employee~Employment_Type' or src_lov.row_key in (0,-1)) emp_type
on emp_type.row_key=int_con.employment_type_src_key
left outer join #DWH_TABLE_SCHEMA.d_location loc
on loc.row_key=int_con.location_key
left outer join #DWH_TABLE_SCHEMA.d_internal_contact inter_con_mgr
on inter_con_mgr.row_key=int_con.manager_key
left outer join #DWH_TABLE_SCHEMA.d_internal_organization dept
on dept.row_key=int_con.department_key
left outer join #DWH_TABLE_SCHEMA.d_resource_role res_role
on res_role.row_key=int_con.primary_role_key
left outer join #DWH_TABLE_SCHEMA.d_resource_skill res_skill
on res_skill.row_key=int_con.primary_skill_key
left outer join #DWH_TABLE_SCHEMA.d_demand demand
on demand.row_key = all_facts.demand_key
left outer join #DWH_TABLE_SCHEMA.d_project proj
on proj.row_key = all_facts.project_key
left outer join #DWH_TABLE_SCHEMA.d_project parent_proj
on parent_proj.row_key = proj.parent_project_key
left outer join #DWH_TABLE_SCHEMA.d_portfolio portfolio
on portfolio.row_key = all_facts.portfolio_key
left outer join #DWH_TABLE_SCHEMA.d_program program
on program.row_key = all_facts.program_key
left outer join #DWH_TABLE_SCHEMA.d_project_task proj_task
on proj_task.row_key = all_facts.project_task_key
left outer join #DWH_TABLE_SCHEMA.d_internal_organization int_org
on  int_org.row_key = all_facts.group_resource_key
left outer join #DWH_TABLE_SCHEMA.d_resource_plan res_plan
on  res_plan.row_key = all_facts.resource_plan_key
left outer join #DWH_TABLE_SCHEMA.d_resource_role res_role1
on res_role1.row_key=all_facts.resource_role_key
left outer join #DWH_TABLE_SCHEMA.d_project top_proj
on top_proj.row_key = proj.top_project_key
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
on cal_date.row_key = all_facts.calendar_date_key
where cal_date.lagging_count_of_month<=23
)
group by Resource, 
demand_name, 
is_top_flag,
top_project,
project, resource_key,primary_role
)
-- where resource not in ('UNKNOWN')
order by upper(resource),upper(demand_name), upper(is_top_flag),upper(top_project),upper(project),upper(primary_role)
