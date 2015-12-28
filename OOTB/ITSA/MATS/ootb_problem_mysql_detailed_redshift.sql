 select'f_problem' as Table_Name, count(a11.row_key) Row_Count
 from  gogo_mdwdb.f_problem             a11 
 WHERE a11.soft_deleted_flag = 'N'
 union
 select'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  gogo_mdwdb.f_problem             a11 
join (
   select d_calendar_date.row_key
    FROM gogo_mdwdb.d_calendar_date d_calendar_date
   LEFT JOIN gogo_mdwdb.d_calendar_date prev_day ON d_calendar_date.previous_day_key = prev_day.row_key
   LEFT JOIN gogo_mdwdb.d_calendar_date prev_week ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN gogo_mdwdb.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.period_start_date_key
   LEFT JOIN gogo_mdwdb.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN gogo_mdwdb.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
   
   )  a12
on (a11.opened_on_key = a12.row_key)
WHERE a11.soft_deleted_flag = 'N'
 union
select'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  gogo_mdwdb.f_problem             a11 
join (
   select d_calendar_date.row_key,d_calendar_date.month_start_date_key
    FROM gogo_mdwdb.d_calendar_date d_calendar_date
   LEFT JOIN gogo_mdwdb.d_calendar_date prev_day ON d_calendar_date.previous_day_key = prev_day.row_key
   LEFT JOIN gogo_mdwdb.d_calendar_date prev_week ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN gogo_mdwdb.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.period_start_date_key
   LEFT JOIN gogo_mdwdb.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN gogo_mdwdb.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
   
   )  a12
on (a11.opened_on_key = a12.row_key)
join (

select d_calendar_date.row_key
   FROM gogo_mdwdb.d_calendar_date d_calendar_date
   LEFT JOIN gogo_mdwdb.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN gogo_mdwdb.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN gogo_mdwdb.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
  WHERE d_calendar_date.month_start_date_key = d_calendar_date.row_key AND d_calendar_date.source_id = 0

)        a13
on (a12.month_start_date_key = a13.row_key)
WHERE a11.soft_deleted_flag = 'N'
 union
select'd_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  gogo_mdwdb.f_problem             a11 
join gogo_mdwdb.d_calendar_time         a14
on (a11.opened_time_key = a14.row_key)
WHERE a11.soft_deleted_flag = 'N'
 union
select'd_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  gogo_mdwdb.f_problem             a11 
join gogo_mdwdb.d_configuration_item         a15
on (a11.configuration_item_key = a15.row_key)
WHERE a11.soft_deleted_flag = 'N' 
union
select'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  gogo_mdwdb.f_problem             a11 
join gogo_mdwdb.d_internal_contact         a16
on (a11.opened_by_key = a16.row_key)
WHERE a11.soft_deleted_flag = 'N' 
union
select'd_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  gogo_mdwdb.f_problem             a11 
join gogo_mdwdb.d_internal_contact         a16
on (a11.opened_by_key = a16.row_key)
join (
 SELECT d_internal_contact.row_current_key
   FROM gogo_mdwdb.d_internal_contact
  WHERE d_internal_contact.current_flag = 'Y'
)        a17
on (a16.row_current_key = a17.row_current_key)
WHERE a11.soft_deleted_flag = 'N'
 union
select'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  gogo_mdwdb.f_problem             a11 
join (
 SELECT  d_internal_organization.row_key
   FROM gogo_mdwdb.d_internal_organization
  WHERE d_internal_organization.group_flag = 'Y' OR d_internal_organization.row_key = 0 OR d_internal_organization.row_key = -1
)  a18
on (a11.assignment_group_key = a18.row_key)
WHERE a11.soft_deleted_flag = 'N' 
union
select'd_problem' as Table_Name, count(a11.row_key) Row_Count
 from  gogo_mdwdb.f_problem             a11 
join gogo_mdwdb.d_problem         a19
on (a11.problem_key = a19.row_key)
WHERE a11.soft_deleted_flag = 'N' 
union
select'd_problem_state' as Table_Name, count(a11.row_key) Row_Count
 from  gogo_mdwdb.f_problem             a11 
join (
 SELECT lov.row_key
   FROM gogo_mdwdb.d_lov lov
   LEFT JOIN gogo_mdwdb.d_lov_map br ON lov.row_key = br.src_key
   JOIN gogo_mdwdb.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~PROBLEM' 
UNION ALL 
 SELECT lov.row_key
   FROM gogo_mdwdb.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0

)       a19
on (a11.state_src_key = a19.row_key)
WHERE a11.soft_deleted_flag = 'N' 
union
select'd_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  gogo_mdwdb.f_problem             a11 
join (
 SELECT lov.row_key
   FROM gogo_mdwdb.d_lov lov
  WHERE lov.dimension_class = 'CONTACT_TYPE~TASK'
UNION 
 SELECT lov.row_key
   FROM gogo_mdwdb.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0 

) a110
on (a11.reported_type_src_key= a110.row_key)
WHERE a11.soft_deleted_flag = 'N' 
union
select'd_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  gogo_mdwdb.f_problem             a11 
join (
 SELECT lov.row_key
   FROM gogo_mdwdb.d_lov lov
   LEFT JOIN gogo_mdwdb.d_lov_map br ON lov.row_key = br.src_key
   JOIN gogo_mdwdb.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class  = 'PRIORITY~TASK' 
UNION 
 SELECT lov.row_key
   FROM gogo_mdwdb.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
)       a111
on (a11.priority_src_key= a111.row_key)
WHERE a11.soft_deleted_flag = 'N' 
union
select'd_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  gogo_mdwdb.f_problem             a11 
join  (
 SELECT lov.row_key
   FROM gogo_mdwdb.d_lov lov
   LEFT JOIN gogo_mdwdb.d_lov_map br ON lov.row_key = br.src_key
   JOIN gogo_mdwdb.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class  = 'URGENCY~TASK' 
UNION 
 SELECT lov.row_key
   FROM gogo_mdwdb.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
)        a112
on (a11.urgency_src_key= a112.row_key)
WHERE a11.soft_deleted_flag = 'N' 
union
select'd_internal_contact_assign' as Table_Name, count(a11.row_key) Row_Count
 from  gogo_mdwdb.f_problem             a11 
join gogo_mdwdb.d_internal_contact         a113
on (a11.assigned_to_key = a113.row_key)
