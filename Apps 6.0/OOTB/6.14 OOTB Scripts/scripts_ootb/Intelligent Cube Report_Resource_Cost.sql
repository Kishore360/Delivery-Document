select	POR.name AS Portfolio,		
	PJ.project_name AS Project,		
    TPJ.project_name AS Top_Project,	
	PJ.is_top_flag AS Is_Top_Project,
    PJ.task_type,
	
	round(sum(case when RWS.resource_key is null then 0 else 1 end),0) no_of_resources,
	
	case when round((coalesce(sum(RWS.actual_hours) * sum(RWS.per_hour_doc_cost),0)),0) <0
	then concat('-$',(cast((coalesce((round((coalesce(sum(RWS.actual_hours) * sum(RWS.per_hour_doc_cost),0)),0)*(-1)),0)) as varchar(200))))
	when round((coalesce(sum(RWS.actual_hours) * sum(RWS.per_hour_doc_cost),0)),0) >=1000
	then concat('$',concat(trim(to_char(coalesce(round(((coalesce(sum(RWS.actual_hours) * sum(RWS.per_hour_doc_cost),0))/1000),0),0), '9,999,999,999')),'K')) 
	else concat('$',(trim(to_char(coalesce(round((coalesce(sum(RWS.actual_hours) * sum(RWS.per_hour_doc_cost),0))),0), '9,999,999,999')))) end As Resource_Cost,
	
	case when round((Sum(RWS.allocated_doc_cost)),0) <0
	then concat('-$',(cast((coalesce((round((Sum(RWS.allocated_doc_cost)),0)*(-1)),0)) as varchar(200))))
	when round((Sum(RWS.allocated_doc_cost)),0) >=1000
	then concat('$',concat(trim(to_char(coalesce(round(((Sum(RWS.allocated_doc_cost))/1000),0),0), '9,999,999,999')),'K')) 
	else concat('$',(trim(to_char(coalesce(round((Sum(RWS.allocated_doc_cost))),0), '9,999,999,999')))) end As Resource_Allocated_Cost,
	
    case when round((sum(RWS.per_hour_doc_cost)),0) <0
	then concat('-$',(cast((coalesce((round((sum(RWS.per_hour_doc_cost)),0)*(-1)),0)) as varchar(200))))
	when round((sum(RWS.per_hour_doc_cost)),0) >=1000
	then concat('$',concat(trim(to_char(coalesce(round(((sum(RWS.per_hour_doc_cost))/1000),0),0), '9,999,999,999')),'K')) 
	else concat('$',(trim(to_char(coalesce(round((sum(RWS.per_hour_doc_cost))),0), '9,999,999,999')))) end As Resource_Per_Hour_Cost, 
	
	case when round((SUM(RWS.planned_doc_cost) / SUM(RWS.actual_hours)),0) is null then null
	when round((SUM(RWS.planned_doc_cost) / SUM(RWS.actual_hours)),0) <0
	then concat('-$',(cast((coalesce((round((SUM(RWS.planned_doc_cost) / SUM(RWS.actual_hours)),0)*(-1)),0)) as varchar(200))))
	when round((SUM(RWS.planned_doc_cost) / SUM(RWS.actual_hours)),0) >=1000
	then concat('$',concat(trim(to_char(coalesce(round(((SUM(RWS.planned_doc_cost) / SUM(RWS.actual_hours))/1000),0),0), '9,999,999,999')),'K')) 
	else concat('$',(trim(to_char(coalesce(round((SUM(RWS.planned_doc_cost) / SUM(RWS.actual_hours))),0), '9,999,999,999')))) end avg_hourly_rate,
	
	case when round((coalesce(sum(RWS.actual_hours) * sum(RWS.per_hour_doc_cost),0) - Sum(RWS.allocated_doc_cost)),0) <0
	then concat('-$',(cast((coalesce((round((coalesce(sum(RWS.actual_hours) * sum(RWS.per_hour_doc_cost),0) - Sum(RWS.allocated_doc_cost)),0)*(-1)),0)) as varchar(200))))
	when round((coalesce(sum(RWS.actual_hours) * sum(RWS.per_hour_doc_cost),0) - Sum(RWS.allocated_doc_cost)),0) >=1000
	then concat('$',concat(trim(to_char(coalesce(round(((coalesce(sum(RWS.actual_hours) * sum(RWS.per_hour_doc_cost),0) - Sum(RWS.allocated_doc_cost))/1000),0),0), '9,999,999,999')),'K')) 
	else concat('$',(trim(to_char(coalesce(round((coalesce(sum(RWS.actual_hours) * sum(RWS.per_hour_doc_cost),0) - Sum(RWS.allocated_doc_cost))),0), '9,999,999,999')))) end resource_cost_variance_act_vs_allocated,
	
	case when round((coalesce(sum(RWS.actual_hours) * sum(RWS.per_hour_doc_cost),0) - SUM(RWS.planned_doc_cost)),0) <0
	then concat('-$',(cast((coalesce((round((coalesce(sum(RWS.actual_hours) * sum(RWS.per_hour_doc_cost),0) - SUM(RWS.planned_doc_cost)),0)*(-1)),0)) as varchar(200))))
	when round((coalesce(sum(RWS.actual_hours) * sum(RWS.per_hour_doc_cost),0) - SUM(RWS.planned_doc_cost)),0) >=1000
	then concat('$',concat(trim(to_char(coalesce(round(((coalesce(sum(RWS.actual_hours) * sum(RWS.per_hour_doc_cost),0) - SUM(RWS.planned_doc_cost))/1000),0),0), '9,999,999,999')),'K')) 
	else concat('$',(trim(to_char(coalesce(round((coalesce(sum(RWS.actual_hours) * sum(RWS.per_hour_doc_cost),0) - SUM(RWS.planned_doc_cost))),0), '9,999,999,999')))) end resource_cost_variance_act_vs_planned,
	
	case when round((Sum(RWS.allocated_doc_cost) - SUM(RWS.planned_doc_cost)),0) <0
	then concat('-$',(cast((coalesce((round((Sum(RWS.allocated_doc_cost) - SUM(RWS.planned_doc_cost)),0)*(-1)),0)) as varchar(200))))
	when round((Sum(RWS.allocated_doc_cost) - SUM(RWS.planned_doc_cost)),0) >=1000
	then concat('$',concat(trim(to_char(coalesce(round(((Sum(RWS.allocated_doc_cost) - SUM(RWS.planned_doc_cost))/1000),0),0), '9,999,999,999')),'K')) 
	else concat('$',(trim(to_char(coalesce(round((Sum(RWS.allocated_doc_cost) - SUM(RWS.planned_doc_cost))),0), '9,999,999,999')))) end resource_cost_variance_allocated_vs_planned,
	
	case when round((coalesce((SUM(RWS.actual_hours) - SUM(RWS.planned_hours)) * (SUM(RWS.planned_doc_cost) / SUM(RWS.actual_hours)),0)),0) <0
	then concat('-$',(cast((coalesce((round((coalesce((SUM(RWS.actual_hours) - SUM(RWS.planned_hours)) * (SUM(RWS.planned_doc_cost) / SUM(RWS.actual_hours)),0)),0)*(-1)),0)) as varchar(200))))
	when round((coalesce((SUM(RWS.actual_hours) - SUM(RWS.planned_hours)) * (SUM(RWS.planned_doc_cost) / SUM(RWS.actual_hours)),0)),0) >=1000
	then concat('$',concat(trim(to_char(coalesce(round(((coalesce((SUM(RWS.actual_hours) - SUM(RWS.planned_hours)) * (SUM(RWS.planned_doc_cost) / SUM(RWS.actual_hours)),0))/1000),0),0), '9,999,999,999')),'K')) 
	else concat('$',(trim(to_char(coalesce(round((coalesce((SUM(RWS.actual_hours) - SUM(RWS.planned_hours)) * (SUM(RWS.planned_doc_cost) / SUM(RWS.actual_hours)),0))),0), '9,999,999,999')))) end missed_project_credit,
	
	case when round((SUM(RWS.planned_doc_cost)),0) <0
	then concat('-$',(cast((coalesce((round((SUM(RWS.planned_doc_cost)),0)*(-1)),0)) as varchar(200))))
	when round((SUM(RWS.planned_doc_cost)),0) >=1000
	then concat('$',concat(trim(to_char(coalesce(round(((SUM(RWS.planned_doc_cost))/1000),0),0), '9,999,999,999')),'K')) 
	else concat('$',(trim(to_char(coalesce(round((SUM(RWS.planned_doc_cost))),0), '9,999,999,999')))) end As Resource_Planned_Effort_Cost
	
from	#DWH_TABLE_SCHEMA.f_n_resource_weekly_snapshot RWS
	left join #DWH_TABLE_SCHEMA.f_resource_allocation	RA	
	  on 	(RWS.resource_key = RA.resource_key
	  		 and RWS.project_key = RA.project_key
			 and RWS.row_key = RA.row_key
			 )
    left join #DWH_TABLE_SCHEMA.d_resource_plan	RP
	  on	(RWS.resource_plan_key=RP.row_key)
	left join	#DWH_TABLE_SCHEMA.d_project	PJ
	  on 	(RWS.project_key = PJ.row_key)	
	left join	#DWH_TABLE_SCHEMA.d_internal_contact	IC
	  on 	(RWS.resource_key = IC.row_key)	
	left join	#DWH_TABLE_SCHEMA.d_calendar_date	CAL1
	  on 	(RP.planned_start_on_key = CAL1.row_key)	
	left join	#DWH_TABLE_SCHEMA.d_calendar_date	CAL2
	  on 	(RWS.n_key = CAL2.row_key)	
	left join	#DWH_TABLE_SCHEMA.d_project	TPJ
	  on 	(PJ.top_project_key = TPJ.row_key)	
	left join	#DWH_TABLE_SCHEMA.d_internal_organization IOG
	  on 	(RWS.group_resource_key = IOG.row_key)	
    left join	#DWH_TABLE_SCHEMA.d_portfolio	POR
	  on 	(TPJ.portfolio_key = POR.row_key)
where	CAL1.lagging_count_of_month between 0 and 23	and
CAL2.lagging_count_of_weeks = 0 and
POR.row_key not in (0,-1) and
RWS.soft_deleted_flag = 'N'
group by POR.row_key, POR.name, PJ.row_key, PJ.project_name, TPJ.row_key, TPJ.project_name, PJ.is_top_flag, PJ.task_type
order by POR.row_key, lower(POR.name), PJ.row_key, lower(PJ.project_name), TPJ.row_key, lower(TPJ.project_name);