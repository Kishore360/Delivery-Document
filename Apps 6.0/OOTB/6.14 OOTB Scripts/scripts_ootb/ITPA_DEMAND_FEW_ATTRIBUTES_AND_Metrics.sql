select company,demand,demand_business_alignment, demand_category, demand_impact,demand_risk,demand_state, demand_status, demand_work_status,department,domain_name, location, objective, portfolio, project, 

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

from #DWH_TABLE_SCHEMA.temp_demand_icube
group by company,demand,demand_business_alignment, demand_category, demand_impact,demand_risk,demand_state, demand_status, demand_work_status,department,domain_name, location, objective, portfolio, project
order by company,LOWER(demand),UPPER(demand_business_alignment), UPPER(demand_category), demand_impact,UPPER(demand_risk),
UPPER(demand_state), UPPER(demand_status), UPPER(demand_work_status),department,domain_name, UPPER(location),UPPER(objective), portfolio, project