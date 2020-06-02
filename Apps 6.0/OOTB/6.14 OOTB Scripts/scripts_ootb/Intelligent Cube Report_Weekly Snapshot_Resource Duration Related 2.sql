select	POR.name AS Portfolio,		
	PJ.project_name AS Project,		
    TPJ.project_name AS Top_Project,	
	PJ.is_top_flag AS Is_Top_Project,
    PJ.task_type task,
    concat(CAL.month_name_abbreviated::text, concat(' '::text, "substring"(CAL.week_start_date_key::text, 7, 8))) week_nm,
	
	TO_CHAR((RWS.actual_end_on),'fmMM/fmDD/YYYY fmHH:MI:SS AM') act_end,
	TO_CHAR((RWS.actual_start_on),'fmMM/fmDD/YYYY fmHH:MI:SS AM') act_strt,
	TO_CHAR((RWS.planned_end_on),'fmMM/fmDD/YYYY fmHH:MI:SS AM') plnd_end,
	
	max(trim(to_char(RWS.actual_end_on, 'MM/DD'))) act_end_dt,
	max(trim(to_char(RWS.actual_start_on, 'MM/DD'))) act_strt_dt,
	max(trim(to_char(RWS.planned_start_on, 'MM/DD'))) plnd_strt_dt,
	
	case when round((coalesce((sum(datediff(day, RWS.actual_start_on, RWS.actual_end_on))),0.0)),1) < 0
	then '('||trim(to_char(round((sum(datediff(day, RWS.actual_start_on, RWS.actual_end_on))),1)*(-1.0), '9,999,999,990.9'))||')'
	else trim(to_char(round((coalesce((sum(datediff(day, RWS.actual_start_on, RWS.actual_end_on))),0.0)),1), '9,999,999,990.9')) end Resource_Task_Actual_Duration_Timeline,
	
	case when round((coalesce((sum(datediff(day, RWS.planned_start_on, RWS.actual_start_on))),0.0)),1) < 0
	then '('||trim(to_char(round((sum(datediff(day, RWS.planned_start_on, RWS.actual_start_on))),1)*(-1.0), '9,999,999,990.9'))||')'
	else trim(to_char(round((coalesce((sum(datediff(day, RWS.planned_start_on, RWS.actual_start_on))),0.0)),1), '9,999,999,990.9')) end Resource_Task_Start_Delay_Duration_Timeline,
	
	case when round((coalesce((sum(datediff(day, RWS.planned_end_on, RWS.actual_end_on))),0)),0) < 0 and RWS.actual_end_on > RWS.planned_end_on
	then '('||trim(to_char(round((sum(datediff(day, RWS.planned_end_on, RWS.actual_end_on))),1)*(-1.0), '9,999,999,990.9'))||')'
	when round((coalesce((sum(datediff(day, RWS.planned_end_on, RWS.actual_end_on))),0.0)),1) >= 0 and RWS.actual_end_on > RWS.planned_end_on
	then trim(to_char(round((coalesce((sum(datediff(day, RWS.planned_end_on, RWS.actual_end_on))),0.0)),1), '9,999,999,990.9'))
	else trim(to_char(0.0, '9,999,999,990.9')) end Resource_Task_Overrun_Duration_Timeline,
	
	case when coalesce(round(sum(RWS.allocated_hours), 0),0) = 0 then null
	when coalesce(round(sum(RWS.actual_hours), 0),0) = 0 then concat(trim(to_char(round(0,0), '9,999,999,990')),'%')
	else concat(trim(to_char(round((sum(RWS.actual_hours)*100/sum(RWS.allocated_hours)),0), '9,999,999,990')),'%') end Timecard_Compliance_prct,
	
	case when coalesce(round(sum(RWS.planned_hours), 0),0) = 0 then null
	when coalesce(round(sum(RWS.actual_hours), 0),0) = 0 then concat(trim(to_char(round(0,0), '9,999,999,990')),'%')
	else concat(trim(to_char(round((sum(RWS.actual_hours)*100/sum(RWS.planned_hours)),0), '9,999,999,990')),'%') end project_utilization_prct
	
from	(	
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
POR.row_key not in (0,-1) and RWS.soft_deleted_flag = 'N' and PJ.parent_project_key not in (0,-1)
group by POR.row_key, POR.name, PJ.row_key, PJ.project_name, TPJ.row_key, TPJ.project_name, PJ.is_top_flag, PJ.task_type, week_nm, RWS.actual_start_on, RWS.actual_end_on, RWS.planned_end_on
order by POR.row_key, lower(POR.name), PJ.row_key, lower(PJ.project_name), TPJ.row_key, lower(TPJ.project_name), task, week_nm, RWS.actual_start_on, RWS.actual_end_on, RWS.planned_end_on;