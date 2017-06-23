select 'ldb.f_request_item_closed_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed_c       a11 
union
select'ldb.d_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed_c       a11 
join ldb.d_request       a12
on (a11.request_key=a12.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed_c       a11 
join ldb.d_internal_contact       a13
on (a11.closed_by_key=a13.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed_c       a11 
join ldb.d_calendar_date       a14
on (a11.closed_on_key=a14.row_key)
union
select'ldb.d_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed_c       a11 
join ldb.d_request_item       a15
on (a11.request_item_key=a15.row_key)
union
select'ldb.d_master_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed_c       a11 
join ldb.d_master_item       a16
on (a11.catalog_item_key=a16.row_key)
union
select'ldb.d_internal_contact_requested_for' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed_c       a11 
join ldb.d_internal_contact_requested_for       a17
on (a11.requested_for_key=a17.row_key)
union
select'ldb.d_request_item_approval_state_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed_c       a11 
join ldb.d_request_item_approval_state_c       a18
on (a11.approval_state_c_key=a18.row_key)
union
select'ldb.d_internal_contact_approver_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed_c       a11 
join ldb.d_internal_contact_approver_c       a19
on (a11.approver_c_key=a19.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed_c       a11 
join ldb.d_internal_contact_assigned_to       a110
on (a11.assigned_to_key=a110.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed_c       a11 
join ldb.d_internal_organization_group       a111
on (a11.assignment_group_key=a111.row_key)
union
select'ldb.d_request_item_contact_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed_c       a11 
join ldb.d_request_item_contact_type_c       a112
on (a11.contact_type_c_key=a112.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed_c       a11
 join ldb.d_internal_contact       a13
on (a11.closed_by_key=a13.row_key)
join ldb.d_internal_contact_mdm       a113
on (a13.row_current_key=a113.row_current_key)
union
select'ldb.d_sc_req_item_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed_c       a11 
join ldb.d_sc_req_item_impact       a114
on (a11.impact_src_key=a114.row_key)
union
select'ldb.d_sc_req_item_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed_c       a11 
join ldb.d_sc_req_item_priority       a115
on (a11.priority_src_key=a115.row_key)
union
select'ldb.d_request_item_stage' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed_c       a11 
join ldb.d_request_item_stage       a116
on (a11.stage_src_key=a116.row_key)
union
select'ldb.d_request_item_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed_c       a11 
join ldb.d_request_item_state       a117
on (a11.state_src_key=a117.row_key)
union
select'ldb.d_sc_req_item_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed_c       a11 
join ldb.d_sc_req_item_urgency       a118
on (a11.urgency_src_key=a118.row_key)
union
select'ldb.d_internal_contact_task_closed_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed_c       a11 
join ldb.d_internal_contact_task_closed_by       a119
on (a11.closed_by_key=a119.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed_c       a11
 join ldb.d_calendar_date       a14
on (a11.closed_on_key=a14.row_key)
join ldb.d_calendar_month       a120
on (a14.month_start_date_key=a120.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed_c       a11 
 join ldb.d_calendar_date       a14
on (a11.closed_on_key=a14.row_key)
join ldb.d_calendar_week       a121
on (a14.week_start_date_key=a121.row_key)
union
select'ldb.d_internal_contact_requested_for_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed_c       a11 
 join ldb.d_internal_contact_requested_for       a17
on (a11.requested_for_key=a17.row_key)
join ldb.d_internal_contact_requested_for_manager_c       a122
on (a17.manager_c_key=a122.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed_c       a11
 join ldb.d_calendar_date       a14
on (a11.closed_on_key=a14.row_key)
join ldb.d_calendar_quarter       a123
on (a14.quarter_start_date_key=a123.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed_c       a11 
 join ldb.d_calendar_date       a14
on (a11.closed_on_key=a14.row_key)
join ldb.d_calendar_year       a124
on (a14.year_start_date_key=a124.row_key)

