select 'ldb.f_change_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task       a11 
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task       a11 
join ldb.d_internal_contact       a12
on (a11.opened_by_key = a12.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task       a11 
join ldb.d_internal_contact_assigned_to       a13
on (a11.assigned_to_key = a13.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task       a11 
join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key = a14.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task       a11 
join ldb.d_calendar_date       a15
on (a11.opened_on_key = a15.row_key)
union
select'ldb.d_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task       a11 
join ldb.d_change_request       a16
on (a11.change_request_key = a16.row_key)
union
select'ldb.d_change_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task       a11 
join ldb.d_change_task       a17
on (a11.change_task_key = a17.row_key)
union
select'ldb.d_application' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task       a11 
join ldb.d_application       a18
on (a11.application_key = a18.row_key)
union
select'ldb.d_business_service' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task       a11 
join ldb.d_business_service       a19
on (a11.business_service_key = a19.row_key)
union
select'ldb.d_change_request_assignment_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task       a11 
join ldb.d_change_request_assignment_group       a110
on (a11.parent_assignment_group_key = a110.row_key)
union
select'ldb.d_change_request_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task       a11 
join ldb.d_change_request_priority       a111
on (a11.parent_priority_src_key = a111.row_key)
union
select'ldb.d_change_request_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task       a11 
join ldb.d_change_request_state       a112
on (a11.parent_state_src_key = a112.row_key)
union
select'ldb.d_change_request_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task       a11 
join ldb.d_change_request_type       a113
on (a11.parent_type_src_key = a113.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task       a11 
join ldb.d_configuration_item       a114
on (a11.configuration_item_key = a114.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task       a11
 join ldb.d_internal_contact       a12
on (a11.opened_by_key = a12.row_key)
join ldb.d_internal_contact_mdm       a115
on (a12.row_current_key = a115.row_current_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task       a11 
join ldb.d_location       a116
on (a11.location_key = a116.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task       a11 
 join ldb.d_calendar_date       a15
on (a11.opened_on_key = a15.row_key)
join ldb.d_calendar_month       a117
on (a15.month_start_date_key = a117.row_key)
union
select'ldb.d_change_request_close_code' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task       a11 
 join ldb.d_change_request       a16
on (a11.change_request_key = a16.row_key)
join ldb.d_change_request_close_code       a118
on (a16.close_code_src_key = a118.row_key)
union
select'ldb.d_change_request_phase' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task       a11
 join ldb.d_change_request       a16
on (a11.change_request_key = a16.row_key)
join ldb.d_change_request_phase       a119
on (a16.phase_src_key = a119.row_key)
union
select'ldb.d_change_request_phase_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task       a11 
 join ldb.d_change_request       a16
on (a11.change_request_key = a16.row_key)
join ldb.d_change_request_phase_state       a120
on (a16.phase_state_src_key = a120.row_key)
union
select'ldb.d_change_task_approval' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task       a11 
 join ldb.d_change_task       a17
on (a11.change_task_key = a17.row_key)
join ldb.d_change_task_approval       a121
on (a17.approval_src_key = a121.row_key)
union
select'ldb.d_change_task_reported_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task       a11 
 join ldb.d_change_task       a17
on (a11.change_task_key = a17.row_key)
join ldb.d_change_task_reported_type       a122
on (a17.reported_type_src_key = a122.row_key)
union
select'ldb.d_change_task_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task       a11 
 join ldb.d_change_task       a17
on (a11.change_task_key = a17.row_key)
join ldb.d_change_task_impact       a123
on (a17.impact_src_key = a123.row_key)
union
select'ldb.d_change_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task       a11 
 join ldb.d_change_task       a17
on (a11.change_task_key = a17.row_key)
join ldb.d_change_task_priority       a124
on (a17.priority_src_key = a124.row_key)
union
select'ldb.d_change_task_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task       a11 
 join ldb.d_change_task       a17
on (a11.change_task_key = a17.row_key)
join ldb.d_change_task_state       a125
on (a17.state_src_key = a125.row_key)
union
select'ldb.d_change_task_task_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task       a11 
 join ldb.d_change_task       a17
on (a11.change_task_key = a17.row_key)
join ldb.d_change_task_task_type       a126
on (a17.task_type_src_key = a126.row_key)
union
select'ldb.d_change_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task       a11 
 join ldb.d_change_task       a17
on (a11.change_task_key = a17.row_key)
join ldb.d_change_task_urgency       a127
on (a17.urgency_src_key = a127.row_key)




