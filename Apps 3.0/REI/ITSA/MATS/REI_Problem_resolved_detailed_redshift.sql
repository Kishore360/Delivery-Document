select'ldb.f_problem_resolved' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_resolved       a11 
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_resolved       a11 
join ldb.d_calendar_date       a12
on (a11.opened_on_key = a12.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_resolved       a11 
join ldb.d_internal_contact       a13
on (a11.opened_by_key = a13.row_key)
union
select'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_resolved       a11 
join ldb.d_calendar_time       a14
on (a11.opened_time_key = a14.row_key)
union
select'ldb.d_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_resolved       a11 
join ldb.d_problem       a15
on (a11.problem_key = a15.row_key)
union
select'ldb.d_problem_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_resolved       a11 
join ldb.d_problem_state       a16
on (a11.state_src_key = a16.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_resolved       a11 
join ldb.d_internal_contact_assigned_to       a17
on (a11.assigned_to_key = a17.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_resolved       a11 
join ldb.d_internal_organization_group       a18
on (a11.assignment_group_key = a18.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_resolved       a11 
join ldb.d_configuration_item       a19
on (a11.configuration_item_key = a19.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_resolved       a11 
 join ldb.d_internal_contact       a13
on (a11.opened_by_key = a13.row_key)
join ldb.d_internal_contact_mdm       a110
on (a13.row_current_key = a110.row_current_key)
union
select'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_resolved       a11 
 join ldb.d_calendar_time       a14
on (a11.opened_time_key = a14.row_key)
join ldb.d_calendar_time_hour       a111
on (a14.hour_24_format_num = a111.hour_24_format_num)
union
select'ldb.d_problem_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_resolved       a11 
join ldb.d_problem_priority       a112
on (a11.priority_src_key = a112.row_key)
union
select'ldb.d_problem_reported_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_resolved       a11 
join ldb.d_problem_reported_type       a113
on (a11.reported_type_src_key = a113.row_key)
union
select'ldb.d_problem_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_resolved       a11 
join ldb.d_problem_urgency       a114
on (a11.urgency_src_key = a114.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_resolved       a11
 join ldb.d_calendar_date       a12
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_month       a115
on (a12.month_start_date_key = a115.row_key)


