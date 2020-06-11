SELECT name, portfolio_category, portfolio_code, portfolio_cost_variance_color, portfolio_effort_variance_color, portfolio_finish_date, 
portfolio_goal_alignment, portfolio_innovation_level, portfolio_manager, portfolio_overall_health, portfolio_probability_of_success, 
portfolio_risk, portfolio_schedule_variance, portfolio_stakeholder, portfolio_start_date, 

case when round(sum(benefits_target),0) <0
then '($'||(cast((coalesce((round(sum(benefits_target),0)*(-1)),0)) as varchar(200)))||')'
when round(sum(benefits_target),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(benefits_target)/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round(sum(benefits_target)),0), '9,999,999,999')))) end benefits_target,
 
case when round(sum(capital_cost_target),0) <0
then '($'||(cast((coalesce((round(sum(capital_cost_target),0)*(-1)),0)) as varchar(200)))||')'
when round(sum(capital_cost_target),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(capital_cost_target)/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round(sum(capital_cost_target)),0), '9,999,999,999')))) end capital_cost_target,


case when round(sum(cost_variance),0) <0
then '($'||(cast((coalesce((round(sum(cost_variance),0)*(-1)),0)) as varchar(200)))||')'
when round(sum(cost_variance),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(cost_variance)/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round(sum(cost_variance)),0), '9,999,999,999')))) end cost_variance,


case when round(sum(demand_planned_cost),0) <0
then '($'||(cast((coalesce((round(sum(demand_planned_cost),0)*(-1)),0)) as varchar(200)))||')'
when round(sum(demand_planned_cost),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(demand_planned_cost)/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round(sum(demand_planned_cost)),0), '9,999,999,999')))) end demand_planned_cost,

sum(number_of_green_portfolios) as number_of_green_portfolios, sum(number_of_portfolios) as number_of_portfolios, 

case when round(sum(operating_cost_target),0) <0
then '($'||(cast((coalesce((round(sum(operating_cost_target),0)*(-1)),0)) as varchar(200)))||')'
when round(sum(operating_cost_target),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(operating_cost_target)/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round(sum(operating_cost_target)),0), '9,999,999,999')))) end operating_cost_target,

case when round(sum(others_planned_cost),0) <0
then '($'||(cast((coalesce((round(sum(others_planned_cost),0)*(-1)),0)) as varchar(200)))||')'
when round(sum(others_planned_cost),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(others_planned_cost)/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round(sum(others_planned_cost)),0), '9,999,999,999')))) end others_planned_cost,

concat(trim(to_char(case when sum(number_of_portfolios)=0 then 0 else
round(((sum(number_of_green_portfolios)*100)/sum(number_of_portfolios)),1) end , '9,999,999,990D9')),'%') as portfolio_good_health_ratio,

case when round(sum(project_actual_cost),0) <0
then '($'||(cast((coalesce((round(sum(project_actual_cost),0)*(-1)),0)) as varchar(200)))||')'
when round(sum(project_actual_cost),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(project_actual_cost)/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round(sum(project_actual_cost)),0), '9,999,999,999')))) end project_actual_cost,

case when round(sum(project_planned_cost),0) <0
then '($'||(cast((coalesce((round(sum(project_planned_cost),0)*(-1)),0)) as varchar(200)))||')'
when round(sum(project_planned_cost),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(project_planned_cost)/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round(sum(project_planned_cost)),0), '9,999,999,999')))) end project_planned_cost,

round(sum(resources_target)) as resources_target,

case when round(sum(total_cost_target),0) <0
then '($'||(cast((coalesce((round(sum(total_cost_target),0)*(-1)),0)) as varchar(200)))||')'
when round(sum(total_cost_target),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(total_cost_target)/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round(sum(total_cost_target)),0), '9,999,999,999')))) end total_cost_target,

case when round(sum(total_planned_cost),0) <0
then '($'||(cast((coalesce((round(sum(total_planned_cost),0)*(-1)),0)) as varchar(200)))||')'
when round(sum(total_planned_cost),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(total_planned_cost)/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round(sum(total_planned_cost)),0), '9,999,999,999')))) end total_planned_cost


FROM
(
select port_d.name, 'UNSPECIFIED' AS portfolio_category, port_d.portfolio_id as portfolio_code,
lov_cost_var.dimension_name as portfolio_cost_variance_color, lov_eff_var.dimension_name as portfolio_effort_variance_color,
port_d.finish_date AS portfolio_finish_date, lov_goal_alig.dimension_name as portfolio_goal_alignment, 	
lov_inn_level.dimension_name as portfolio_innovation_level, port_mgr.full_name as portfolio_manager,
lov_overall_helth.dimension_name AS portfolio_overall_health, 
lov_prob_succ.dimension_name as portfolio_probability_of_success, 
lov_risk.dimension_name as portfolio_risk, lov_sch_var_col.dimension_name as portfolio_schedule_variance, 
port_stake.full_name as portfolio_stakeholder, port_d.start_date AS portfolio_start_date,
port_f.benefits_doc_target as benefits_target, port_f.capital_doc_cost_target as capital_cost_target,

(port_f.project_actual_doc_cost-port_f.project_planned_doc_cost) as cost_variance,

port_f.demand_planned_doc_cost as demand_planned_cost, 
case when UPPER(lov_overall_helth.dimension_name)='GREEN' then 1 else 0 end as number_of_green_portfolios,
1 as number_of_portfolios, port_f.operating_doc_cost_target as operating_cost_target,
port_f.project_actual_doc_cost as project_actual_cost, port_f.others_planned_doc_cost as others_planned_cost,
port_f.project_planned_doc_cost as project_planned_cost, port_f.resources_target as resources_target,
(port_f.operating_doc_cost_target+port_f.capital_doc_cost_target) as total_cost_target, 
(port_f.project_planned_doc_cost+port_f.demand_planned_doc_cost+port_f.others_planned_doc_cost) as total_planned_cost
-- (port_f.project_actual_doc_cost+port_f.demand_actual_doc_cost+port_f.others_actual_doc_cost) as total_actual_cost
from #DWH_TABLE_SCHEMA.f_portfolio port_f
left outer join #DWH_TABLE_SCHEMA.d_portfolio port_d
on port_f.portfolio_key=port_d.row_key
left outer join #DWH_TABLE_SCHEMA.d_internal_contact port_mgr
on port_mgr.row_key=port_f.portfolio_manager_key
left outer join #DWH_TABLE_SCHEMA.d_internal_contact port_stake
on port_stake.row_key=port_f.portfolio_stakeholder_key
left outer join 
(select src_lov.row_key, src_lov.dimension_name
from #DWH_TABLE_SCHEMA.d_lov src_lov
left outer join #DWH_TABLE_SCHEMA.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  #DWH_TABLE_SCHEMA.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where src_lov.dimension_class = 'PORTFOLIO~COST_VARIANCE_COLOR' or src_lov.row_key in (0,-1)) lov_cost_var
on lov_cost_var.row_key = port_d.portfolio_cost_variance_color_src_key
left outer join
(select src_lov.row_key, src_lov.dimension_name
from #DWH_TABLE_SCHEMA.d_lov src_lov
left outer join #DWH_TABLE_SCHEMA.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  #DWH_TABLE_SCHEMA.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where src_lov.dimension_class = 'PORTFOLIO~EFFORT_VARIANCE_COLOR' or src_lov.row_key in (0,-1)) lov_eff_var
on lov_eff_var.row_key = port_d.portfolio_effort_variance_color_src_key
left outer join
(select src_lov.row_key, src_lov.dimension_name
from #DWH_TABLE_SCHEMA.d_lov src_lov
left outer join #DWH_TABLE_SCHEMA.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  #DWH_TABLE_SCHEMA.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where src_lov.dimension_class = 'PORTFOLIO~GOAL_ALIGNMENT' or src_lov.row_key in (0,-1)) lov_goal_alig
on lov_goal_alig.row_key = port_d.portfolio_goal_alignment_src_key
left outer join
(select src_lov.row_key, src_lov.dimension_name
from #DWH_TABLE_SCHEMA.d_lov src_lov
left outer join #DWH_TABLE_SCHEMA.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  #DWH_TABLE_SCHEMA.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where src_lov.dimension_class = 'PORTFOLIO~INNOVATION_LEVEL' or src_lov.row_key in (0,-1)) lov_inn_level
on lov_inn_level.row_key = port_d.portfolio_innovation_level_src_key
left outer join
(select src_lov.row_key, src_lov.dimension_name
from #DWH_TABLE_SCHEMA.d_lov src_lov
left outer join #DWH_TABLE_SCHEMA.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  #DWH_TABLE_SCHEMA.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where src_lov.dimension_class = 'PORTFOLIO~PROBABILITY_OF_SUCCESS' or src_lov.row_key in (0,-1)) lov_prob_succ
on lov_prob_succ.row_key = port_d.portfolio_probability_of_success_src_key
left outer join
(select src_lov.row_key, src_lov.dimension_name
from #DWH_TABLE_SCHEMA.d_lov src_lov
left outer join #DWH_TABLE_SCHEMA.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  #DWH_TABLE_SCHEMA.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where src_lov.dimension_class = 'PORTFOLIO~RISK' or src_lov.row_key in (0,-1)) lov_risk
on lov_risk.row_key = port_d.portfolio_risk_src_key
left outer join
(select src_lov.row_key, src_lov.dimension_name
from #DWH_TABLE_SCHEMA.d_lov src_lov
left outer join #DWH_TABLE_SCHEMA.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
left outer join  #DWH_TABLE_SCHEMA.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where src_lov.dimension_class = 'PORTFOLIO~SCHEDULE_VARIANCE_COLOR' or src_lov.row_key in (0,-1)) lov_sch_var_col
on lov_sch_var_col.row_key = port_d.portfolio_schedule_variance_color_src_key
left outer join
(select row_key,dimension_name FROM #DWH_TABLE_SCHEMA.d_lov
WHERE dimension_class = 'WH_PORTFOLIO~OVERAL_HEALTH' OR row_key = 0 OR row_key = -1) lov_overall_helth
on lov_overall_helth.row_key = port_d.portfolio_overall_health_src_key
left outer join 
(
select source_id, max(lastupdated) as lastupdated
from #DWH_TABLE_SCHEMA.d_o_data_freshness
group by source_id
) fresh
on fresh.source_id = port_f.source_id
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
on cal_date.row_key = port_d.start_date
-- where cal_date.lagging_count_of_month<=23
)inn
group by name, portfolio_category, portfolio_code, portfolio_cost_variance_color, portfolio_effort_variance_color, portfolio_finish_date, 
portfolio_goal_alignment, portfolio_innovation_level, portfolio_manager, portfolio_overall_health, portfolio_probability_of_success, 
portfolio_risk, portfolio_schedule_variance, portfolio_stakeholder, portfolio_start_date

order by UPPER(name),portfolio_code