SELECT CAL_MONTH.month_name,acd.name,GRP.organization_name,
(sum(F.ACW_TIME)+sum(F.DA_ACW_TIME) / sum(F.ACD_CALLS)+sum(F.DA_ACD_CALLS)) Avg_ACW_Time
from DWH_TABLE_SCHEMA.f_skill_call_summary F
 JOIN DWH_TABLE_SCHEMA.d_skill D
 on D.row_key= F.skill_key
   JOIN DWH_TABLE_SCHEMA.d_internal_contact d_inc
   	ON F.skill_key = d_inc.row_key
 join DWH_TABLE_SCHEMA.d_location d_loc
 on d_loc.row_key = F.location_key
   LEFT JOIN DWH_TABLE_SCHEMA.d_geography d_geo 
   ON d_loc.geo_key = d_geo.row_key AND d_loc.source_id = d_geo.source_id
  JOIN DWH_TABLE_SCHEMA.d_acd acd
  on acd.row_key= F.acd_key
 JOIN DWH_TABLE_SCHEMA.d_cost_center CC
 on CC.row_key= F.cost_center_key
 join (
   select d_calendar_date.*
   FROM DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN DWH_TABLE_SCHEMA.d_calendar_date prev_day 
   	ON d_calendar_date.previous_day_key = prev_day.row_key
   LEFT JOIN DWH_TABLE_SCHEMA.d_calendar_date prev_week 
   	ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN DWH_TABLE_SCHEMA.d_calendar_date prev_month 
   	ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN DWH_TABLE_SCHEMA.d_calendar_date prev_quarter 
   	ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN DWH_TABLE_SCHEMA.d_calendar_date prev_year 
   	ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
) CAL_DATE
on F.day_key = CAL_DATE.row_key
join 
(
   select d_calendar_date.*
   FROM DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
   WHERE d_calendar_date.month_start_date_key = d_calendar_date.row_key AND d_calendar_date.source_id = 0
) CAL_MONTH
on CAL_DATE.month_start_date_key = CAL_MONTH.row_key
JOIN DWH_TABLE_SCHEMA.d_internal_organization GRP
 on GRP.row_key = F.group_lvl_key
 --and GRP.group_lvl_flag = 'Y'  
 AND GRP.current_flag = 'Y'
JOIN DWH_TABLE_SCHEMA.d_h_all_hierarchies d_h_all
on (d_h_all.row_key = F.group_lvl_key
  and d_h_all.hierarchy_class = 'SKILL' OR d_h_all.hierarchy_class = 'UNSPECIFIED' OR d_h_all.hierarchy_class = 'UNKNOWN'
  AND d_h_all.current_flag = 'Y')
where CAL_MONTH.lagging_count_of_month between 0 and 12
and F.soft_deleted_flag ='N'
group by CAL_MONTH.month_id,CAL_MONTH.month_name,acd.name,GRP.organization_name
order by CAL_MONTH.month_id desc,CAL_MONTH.month_name,acd.name,GRP.organization_name