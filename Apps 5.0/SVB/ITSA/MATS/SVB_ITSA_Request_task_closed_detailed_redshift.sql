select 'ldb.f_request_task_closed' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task_closed       a11 
union
select'ldb.d_master_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task_closed       a11 
join ldb.d_master_item       a12
on (a11.catalog_item_key=a12.row_key)
union
select'ldb.d_request_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task_closed       a11 
join ldb.d_request_task       a13
on (a11.request_task_key=a13.row_key)
union
select'ldb.d_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task_closed       a11 
join ldb.d_request       a14
on (a11.request_key=a14.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task_closed       a11 
join ldb.d_internal_contact       a15
on (a11.closed_by_key=a15.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task_closed       a11 
join ldb.d_calendar_date       a16
on (a11.closed_on_key=a16.row_key)
union
select'ldb.d_internal_contact_requested_for' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task_closed       a11 
join ldb.d_internal_contact_requested_for       a17
on (a11.requested_for_key=a17.row_key)
union
select'ldb.d_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task_closed       a11 
join ldb.d_request_item       a18
on (a11.request_item_key=a18.row_key)
union
select'ldb.d_request_task_application_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task_closed       a11 
join ldb.d_request_task_application_c       a19
on (a11.configuration_item_application_c_key=a19.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task_closed       a11 
join ldb.d_internal_contact_assigned_to       a110
on (a11.assigned_to_key=a110.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task_closed       a11 
join ldb.d_internal_organization_group       a111
on (a11.assignment_group_key=a111.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task_closed       a11
 join ldb.d_internal_contact       a15
on (a11.closed_by_key=a15.row_key)
join ldb.d_internal_contact_mdm       a112
on (a15.row_current_key=a112.row_current_key)
union
select'ldb.d_sc_task_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task_closed       a11 
join ldb.d_sc_task_impact       a113
on (a11.impact_src_key=a113.row_key)
union
select'ldb.d_sc_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task_closed       a11 
join ldb.d_sc_task_priority       a114
on (a11.priority_src_key=a114.row_key)
union
select'ldb.d_sc_task_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task_closed       a11 
join ldb.d_sc_task_state       a115
on (a11.state_src_key=a115.row_key)
union
select'ldb.d_sc_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task_closed       a11 
join ldb.d_sc_task_urgency       a116
on (a11.urgency_src_key=a116.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task_closed       a11 
 join ldb.d_calendar_date       a16
on (a11.closed_on_key=a16.row_key)
join ldb.d_calendar_month       a117
on (a16.month_start_date_key=a117.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task_closed       a11
 join ldb.d_calendar_date       a16
on (a11.closed_on_key=a16.row_key)
join ldb.d_calendar_week       a118
on (a16.week_start_date_key=a118.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task_closed       a11 
  join ldb.d_calendar_date       a16
on (a11.closed_on_key=a16.row_key)
join ldb.d_calendar_quarter       a121
on (a16.quarter_start_date_key=a121.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task_closed       a11 
  join ldb.d_calendar_date       a16
on (a11.closed_on_key=a16.row_key)
join ldb.d_calendar_year       a122
on (a16.year_start_date_key=a122.row_key)
union
select'ldb.d_internal_contact_requested_for_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task_closed       a11 
 join ldb.d_internal_contact_requested_for       a17
on (a11.requested_for_key=a17.row_key)
join ldb.d_internal_contact_requested_for_manager_c       a119
on (a17.manager_c_key=a119.row_key)
union
select'ldb.d_lov_request_task_contact_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task_closed       a11 
 join ldb.d_request_task       a13
on (a11.request_task_key=a13.row_key)
join ldb.d_lov_request_task_contact_type_c       a120
on (a13.contact_type_src_c_key=a120.row_key)



