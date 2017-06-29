select 'ldb.f_request_item_closed' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
union
select'ldb.d_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_request       a12
on (a11.request_key=a12.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_internal_contact       a13
on (a11.closed_by_key=a13.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_calendar_date       a14
on (a11.closed_on_key=a14.row_key)
union
select'ldb.d_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_request_item       a15
on (a11.request_item_key=a15.row_key)
union
select'ldb.d_request_item_variable_server_rc_number_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_request_item_variable_server_rc_number_c       a16
on (a11.request_item_key=a16.row_key)
union
select'ldb.d_master_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_master_item       a17
on (a11.catalog_item_key=a17.row_key)
union
select'ldb.d_internal_contact_requested_for' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_internal_contact_requested_for       a18
on (a11.requested_for_key=a18.row_key)
union
select'ldb.d_request_item_variable_project_number_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_request_item_variable_project_number_c       a19
on (a11.request_item_key=a19.row_key)
union
select'ldb.d_request_item_approval_state_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_request_item_approval_state_c       a110
on (a11.approval_state_c_key=a110.row_key)
union
select'ldb.d_internal_contact_approver_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_internal_contact_approver_c       a111
on (a11.approver_c_key=a111.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_internal_contact_assigned_to       a112
on (a11.assigned_to_key=a112.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_internal_organization_group       a113
on (a11.assignment_group_key=a113.row_key)
union
select'ldb.d_internal_contact_variable_user_budget_owner_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_internal_contact_variable_user_budget_owner_c       a114
on (a11.user_budget_owner_c_key=a114.row_key)
union
select'ldb.d_request_item_contact_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_request_item_contact_type_c       a115
on (a11.contact_type_c_key=a115.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
 join ldb.d_internal_contact       a13
on (a11.closed_by_key=a13.row_key)
join ldb.d_internal_contact_mdm       a116
on (a13.row_current_key=a116.row_current_key)
union
select'ldb.d_internal_contact_variable_user_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_internal_contact_variable_user_manager_c       a117
on (a11.user_manager_c_key=a117.row_key)
union
select'ldb.d_sc_req_item_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_sc_req_item_impact       a118
on (a11.impact_src_key=a118.row_key)
union
select'ldb.d_sc_req_item_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_sc_req_item_priority       a119
on (a11.priority_src_key=a119.row_key)
union
select'ldb.d_request_item_stage' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_request_item_stage       a120
on (a11.stage_src_key=a120.row_key)
union
select'ldb.d_request_item_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_request_item_state       a121
on (a11.state_src_key=a121.row_key)
union
select'ldb.d_sc_req_item_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_sc_req_item_urgency       a122
on (a11.urgency_src_key=a122.row_key)
union
select'ldb.d_calendar_date_requested_date_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_calendar_date_requested_date_c       a123
on (a11.user_requested_on_c_key=a123.row_key)
union
select'ldb.d_internal_contact_variable_requested_for_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_internal_contact_variable_requested_for_c       a124
on (a11.requested_for_c_key=a124.row_key)
union
select'ldb.d_internal_contact_task_closed_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_internal_contact_task_closed_by       a125
on (a11.closed_by_key=a125.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
 join ldb.d_calendar_date       a14
on (a11.closed_on_key=a14.row_key)
join ldb.d_calendar_month       a126
on (a14.month_start_date_key=a126.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
 join ldb.d_calendar_date       a14
on (a11.closed_on_key=a14.row_key)
join ldb.d_calendar_week       a127
on (a14.week_start_date_key=a127.row_key)
union
select'ldb.d_internal_contact_requested_for_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
 join ldb.d_internal_contact_requested_for       a18
on (a11.requested_for_key=a18.row_key)
join ldb.d_internal_contact_requested_for_manager_c       a128
on (a18.manager_c_key=a128.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11
 join ldb.d_calendar_date       a14
on (a11.closed_on_key=a14.row_key)
join ldb.d_calendar_quarter       a129
on (a14.quarter_start_date_key=a129.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
 join ldb.d_calendar_date       a14
on (a11.closed_on_key=a14.row_key)
join ldb.d_calendar_year       a130
on (a14.year_start_date_key=a130.row_key)


