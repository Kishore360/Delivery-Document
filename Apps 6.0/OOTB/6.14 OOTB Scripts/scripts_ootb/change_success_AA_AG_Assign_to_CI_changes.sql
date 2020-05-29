select  -- All_Col.caused_incident_flag, All_Col.caused_problem_flag,All_Col.ci_class,All_Col.failure_probability, All_Col.short_description, 
-- All_Col.state, 
All_Col.change_number, All_Col.assigned_to,All_Col.assignment_group,All_Col.caused_incident_flag,All_Col.caused_problem_flag,All_Col.close_code, All_Col.numerify_change_failure_flag,
sum(closed_changes) as closed_changes, sum(Open_changes) Open_changes,
 to_char(coalesce(round(sum(incidents_caused_by_change),0),0), '9,999,999,999') as incidents_caused_by_change,
 to_char(coalesce(round(sum(problems_caused_by_change),0),0), '9,999,999,999') as problems_caused_by_change, 
 case when sum(closed_changes)=0 then null when sum(Unsuccessful_changes)=0 then 0 
else sum(Unsuccessful_changes)/sum(closed_changes) end as Failure_Rate_Numerify,
sum(Unsuccessful_changes) as Unsuccessful_changes

/*sum(AG_Prior_Changes) as AG_Prior_Changes, -- sum(AG_Prior_Failure_Rate) as  AG_Prior_Failure_Rate, 
case when sum(AG_Prior_Failure_Rate)=0 then '0.00%'
	 when sum(AG_Prior_Failure_Rate)<0 then 	  '('||(cast((coalesce((round((sum(AG_Prior_Failure_Rate)*100),2)*(-1)),0)) as varchar(200)))||'%)'
	  else concat(trim(to_char(coalesce(round((sum(AG_Prior_Failure_Rate)*100),2),0), '9,999,999,990D9')),'%') end as AG_Prior_Failure_Rate,
sum(Assigned_To_Prior_changes) as Assigned_To_Prior_changes, 

case when sum(Assigned_To_Prior_Failure_Rate)=0 then '0.00%'
	 when sum(Assigned_To_Prior_Failure_Rate)<0 then '('||(cast((coalesce((round((sum(Assigned_To_Prior_Failure_Rate)*100),2)*(-1)),0)) as varchar(200)))||'%)'
	  else concat(trim(to_char(coalesce(round((sum(Assigned_To_Prior_Failure_Rate)*100),2),0), '9,999,999,990D9')),'%') end as Assigned_To_Prior_Failure_Rate,

-- sum(Assigned_To_Prior_Failure_Rate) as Assigned_To_Prior_Failure_Rate,
sum(ci_prior_changes) as ci_prior_changes, 

case when sum(CI_Prior_Failure_rate)=0 then '0.00%'
	 when sum(CI_Prior_Failure_rate)<0 then 	  '('||(cast((coalesce((round((sum(CI_Prior_Failure_rate)*100),2)*(-1)),0)) as varchar(200)))||'%)'
	  else concat(trim(to_char(coalesce(round((sum(CI_Prior_Failure_rate)*100),2),0), '9,999,999,990D9')),'%') end as CI_Prior_Failure_rate,

-- sum(CI_Prior_Failure_rate) as CI_Prior_Failure_rate, 
 

-- sum(incidents_caused_by_change) as incidents_caused_by_change, 
to_char(coalesce(round(sum(incidents_caused_by_change),0),0), '9,999,999,999') as incidents_caused_by_change, 
sum(Open_changes) Open_changes,  
-- sum(problems_caused_by_change) as problems_caused_by_change, 
*/

from  
 
(
select chg_req.row_id, chg_fail.assigned_to, chg_fail.assignment_group, chg_fail.caused_incident_flag, chg_fail.caused_problem_flag, chg_req.change_number, chg_fail.ci_class,
close_cd_lov.source_dimension_name as close_code, chg_fail.numerify_change_failure_flag, 
case when state_lov.wh_dimension_name= 'CLOSED' then null else chg_fail.failure_probability end as failure_probability, 
chg_req.short_description, 
state_lov.source_dimension_name as state, AG_Prior_Changes, AG_Prior_Failure_Rate, Assigned_To_Prior_changes, Assigned_To_Prior_Failure_Rate,
ci_prior_changes, CI_Prior_Failure_rate, case when state_lov.wh_dimension_name= 'CLOSED' THEN 1 ELSE 0 END AS closed_changes,
 incidents_caused_by_change, case when state_lov.wh_dimension_name= 'CLOSED' THEN 0 ELSE 1 END AS Open_changes,  problems_caused_by_change,
 case when state_lov.wh_dimension_name= 'CLOSED' and chg_fail.numerify_change_failure_flag = 'Y' THEN 1 ELSE 0 END AS Unsuccessful_changes

 from

(SELECT row_key, row_id, change_state_src_key, change_assigned_to as assigned_to, change_assigned_to_key, change_assignment_group as assignment_group, change_assignment_group_key, ci_class, ci_key,
case when incidents_caused_by_change>0 then 'Y' else 'N' END as caused_incident_flag, case when problems_caused_by_change>0 then 'Y' else 'N' END as caused_problem_flag,
numerify_change_failure_flag, failure_probability_1 as failure_probability, source_id, assignment_group_prior_changes as AG_Prior_Changes, 
assignment_group_prior_failure_rate as AG_Prior_Failure_Rate, assignee_prior_changes as Assigned_To_Prior_changes, assignee_prior_failure_rate as
Assigned_To_Prior_Failure_Rate, ci_prior_changes as ci_prior_changes, CI_Prior_Failure_rate as CI_Prior_Failure_rate,
incidents_caused_by_change, problems_caused_by_change,
case when closed_on_key is null and opened_on_key is null then null
when closed_on_key is null then opened_on_key
when opened_on_key is null then closed_on_key
when opened_on_key>closed_on_key then opened_on_key
else closed_on_key end as date_key
FROM #DWH_TABLE_SCHEMA.d_change_failure WHERE current_flag = 'Y') chg_fail

left outer join
(select row_id,short_description,change_request_number as change_number,close_code_src_key from #DWH_TABLE_SCHEMA.d_change_request) chg_req
on chg_req.row_id = chg_fail.row_id

left join 
(SELECT COALESCE(wh_lov.dimension_name, change_request_close_code.dimension_name) AS wh_dimension_name, 
change_request_close_code.dimension_name AS source_dimension_name, change_request_close_code.dimension_code AS source_dimension_code,
COALESCE(wh_lov.dimension_code, change_request_close_code.dimension_code) AS wh_dimension_code, COALESCE(wh_lov.row_id, change_request_close_code.row_id) 
AS wh_row_id, change_request_close_code.row_key
   FROM #DWH_TABLE_SCHEMA.d_lov change_request_close_code
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON change_request_close_code.row_key = br.src_key AND change_request_close_code.row_key <> 0 AND change_request_close_code.row_key <> -1
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON br.wh_key = wh_lov.row_key
  WHERE change_request_close_code.dimension_class::text = 'CLOSE_CODE~CHANGE_REQUEST'::text 
  OR change_request_close_code.row_key = 0 OR change_request_close_code.row_key = -1) close_cd_lov
on chg_req.close_code_src_key = close_cd_lov.row_key
  
left join 
(SELECT COALESCE(wh_lov.dimension_code, change_request_state.dimension_code) AS wh_dimension_code, COALESCE(wh_lov.dimension_name, 
change_request_state.dimension_name) AS wh_dimension_name, change_request_state.dimension_name AS source_dimension_name,
COALESCE(wh_lov.row_id, change_request_state.row_id) AS wh_row_id,change_request_state.row_key
  FROM #DWH_TABLE_SCHEMA.d_lov change_request_state
  LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON change_request_state.row_key = br.src_key AND change_request_state.row_key <> -1 AND change_request_state.row_key <> 0
  LEFT JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON br.wh_key = wh_lov.row_key
  WHERE change_request_state.row_key = -1 OR change_request_state.row_key = 0
  OR change_request_state.dimension_class::text = 'STATE~CHANGE_REQUEST'::text) state_lov
on chg_fail.change_state_src_key = state_lov.row_key

left outer join 
(
select source_id, max(lastupdated) as lastupdated
from #DWH_TABLE_SCHEMA.d_o_data_freshness
group by source_id
) fresh
on fresh.source_id = chg_fail.source_id

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
on cal_date.row_key = chg_fail.date_key 
where cal_date.lagging_count_of_month between 0 and 12
) All_Col
group by 
All_Col.change_number, All_Col.assigned_to,All_Col.assignment_group,all_col.caused_incident_flag,All_Col.caused_problem_flag,All_Col.close_code, All_Col.numerify_change_failure_flag
order by All_Col.change_number