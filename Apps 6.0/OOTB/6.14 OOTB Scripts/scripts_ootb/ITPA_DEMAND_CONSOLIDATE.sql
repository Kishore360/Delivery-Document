select company, demand, demand_business_alignment, demand_category, TO_CHAR((demand_due_date),'fmMM/fmDD/YYYY fmHH:MI:SS AM') as demand_due_date, demand_goal, demand_impact, demand_manager, 
demand_number, demand_priority, demand_requestor, demand_risk, TO_CHAR((demand_start_date),'fmMM/fmDD/YYYY fmHH:MI:SS AM') as demand_start_date, demand_state, demand_status, demand_tshirt_size, 
demand_type, demand_work_status, department, domain_name, location, objective, portfolio, project, project_number,

case when (sum(no_of_demands)=0 and sum(no_of_fulfilled_demand+no_of_pending_demands)=0) then null
else
concat(trim(to_char(case when sum(no_of_demands)=0 then 0 else
round(((sum(no_of_fulfilled_demand+no_of_pending_demands)*100)/sum(no_of_demands)),1) end , '9,999,999,990D9')),'%') 
end as conversion_ratio,

case when round(sum(financial_return),0) <0
then '($'||(cast((coalesce((round(sum(financial_return),0)*(-1)),0)) as varchar(200)))||')'
when round(sum(financial_return),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(financial_return)/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round(sum(financial_return)),0), '9,999,999,999')))) end financial_return, 

case when (sum(no_of_fulfilled_demand)=0 and sum(no_of_fulfilled_demand+no_of_pending_demands)=0) then null
else
concat(trim(to_char(case when sum(no_of_fulfilled_demand+no_of_pending_demands)=0 then 0 else
round(((sum(no_of_fulfilled_demand)*100)/sum(no_of_fulfilled_demand+no_of_pending_demands)),1) end , '9,999,999,990D9')),'%') 
end as fulfilled_to_approved_ratio,

case when (sum(no_of_fulfilled_demand)=0 and sum(no_of_demands)=0) then null
else
concat(trim(to_char(case when sum(no_of_demands)=0 then 0 else
round(((sum(no_of_fulfilled_demand)*100)/sum(no_of_demands)),1) end , '9,999,999,990D9')),'%') end as fulfillment_ratio,

sum(no_of_demands) as no_of_demands, 
sum(no_of_fulfilled_demand) as no_of_fulfilled_demand,
sum(no_of_pending_demands) as no_of_pending_demands, 

case when round(sum(planned_cost),0) <0
then '($'||(cast((coalesce((round(sum(planned_cost),0)*(-1)),0)) as varchar(200)))||')'
when round(sum(planned_cost),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(planned_cost)/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round(sum(planned_cost)),0), '9,999,999,999')))) end planned_cost, 

case when round(sum(planned_financial_benifit),0) <0
then '($'||(cast((coalesce((round(sum(planned_financial_benifit),0)*(-1)),0)) as varchar(200)))||')'
when round(sum(planned_financial_benifit),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(planned_financial_benifit)/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round(sum(planned_financial_benifit)),0), '9,999,999,999')))) end planned_financial_benifit

from  #DWH_TABLE_SCHEMA.temp_demand_icube
group by company, demand, demand_business_alignment, demand_category, demand_due_date, demand_goal, demand_impact, demand_manager, 
demand_number, demand_priority, demand_requestor, demand_risk, demand_start_date, demand_state, demand_status, demand_tshirt_size, 
demand_type, demand_work_status, department, domain_name, location, objective, portfolio, project, project_number
order by company, LOWER(demand), demand_business_alignment, demand_category,demand_due_date, demand_goal, demand_impact, demand_manager, 
demand_number, demand_priority, demand_requestor, demand_risk, demand_start_date, demand_state, demand_status, demand_tshirt_size, 
demand_type, demand_work_status, department, domain_name, location, objective, portfolio, project, project_number