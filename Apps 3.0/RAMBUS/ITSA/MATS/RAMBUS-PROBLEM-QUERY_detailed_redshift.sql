select'ldb.f_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_internal_contact       a12
on (a11.opened_by_key = a12.row_key)
union
select'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_calendar_time       a13
on (a11.opened_time_key = a13.row_key)
union
select'ldb.d_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_problem       a14
on (a11.problem_key = a14.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_internal_contact       a15
on (a11.assigned_to_key = a15.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_internal_organization_group       a16
on (a11.assignment_group_key = a16.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_configuration_item       a17
on (a11.business_service_c_key = a17.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_configuration_item       a18
on (a11.configuration_item_key = a18.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_calendar_date       a19
on (a11.opened_on_key = a19.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
 join ldb.d_internal_contact       a12
on (a11.opened_by_key = a12.row_key)
join ldb.d_internal_contact_mdm       a110
on (a12.row_current_key = a110.row_current_key)
union
select'ldb.d_problem_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_problem_category       a111
on (a11.category_src_key = a111.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_internal_contact       a112
on (a11.problem_manager_c_key = a112.row_key)
union
select'ldb.d_problem_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_problem_state       a113
on (a11.state_src_key = a113.row_key)
union
select'ldb.d_problem_subcategory' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_problem_subcategory       a114
on (a11.sub_category_src_key = a114.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_internal_contact       a115
on (a11.requestor_c_key = a115.row_key)
union
select'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_task_priority       a116
on (a11.priority_src_key = a116.row_key)
union
select'ldb.d_problem_reported_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_problem_reported_type       a117
on (a11.reported_type_src_key = a117.row_key)
union
select'ldb.d_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_task_urgency       a118
on (a11.urgency_src_key = a118.row_key)
