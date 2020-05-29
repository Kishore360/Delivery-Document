select
demand_category,
case when round(sum(actual_project_to_demand_cost_variance),0)<0
then '-$'||(cast((coalesce((round(sum(actual_project_to_demand_cost_variance),0)*(-1)),0)) as varchar(200)))||''
when round(sum(actual_project_to_demand_cost_variance),0)>=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(actual_project_to_demand_cost_variance)/1000),0),0),'9,999,999,999')),'K'))
else concat('$',(trim(to_char(coalesce(round(sum(actual_project_to_demand_cost_variance)),0),'9,999,999,999')))) 
end as actual_project_to_demand_cost_variance,

case
when round(sum(demand_approved_cost),0)<0
then '($'||(cast((coalesce((round(sum(demand_approved_cost),0)*(-1)),0)) as varchar(200)))||')'
when round(sum(demand_approved_cost),0)>=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(demand_approved_cost)/1000),0),0),'9,999,999,999')),'K'))
else concat('$',(trim(to_char(coalesce(round(sum(demand_approved_cost),0),0),'9,999,999,999')))) end as total_demand_approved_cost,

case when round(sum(demand_actual_cost),0) <0
then '($'||(cast((coalesce((round(sum(demand_actual_cost),0)*(-1)),0)) as varchar(200)))||')'
when round(sum(demand_actual_cost),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(demand_actual_cost)/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round(sum(demand_actual_cost)),0), '9,999,999,999')))) end as demand_actual_cost,

round(sum(demand_actual_effort)*(1.0),1) as demand_actual_effort,

case when round(sum(financial_return),0) <0
then '-$'||(cast((coalesce((round(sum(financial_return),0)*(-1)),0)) as varchar(200)))
when round(sum(financial_return),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(financial_return)/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round(sum(financial_return)),0), '9,999,999,999')))) end as financial_return,

case when round(sum(planned_capital_doc_cost),0) <0
then '($'||(cast((coalesce((round(sum(planned_capital_doc_cost),0)*(-1)),0)) as varchar(200)))||')'
when round(sum(planned_capital_doc_cost),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(planned_capital_doc_cost)/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round(sum(planned_capital_doc_cost)),0), '9,999,999,999')))) end as demand_planned_capital_cost,

case when round(sum(planned_cost),0) <0
then '($'||(cast((coalesce((round(sum(planned_cost),0)*(-1)),0)) as varchar(200)))||')'
when round(sum(planned_cost),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(planned_cost)/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round(sum(planned_cost)),0), '9,999,999,999')))) end as demand_planned_cost,

round(sum(demand_planned_effort)*(1.0),1) as demand_planned_effort,

case when round(sum(planned_financial_benifit),0) <0
then '($'||(cast((coalesce((round(sum(planned_financial_benifit),0)*(-1)),0)) as varchar(200)))||')'
when round(sum(planned_financial_benifit),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(planned_financial_benifit)/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round(sum(planned_financial_benifit)),0), '9,999,999,999')))) end as demand_planned_financial_benifit,

case when round(sum(planned_operating_doc_cost),0) <0
then '($'||(cast((coalesce((round(sum(planned_operating_doc_cost),0)*(-1)),0)) as varchar(200)))||')'
when round(sum(planned_operating_doc_cost),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(planned_operating_doc_cost)/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round(sum(planned_operating_doc_cost)),0), '9,999,999,999')))) end as demand_planned_operating_cost,

case when round(sum(fulfilled_demand_cost),0) <0
then '($'||(cast((coalesce((round(sum(fulfilled_demand_cost),0)*(-1)),0)) as varchar(200)))||')'
when round(sum(fulfilled_demand_cost),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(fulfilled_demand_cost)/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round(sum(fulfilled_demand_cost)),0), '9,999,999,999')))) end as fulfilled_demand_cost,

case when round(sum(new_demand_cost),0) <0
then '($'||(cast((coalesce((round(sum(new_demand_cost),0)*(-1)),0)) as varchar(200)))||')'
when round(sum(new_demand_cost),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(new_demand_cost)/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round(sum(new_demand_cost)),0), '9,999,999,999')))) end as new_demand_cost,

case when round(sum(pending_demand_cost),0) <0
then '($'||(cast((coalesce((round(sum(pending_demand_cost),0)*(-1)),0)) as varchar(200)))||')'
when round(sum(pending_demand_cost),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(pending_demand_cost)/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round(sum(pending_demand_cost)),0), '9,999,999,999')))) end as pending_demand_cost,

case when round(sum(planned_project_to_demand_cost_variance),0)<0
then '-$'||(cast((coalesce((round(sum(planned_project_to_demand_cost_variance),0)*(-1)),0)) as varchar(200)))||''
when round(sum(planned_project_to_demand_cost_variance),0)>=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(planned_project_to_demand_cost_variance)/1000),0),0),'9,999,999,999')),'K'))
else concat('$',(trim(to_char(coalesce(round(sum(planned_project_to_demand_cost_variance)),0),'9,999,999,999')))) 
end as planned_project_to_demand_cost_variance,

case when round(sum(project_actual_cost),0) <0
then '($'||(cast((coalesce((round(sum(project_actual_cost),0)*(-1)),0)) as varchar(200)))||')'
when round(sum(project_actual_cost),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(project_actual_cost)/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round(sum(project_actual_cost)),0), '9,999,999,999')))) end as project_actual_cost,

case when round(sum(project_planned_cost),0) <0
then '($'||(cast((coalesce((round(sum(project_planned_cost),0)*(-1)),0)) as varchar(200)))||')'
when round(sum(project_planned_cost),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(project_planned_cost)/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round(sum(project_planned_cost)),0), '9,999,999,999')))) end as project_planned_cost

from #DWH_TABLE_SCHEMA.temp_demand_icube
group by demand_category

order by LOWER(demand_category)