 select'f_problem_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
 union
  select'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
join ldb.d_calendar_date         a17
on (a11.opened_on_key = a17.row_key)
 union
  select'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
 join	ldb.d_calendar_date	a17
on 	(a11.opened_on_key = a17.row_key)
join ldb.d_calendar_month         a13
on (a17.month_start_date_key = a13.row_key)
 union
  select'd_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
  join	ldb.d_calendar_date	a17
on 	(a11.opened_on_key = a17.row_key)
join ldb.d_calendar_month         a13
on (a17.quarter_start_date_key = a13.row_key)
union
  select'd_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
join	ldb.d_calendar_time	a13
	 on 	(a11.opened_time_key = a13.row_key)
union
  select'd_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 	 
	join	ldb.d_calendar_time	a13
	 on 	(a11.opened_time_key = a13.row_key)  
	 join	ldb.d_calendar_time_hour	a112
	 on 	(a13.hour_24_format_num = a112.hour_24_format_num)
	 union
	 select'd_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 	 
	 
		join	ldb.d_calendar_date	a17
	 on 	(a11.opened_on_key = a17.row_key) 
	 	join	ldb.d_calendar_week	a18
	 on 	(a17.week_start_date_key = a18.row_key)
	 union
	   select'd_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
		join	ldb.d_calendar_date	a17
	 on 	(a11.opened_on_key = a17.row_key)  
	 
	 	join	ldb.d_calendar_year	a122
	 on 	(a17.year_start_date_key = a122.row_key)
	 union
	   select'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
 join	ldb.d_internal_contact	a12
	 on 	(a11.opened_by_key = a12.row_key)
	 union
	   select'd_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
 join	ldb.d_internal_contact_assigned_to	a14
	 on 	(a11.assigned_to_key = a14.row_key)
	 
	 union
	   select'd_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
	 	join	ldb.d_internal_contact	a12
	 on 	(a11.opened_by_key = a12.row_key)
	 join	ldb.d_internal_contact_mdm	a111
	 on 	(a12.row_current_key = a111.row_current_key)
	 
	 
 union
	   select'd_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 	 
	 join	ldb.d_internal_organization_department	a110
	 on 	(a11.opened_by_department_key = a110.row_key)
	 
	 	  
 union
	   select'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
 
 join	ldb.d_internal_organization_group	a15
	 on 	(a11.assignment_group_key = a15.row_key)
	 
	 
	  union
	   select'd_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
 	join	ldb.d_internal_contact_assigned_to	a14
	 on 	(a11.assigned_to_key = a14.row_key)
 
 join	ldb.d_location_assigned_to	a118
	 on 	(a14.location_key = a118.row_key)
	 
	 
	    union
	   select'd_problem_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
 
 	join	ldb.d_problem_task	a19
	 on 	(a11.problem_task_key = a19.row_key)
	 
	    union
	   select'd_problem_task_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
 join	ldb.d_problem_task_impact	a113
	 on 	(a11.impact_src_key = a113.row_key)
	   union
	   select'd_problem_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11  
	 
	 join	ldb.d_problem_task_priority	a114
	 on 	(a11.priority_src_key = a114.row_key)
	 
	 union
	   select'd_problem_task_reported_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11
join	ldb.d_problem_task_reported_type	a115
	 on 	(a11.reported_type_src_key = a115.row_key) 
	 	  union
	   select'd_problem_task_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11
 join	ldb.d_problem_task_state	a116
	 on 	(a11.state_src_key = a116.row_key)
	 union
	   select'd_problem_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11  
	 
	 join	ldb.d_problem_task_urgency	a117
	 on 	(a11.urgency_src_key = a117.row_key)
	 
	 union
	   select'dh_user_group_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11  
	 join	ldb.d_internal_organization_group	a15
	 on 	(a11.assignment_group_key = a15.row_key)
	 	join	ldb.dh_user_group_hierarchy	a16
	 on 	(a15.row_dn_key = a16.lev_0_key)
	   union
	   select'dh_user_group_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
	 join	ldb.d_internal_organization_group	a15
	 on 	(a11.assignment_group_key = a15.row_key)
	join	ldb.dh_user_group_hierarchy	a16
	 on 	(a15.row_dn_key = a16.lev_0_key)
	 
	 	join	ldb.dh_user_group_level1	a119
	 on 	(a16.lev_1_key = a119.row_key);