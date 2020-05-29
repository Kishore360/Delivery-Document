select	POR.name AS Portfolio,		
	PJ.project_name AS Project,		
    TPJ.project_name AS Top_Project,	
	PJ.is_top_flag AS Is_Top_Project,
    PJ.task_type task,
    concat(CAL.month_name_abbreviated::text, concat(' '::text, "substring"(CAL.week_start_date_key::text, 7, 8))) week_nm,
	
	case when round((Sum(RWS.allocated_doc_cost)),0) <0
	then concat('-$',(cast((coalesce((round((Sum(RWS.allocated_doc_cost)),0)*(-1)),0)) as varchar(200))))
	when round((Sum(RWS.allocated_doc_cost)),0) >=1000
	then concat('$',concat(trim(to_char(coalesce(round(((Sum(RWS.allocated_doc_cost))/1000),0),0), '9,999,999,999')),'K')) 
	else concat('$',(trim(to_char(coalesce(round((Sum(RWS.allocated_doc_cost))),0), '9,999,999,999')))) end As Resource_Allocated_Cost,
	
	case when round((coalesce(sum(RWS.actual_hours) * sum(RWS.per_hour_doc_cost),0)),0) <0
	then concat('-$',(cast((coalesce((round((coalesce(sum(RWS.actual_hours) * sum(RWS.per_hour_doc_cost),0)),0)*(-1)),0)) as varchar(200))))
	when round((coalesce(sum(RWS.actual_hours) * sum(RWS.per_hour_doc_cost),0)),0) >=1000
	then concat('$',concat(trim(to_char(coalesce(round(((coalesce(sum(RWS.actual_hours) * sum(RWS.per_hour_doc_cost),0))/1000),0),0), '9,999,999,999')),'K')) 
	else concat('$',(trim(to_char(coalesce(round((coalesce(sum(RWS.actual_hours) * sum(RWS.per_hour_doc_cost),0))),0), '9,999,999,999')))) end As Resource_Cost,
	
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
	
    case when round((sum(RWS.per_hour_doc_cost)),0) <0
	then concat('-$',(cast((coalesce((round((sum(RWS.per_hour_doc_cost)),0)*(-1)),0)) as varchar(200))))
	when round((sum(RWS.per_hour_doc_cost)),0) >=1000
	then concat('$',concat(trim(to_char(coalesce(round(((sum(RWS.per_hour_doc_cost))/1000),0),0), '9,999,999,999')),'K')) 
	else concat('$',(trim(to_char(coalesce(round((sum(RWS.per_hour_doc_cost))),0), '9,999,999,999')))) end As Resource_Per_Hour_Cost, 
	
	case when round((SUM(RWS.planned_hours)),0) <0
	then trim(to_char(coalesce(round((sum(RWS.planned_hours)),0),0), '9999999990'))
	else trim(to_char(coalesce(round((sum(RWS.planned_hours)),0),0), '9,999,999,990')) end planned_effort,
	
	case when round((SUM(RWS.planned_doc_cost)),0) <0
	then concat('-$',(cast((coalesce((round((SUM(RWS.planned_doc_cost)),0)*(-1)),0)) as varchar(200))))
	when round((SUM(RWS.planned_doc_cost)),0) >=1000
	then concat('$',concat(trim(to_char(coalesce(round(((SUM(RWS.planned_doc_cost))/1000),0),0), '9,999,999,999')),'K')) 
	else concat('$',(trim(to_char(coalesce(round((SUM(RWS.planned_doc_cost))),0), '9,999,999,999')))) end As Resource_Planned_Effort_Cost,
	
	case when round((SUM(RWS.planned_doc_cost) / SUM(RWS.actual_hours)),0) is null then null
	when round((SUM(RWS.planned_doc_cost) / SUM(RWS.actual_hours)),0) <0
	then concat('-$',(cast((coalesce((round((SUM(RWS.planned_doc_cost) / SUM(RWS.actual_hours)),0)*(-1)),0)) as varchar(200))))
	when round((SUM(RWS.planned_doc_cost) / SUM(RWS.actual_hours)),0) >=1000
	then concat('$',concat(trim(to_char(coalesce(round(((SUM(RWS.planned_doc_cost) / SUM(RWS.actual_hours))/1000),0),0), '9,999,999,999')),'K')) 
	else concat('$',(trim(to_char(coalesce(round((SUM(RWS.planned_doc_cost) / SUM(RWS.actual_hours))),0), '9,999,999,999')))) end avg_hourly_rate,
	
	case when round((coalesce((SUM(RWS.actual_hours) - SUM(RWS.planned_hours)) * (SUM(RWS.planned_doc_cost) / SUM(RWS.actual_hours)),0)),0) <0
	then concat('-$',(cast((coalesce((round((coalesce((SUM(RWS.actual_hours) - SUM(RWS.planned_hours)) * (SUM(RWS.planned_doc_cost) / SUM(RWS.actual_hours)),0)),0)*(-1)),0)) as varchar(200))))
	when round((coalesce((SUM(RWS.actual_hours) - SUM(RWS.planned_hours)) * (SUM(RWS.planned_doc_cost) / SUM(RWS.actual_hours)),0)),0) >=1000
	then concat('$',concat(trim(to_char(coalesce(round(((coalesce((SUM(RWS.actual_hours) - SUM(RWS.planned_hours)) * (SUM(RWS.planned_doc_cost) / SUM(RWS.actual_hours)),0))/1000),0),0), '9,999,999,999')),'K')) 
	else concat('$',(trim(to_char(coalesce(round((coalesce((SUM(RWS.actual_hours) - SUM(RWS.planned_hours)) * (SUM(RWS.planned_doc_cost) / SUM(RWS.actual_hours)),0))),0), '9,999,999,999')))) end missed_project_credit
	
from (	
   select f.*
   from #DWH_TABLE_SCHEMA.f_n_resource_weekly_snapshot f
   JOIN 
   ( SELECT d_o_data_freshness.source_id, "max"(d_o_data_freshness.lastupdated) AS lastupdated
           FROM #DWH_TABLE_SCHEMA.d_o_data_freshness
          GROUP BY d_o_data_freshness.source_id) odf ON f.source_id = odf.source_id
   JOIN #DWH_TABLE_SCHEMA.d_calendar_date calps ON calps.row_key = f.planned_start_on_key
  WHERE f.soft_deleted_flag = 'N'::bpchar AND calps.lagging_count_of_month >= 0 AND calps.lagging_count_of_month <= 23
  )RWS
	left join #DWH_TABLE_SCHEMA.f_resource_allocation	RA	
	  on 	(RWS.resource_key = RA.resource_key
	  		 and RWS.project_key = RA.project_key
			 and RWS.row_id = RA.row_id)
    left join #DWH_TABLE_SCHEMA.d_resource_plan	RP
	  on	(RWS.resource_plan_key=RP.row_key)
	left join	#DWH_TABLE_SCHEMA.d_project	PJ
	  on 	(RWS.project_key = PJ.row_key)	
	left join 	#DWH_TABLE_SCHEMA.f_project_task FPJ
	  on 	FPJ.project_key = PJ.row_key and
			FPJ.soft_deleted_flag = 'N' and
			FPJ.row_key not in (0,-1)
	left join	#DWH_TABLE_SCHEMA.d_internal_contact	IC
	  on 	(RWS.resource_key = IC.row_key)	
join 
(
   SELECT d_calendar_date.*
   FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_week ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
  WHERE d_calendar_date.week_start_date_key = d_calendar_date.row_key AND d_calendar_date.source_id = 0
) CAL
on CAL.row_key = RWS.n_key	
	left join	#DWH_TABLE_SCHEMA.d_project	TPJ
	  on 	(PJ.top_project_key = TPJ.row_key)	
	left join	#DWH_TABLE_SCHEMA.d_internal_organization IOG
	  on 	(RWS.group_resource_key = IOG.row_key)	
    left join	#DWH_TABLE_SCHEMA.d_portfolio	POR
	  on 	(TPJ.portfolio_key = POR.row_key)
where	CAL.lagging_count_of_weeks between 0 and 23	and
POR.row_key not in (0,-1) 
and RWS.soft_deleted_flag = 'N'
and PJ.parent_project_key not in (0,-1)
group by POR.row_key, POR.name, PJ.row_key, PJ.project_name, TPJ.row_key, TPJ.project_name, PJ.is_top_flag, PJ.task_type, week_nm
order by POR.row_key, lower(POR.name), PJ.row_key, lower(PJ.project_name), TPJ.row_key, lower(TPJ.project_name), week_nm;