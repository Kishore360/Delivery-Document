SELECT CAL_MONTH.month_name_abbreviated||' '||CAL_MONTH.year_name month_name,D.name,
round((CASE WHEN SUM(F.ACD_CALLS)=0 then NULL else SUM(F.ACD_TIME)*1.0/ sum(F.ACD_CALLS) END))  Avg_ACD_Talk_Time,
case when sum(F.acd_calls)=0 then NULL else sum(F.Acd_Time+ F.Hold_Time +F.Acw_Time) / sum(F.Acd_Calls) end Avg_handle_time
from #DWH_TABLE_SCHEMA.f_skill_call_summary F
 JOIN #DWH_TABLE_SCHEMA.d_skill D
 on D.row_key= F.skill_key
   JOIN #DWH_TABLE_SCHEMA.d_internal_contact d_inc
   	ON F.skill_key = d_inc.row_key
   JOIN #DWH_TABLE_SCHEMA.d_acd acd
  on acd.row_key= F.acd_key
 join (
   select d_calendar_date.*
   FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_day 
   	ON d_calendar_date.previous_day_key = prev_day.row_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_week 
   	ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month 
   	ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter 
   	ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year 
   	ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
) CAL_DATE
on F.day_key = CAL_DATE.row_key
join 
(
   select d_calendar_date.*
   FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
   WHERE d_calendar_date.month_start_date_key = d_calendar_date.row_key AND d_calendar_date.source_id = 0
) CAL_MONTH
on CAL_DATE.month_start_date_key = CAL_MONTH.row_key
JOIN 
(SELECT d_h_all_hierarchies.*
   FROM #DWH_TABLE_SCHEMA.d_h_all_hierarchies
  WHERE (d_h_all_hierarchies.hierarchy_class::text = 'SKILL'::text OR d_h_all_hierarchies.hierarchy_class::text = 'UNSPECIFIED'::text OR d_h_all_hierarchies.hierarchy_class::text = 'UNKNOWN'::text) AND d_h_all_hierarchies.current_flag = 'Y'::bpchar
) skill_hier
on skill_hier.lev_0_key = D.row_key
JOIN 
(
select d_skill.*
FROM #DWH_TABLE_SCHEMA.d_skill d_skill
) skill_lvl_1
on skill_lvl_1.row_key = skill_hier.lev_1_key
JOIN 
(
select d_skill.*
FROM #DWH_TABLE_SCHEMA.d_skill d_skill
) skill_lvl_2
on skill_lvl_2.row_key = skill_hier.lev_2_key
JOIN 
(
select d_skill.*
FROM #DWH_TABLE_SCHEMA.d_skill d_skill
) skill_lvl_3
on skill_lvl_3.row_key = skill_hier.lev_3_key
JOIN 
(
select d_skill.*
FROM #DWH_TABLE_SCHEMA.d_skill d_skill
) skill_lvl_4
on skill_lvl_4.row_key = skill_hier.lev_4_key
  
where CAL_MONTH.lagging_count_of_month between 0 and 12
and F.soft_deleted_flag ='N'
group by CAL_MONTH.month_id,CAL_MONTH.month_name_abbreviated,CAL_MONTH.year_name,D.row_key,D.name 
order by CAL_MONTH.month_id asc,CAL_MONTH.month_name_abbreviated,CAL_MONTH.year_name,D.row_key asc,D.name