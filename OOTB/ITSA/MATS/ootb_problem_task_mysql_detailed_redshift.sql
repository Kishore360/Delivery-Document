 select'f_problem_task' as Table_Name, count(a11.row_key) Row_Count
 from  gogo_mdwdb.f_problem_task             a11 
  WHERE a11.soft_deleted_flag = 'N'
 union
 select'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  gogo_mdwdb.f_problem_task             a11 
join (
   select d_calendar_date.row_key
    FROM gogo_mdwdb.d_calendar_date d_calendar_date
   LEFT JOIN gogo_mdwdb.d_calendar_date prev_day ON d_calendar_date.previous_day_key = prev_day.row_key
   LEFT JOIN gogo_mdwdb.d_calendar_date prev_week ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN gogo_mdwdb.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.period_start_date_key
   LEFT JOIN gogo_mdwdb.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN gogo_mdwdb.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
   
   ) a12
on (a11.opened_on_key = a12.row_key)
 WHERE a11.soft_deleted_flag = 'N'
union
select'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  gogo_mdwdb.f_problem_task             a11 
join (
   select d_calendar_date.row_key,d_calendar_date.month_start_date_key
    FROM gogo_mdwdb.d_calendar_date d_calendar_date
   LEFT JOIN gogo_mdwdb.d_calendar_date prev_day ON d_calendar_date.previous_day_key = prev_day.row_key
   LEFT JOIN gogo_mdwdb.d_calendar_date prev_week ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN gogo_mdwdb.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.period_start_date_key
   LEFT JOIN gogo_mdwdb.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN gogo_mdwdb.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
   
   ) a12
on (a11.opened_on_key = a12.row_key)
join (

select d_calendar_date.row_key
   FROM gogo_mdwdb.d_calendar_date d_calendar_date
   LEFT JOIN gogo_mdwdb.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN gogo_mdwdb.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN gogo_mdwdb.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
  WHERE d_calendar_date.month_start_date_key = d_calendar_date.row_key AND d_calendar_date.source_id = 0

) a13
on (a12.month_start_date_key = a13.row_key)
 WHERE a11.soft_deleted_flag = 'N'
union
select'd_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  gogo_mdwdb.f_problem_task             a11 
join (
 SELECT lov.row_key
   FROM gogo_mdwdb.d_lov lov
  WHERE lov.dimension_class = 'CONTACT_TYPE~TASK'
UNION 
 SELECT lov.row_key
   FROM gogo_mdwdb.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0 

) a14
on (a11.reported_type_src_key= a14.row_key)
 WHERE a11.soft_deleted_flag = 'N'
