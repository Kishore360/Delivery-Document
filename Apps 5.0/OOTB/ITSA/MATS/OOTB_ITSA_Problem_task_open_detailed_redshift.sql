select 'ldb.f_problem_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task       a11 
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_internal_contact       a12
on (a11.opened_by_key = a12.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_internal_contact_assigned_to       a13
on (a11.assigned_to_key = a13.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key = a14.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_calendar_date       a15
on (a11.opened_on_key = a15.row_key)
union
select'ldb.d_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_problem       a16
on (a11.problem_key = a16.row_key)
union
select'ldb.d_problem_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_problem_task       a17
on (a11.problem_task_key = a17.row_key)
union
select'ldb.d_application' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_application       a18
on (a11.application_key = a18.row_key)
union
select'ldb.d_business_service' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_business_service       a19
on (a11.business_service_key = a19.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_configuration_item       a110
on (a11.configuration_item_key = a110.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task       a11 
 join ldb.d_internal_contact       a12
on (a11.opened_by_key = a12.row_key)
join ldb.d_internal_contact_mdm       a111
on (a12.row_current_key = a111.row_current_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_location       a112
on (a11.location_key = a112.row_key)
union
select'ldb.d_problem_assignment_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_problem_assignment_group       a113
on (a11.problem_assignment_group_key = a113.row_key)
union
select'ldb.d_problem_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_problem_priority       a114
on (a11.problem_priority_src_key = a114.row_key)
union
select'ldb.d_problem_task_approval' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_problem_task_approval       a115
on (a11.approval_src_key = a115.row_key)
union
select'ldb.d_problem_task_reported_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_problem_task_reported_type       a116
on (a11.reported_type_src_key = a116.row_key)
union
select'ldb.d_problem_task_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_problem_task_impact       a117
on (a11.impact_src_key = a117.row_key)
union
select'ldb.d_problem_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_problem_task_priority       a118
on (a11.priority_src_key = a118.row_key)
union
select'ldb.d_problem_task_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_problem_task_state       a119
on (a11.state_src_key = a119.row_key)
union
select'ldb.d_problem_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_problem_task_urgency       a120
on (a11.urgency_src_key = a120.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task       a11
 join ldb.d_calendar_date       a15
on (a11.opened_on_key = a15.row_key)
join ldb.d_calendar_month       a121
on (a15.month_start_date_key = a121.row_key)
union
select'ldb.d_problem_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_problem_state       a122
on (a11.problem_state_src_key = a122.row_key)



