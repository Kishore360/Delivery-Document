select	POR.name AS Portfolio,		
	PJ.project_name AS Project,		
    TPJ.project_name AS Top_Project,	
	PJ.is_top_flag AS Is_Top_Project,
    PJ.task_type,
	
	IC.full_name resource_name,
	IOG.organization_name resource_group,
	RWS.user_type resource_type,
	
	TO_CHAR((RWS.actual_end_on),'fmMM/fmDD/YYYY fmHH:MI:SS AM') act_end,
	TO_CHAR((RWS.actual_start_on),'fmMM/fmDD/YYYY fmHH:MI:SS AM') act_strt,
	TO_CHAR((RWS.planned_end_on),'fmMM/fmDD/YYYY fmHH:MI:SS AM') plnd_end,
	
	trim(to_char(coalesce(round((sum(RWS.actual_hours)),0),0), '9,999,999,990')) as resource_actual_hours,
	
	trim(to_char(coalesce(round((sum(RWS.allocated_hours)),0),0), '9,999,999,990')) as resource_allocated_hours,
	
	trim(to_char(coalesce(round((sum(RWS.planned_hours)),0),0), '9,999,999,990')) as resource_planned_effort,
	
	trim(to_char(coalesce(round((sum(RWS.overtime_hours)),0),0), '9,999,999,990')) as resource_overtime_hours,
	
	case when coalesce(round(sum(RWS.planned_hours), 0),0) = 0 then null  
	when coalesce(round((sum(RWS.planned_hours) - coalesce(sum(RWS.allocated_hours),0)), 0),0) = 0 then concat(trim(to_char(round(0,0), '9,999,999,990')),'%')
	else concat(trim(to_char(coalesce(round((((sum(RWS.planned_hours) - coalesce(sum(RWS.allocated_hours),0))*100)/sum(RWS.planned_hours)),0),0), '9,999,999,990')),'%') end as prct_allocated,
	
	case when sum(RWS.allocated_hours) = 0 then null
	else concat(trim(to_char(coalesce(round((sum(RWS.actual_hours_per_week)*100/ sum(RWS.allocated_hours)),0),0), '9,999,999,990')),'%') end as overtime_prct
	
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
group by POR.row_key, POR.name, PJ.row_key, PJ.project_name, TPJ.row_key, TPJ.project_name, PJ.is_top_flag, PJ.task_type, resource_name, resource_group, resource_type, act_end, act_strt, plnd_end
order by POR.row_key, lower(POR.name), PJ.row_key, lower(PJ.project_name), TPJ.row_key, lower(TPJ.project_name), PJ.is_top_flag, PJ.task_type, resource_name, resource_group, resource_type, act_end, act_strt, plnd_end;