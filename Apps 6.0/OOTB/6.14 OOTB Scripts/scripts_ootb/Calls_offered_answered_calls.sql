SELECT concat(concat(CAL_MONTH.month_name_abbreviated,' '), CAL_MONTH.year_name),D.name Skill,sum(F.calls_offered) calls_offered,
round(case when sum (F.calls_offered)=0 then NULL else sum(F.acd_calls)*1.00/sum (F.calls_offered) end)Answered_calls_offered,
round((case when sum(F.calls_offered)=0 then 0 else sum(F.abandoned_calls)*100.0/sum(F.Calls_Offered) end),1) Abandoned_calls_offered
from #DWH_TABLE_SCHEMA.f_skill_call_summary F
 JOIN #DWH_TABLE_SCHEMA.d_skill D
 on D.row_key= F.skill_key
   JOIN #DWH_TABLE_SCHEMA.d_internal_contact d_inc
   	ON F.skill_key = d_inc.row_key
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
 JOIN #DWH_TABLE_SCHEMA.d_shift SF
 on SF.row_key = F.shift_key
where CAL_MONTH.lagging_count_of_month between 0 and 12
and F.soft_deleted_flag ='N' 
group by cal_month.month_id,cal_month.month_name_abbreviated,D.name,cal_month.year_name,D.row_key
order by cal_month.month_id asc,cal_month.month_name_abbreviated,cal_month.year_name,D.row_key asc,D.name