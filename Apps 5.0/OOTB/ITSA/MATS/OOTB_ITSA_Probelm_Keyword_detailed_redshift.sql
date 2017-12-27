select 'ldb.f_problem_keyword' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_keyword       a11 
union
select'ldb.d_internal_contact' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_keyword       a11 
join ldb.d_internal_contact       a12
on (a11.opened_by_key = a12.row_key)
union
select'ldb.d_calendar_time' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_keyword       a11 
join ldb.d_calendar_time       a13
on (a11.opened_time_key = a13.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_keyword       a11 
join ldb.d_internal_contact_assigned_to       a14
on (a11.assigned_to_key = a14.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_keyword       a11 
join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key = a15.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_keyword       a11 
join ldb.d_calendar_date       a16
on (a11.opened_on_key = a16.row_key)
union
select'ldb.d_problem' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_keyword       a11 
join ldb.d_problem       a17
on (a11.problem_key = a17.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_keyword       a11 
join ldb.d_configuration_item       a18
on (a11.configuration_item_key = a18.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_keyword       a11 
 join ldb.d_internal_contact       a12
on (a11.opened_by_key = a12.row_key)
join ldb.d_internal_contact_mdm       a19
on (a12.row_current_key = a19.row_current_key)
union
select'ldb.d_calendar_time_hour' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_keyword       a11
 join ldb.d_calendar_time       a13
on (a11.opened_time_key = a13.row_key)
join ldb.d_calendar_time_hour       a110
on (a13.hour_24_format_num = a110.hour_24_format_num)
union
select'ldb.d_problem_reported_type' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_keyword       a11 
join ldb.d_problem_reported_type       a111
on (a11.reported_type_src_key = a111.row_key)
union
select'ldb.d_problem_priority' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_keyword       a11 
join ldb.d_problem_priority       a112
on (a11.priority_src_key = a112.row_key)
union
select'ldb.d_problem_urgency' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_keyword       a11 
join ldb.d_problem_urgency       a113
on (a11.urgency_src_key = a113.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_keyword       a11
 join ldb.d_calendar_date       a16
on (a11.opened_on_key = a16.row_key)
join ldb.d_calendar_month       a114
on (a16.month_start_date_key = a114.row_key)
union
select'ldb.d_problem_state' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_keyword       a11 
join ldb.d_problem_state       a115
on (a11.state_src_key = a115.row_key)


