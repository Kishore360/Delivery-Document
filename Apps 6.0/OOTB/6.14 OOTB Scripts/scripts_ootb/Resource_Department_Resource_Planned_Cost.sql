select 
Resource, 
department, 


case when coalesce(resource_actual_hours,0) = 0 then '0.0'
when round((resource_actual_hours),1) < 0 then '('||trim(to_char(round((resource_actual_hours),1)*(-1), '9,999,999,990D9'))||')'
else trim(to_char(round((resource_actual_hours),1), '9,999,999,990D9')) end resource_actual_hours,

case when round(((coalesce(resource_actual_hours,0)*coalesce(Resource_Per_Hour_Cost,0))),0) <0
then '($'||(cast((coalesce((round(((coalesce(resource_actual_hours,0)*coalesce(Resource_Per_Hour_Cost,0))),0)*(-1)),0)) as varchar(200)))||')'
when round(((coalesce(resource_actual_hours,0)*coalesce(Resource_Per_Hour_Cost,0))),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round((((coalesce(resource_actual_hours,0)*coalesce(Resource_Per_Hour_Cost,0)))/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round(((coalesce(resource_actual_hours,0)*coalesce(Resource_Per_Hour_Cost,0)))),0), '9,999,999,999')))) end as Resource_cost,

case when coalesce(resource_planned_effort_hours,0)=0 then '0.0'
when round((resource_planned_effort_hours),1) < 0
then '('||trim(to_char(round((resource_planned_effort_hours),1)*(-1), '9,999,999,990D9'))||')'
else trim(to_char(round((resource_planned_effort_hours),1), '9,999,999,990D9')) end resource_planned_effort_hours,  

case when coalesce(resource_planned_effort_cost,0)=0 then '$0'
when round((resource_planned_effort_cost),0) <0
then '($'||(cast((coalesce((round((resource_planned_effort_cost),0)*(-1)),0)) as varchar(200)))||')'
when round((resource_planned_effort_cost),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round(((resource_planned_effort_cost)/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round((resource_planned_effort_cost)),0), '9,999,999,999')))) end resource_planned_effort_cost

from 
(
select resource_key, Resource,  
department, 
count(distinct resource_key) as number_of_resources,
sum(capacity_hours) as capacity_hours, 
sum(resource_actual_hours) as resource_actual_hours,
sum(resource_allocated_cost) as resource_allocated_cost,
sum(resource_allocated_hour) as resource_allocated_hour,
sum(resource_planned_effort_hours) as resource_planned_effort_hours,
sum(resource_planned_effort_cost) as resource_planned_effort_cost, 
case when sum(resource_allocated_hour) is null  or sum(resource_allocated_cost) is null then null 
when sum(resource_allocated_hour)=0 and sum(resource_allocated_cost)=0 then null
when sum(resource_allocated_hour)=0 then 0
else sum(coalesce(resource_allocated_cost,0))/sum(coalesce(resource_allocated_hour,0)) end as Resource_Per_Hour_Cost
from
(
select distinct cal_date.calendar_date, all_facts.calendar_date_key, all_facts.resource_key, 
int_con.full_name as Resource, emp_type.employment_type, loc.location_name, inter_con_mgr.full_name as manager_name,
dept.organization_name as department, int_con.primary_role_key, res_role.role_name, int_con.primary_skill_key, 
res_skill.skill_name, 
case when int_con.termination_date is not null then (((datediff(day,int_con.hire_date,int_con.termination_date)/(365*1.0)))) 
else ((datediff(day,int_con.hire_date,fresh.lastupdated)/365)) end,
case when int_con.termination_date is not null then (((datediff(day,int_con.hire_date,int_con.termination_date)/(365*1.0)))) 
else ((datediff(day,int_con.hire_date,fresh.lastupdated)/(365*1.0))) end as Tenure_Years,
all_facts.capacity_hours, all_facts.resource_actual_hours, all_facts.resource_allocated_cost, all_facts.resource_allocated_hour,
all_facts.resource_planned_effort_hours,all_facts.resource_planned_effort_cost
from
(
select distinct coalesce(res_avail.calendar_date_key,res_alloc.allocation_on_key,time_card.timecard_on_key) as calendar_date_key,
coalesce(res_avail.resource_key,res_alloc.resource_key,time_card.employee_key) as resource_key,
coalesce(res_avail.source_id,res_alloc.source_id,time_card.source_id) as source_id,
res_avail.capacity as capacity_hours, 
time_card.Capacity_utilization as resource_actual_hours, res_alloc.resource_allocated_cost, res_alloc.resource_allocated_hour,
res_alloc.resource_planned_hours as resource_planned_effort_hours,res_alloc.resource_planned_cost as resource_planned_effort_cost
from
(
select calendar_date_key,resource_key,source_id,sum(capacity) as capacity  
from #DWH_TABLE_SCHEMA.f_resource_availability group by calendar_date_key,resource_key,source_id
) res_avail
full outer join
(
select res_alloc.allocation_on_key, res_alloc.resource_key,res_alloc.source_id,
sum(res_alloc.planned_hours) as resource_planned_hours,  sum(res_alloc.allocated_hours) as resource_allocated_hour,
sum(res_alloc.assigned_hours) as resource_assigned_hours, sum(res_alloc.planned_doc_cost) as resource_planned_cost,
sum(res_alloc.allocated_doc_cost) as resource_allocated_cost, sum(res_alloc.requested_hours) as resource_requested_hour
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
group by allocation_on_key, resource_key, res_alloc.source_id
) res_alloc
on res_alloc.resource_key = res_avail.resource_key and res_avail.calendar_date_key = res_alloc.allocation_on_key
full outer join
(
select timecard_on_key,employee_key, source_id, sum(time_entered) as Capacity_utilization from #DWH_TABLE_SCHEMA.f_time_card
group by  timecard_on_key,employee_key, source_id
) time_card
on res_avail.resource_key = time_card.employee_key and res_avail.calendar_date_key = time_card.timecard_on_key
) all_facts
join
(
select int_con.* from #DWH_TABLE_SCHEMA.d_internal_contact int_con
left outer join
(
select src_lov.row_key, src_lov.dimension_name as resource_type
from #DWH_TABLE_SCHEMA.d_lov src_lov
left join #DWH_TABLE_SCHEMA.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left join  #DWH_TABLE_SCHEMA.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where src_lov.dimension_class = 'Employee~Project_Resource_Type'
) lov
on int_con.project_resource_type_key = lov.row_key
where lov.resource_type = 'Labor' or int_con.row_key in (0,-1,-2)
) int_con
on all_facts.resource_key=int_con.row_key 
left outer join 
(select src_lov.row_key, src_lov.dimension_name as employment_type
from #DWH_TABLE_SCHEMA.d_lov src_lov
join #DWH_TABLE_SCHEMA.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
join  #DWH_TABLE_SCHEMA.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where src_lov.dimension_class = 'Employee~Employment_Type') emp_type
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
left outer join 
(
select source_id, max(lastupdated) as lastupdated
from #DWH_TABLE_SCHEMA.d_o_data_freshness
group by source_id
) fresh
on fresh.source_id = all_facts.source_id
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
group by resource_key, Resource, department
)
where resource not in ('UNKNOWN') 
order by upper(resource),upper(department), resource_actual_hours,resource_planned_effort_hours