select'ldb.f_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
union
select'ldb.d_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_request_item       a12
on (a11.request_item_key = a12.row_key)
union
select'ldb.d_request_item_variable_requested_completion_date_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_request_item_variable_requested_completion_date_c       a13
on (a11.request_item_key = a13.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_internal_contact       a14
on (a11.opened_by_key = a14.row_key)
union
select'ldb.d_master_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_master_item       a15
on (a11.catalog_item_key = a15.row_key)
union
select'ldb.d_internal_contact_requested_for_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_internal_contact_requested_for_c       a16
on (a11.requested_for_key = a16.row_key)
union
select'ldb.d_calendar_date_closed' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_calendar_date_closed       a17
on (a11.closed_on_key = a17.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_calendar_date       a18
on (a11.opened_on_key = a18.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_internal_contact_assigned_to       a19
on (a11.assigned_to_key = a19.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_internal_organization_group       a110
on (a11.assignment_group_key = a110.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
 join ldb.d_internal_contact       a14
on (a11.opened_by_key = a14.row_key)
join ldb.d_internal_contact_mdm       a111
on (a14.row_current_key = a111.row_current_key)
union
select'ldb.d_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_request       a112
on (a11.request_key = a112.row_key)
union
select'ldb.d_sc_req_item_approval' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_sc_req_item_approval       a113
on (a11.approval_state_src_key = a113.row_key)
union
select'ldb.d_request_item_stage' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_request_item_stage       a114
on (a11.stage_src_key = a114.row_key)
union
select'ldb.d_request_item_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_request_item_state       a115
on (a11.state_src_key = a115.row_key)
union
select'ldb.d_internal_contact_requested_for' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_internal_contact_requested_for       a116
on (a11.requested_for_key = a116.row_key)
union
select'ldb.d_internal_organization_department_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
 join ldb.d_internal_contact_requested_for_c       a16
on (a11.requested_for_key = a16.row_key)
join ldb.d_internal_organization_department_c       a117
on (a16.department_c_key = a117.row_key)
union
select'ldb.d_internal_contact_task_closed_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_internal_contact_task_closed_by       a118
on (a11.closed_by_key = a118.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
 join ldb.d_calendar_date       a18
on (a11.opened_on_key = a18.row_key)
join ldb.d_calendar_month       a119
on (a18.month_start_date_key = a119.row_key)
union
select'ldb.d_calendar_month_closed' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
 join ldb.d_calendar_date_closed       a17
on (a11.closed_on_key = a17.row_key)
join ldb.d_calendar_month_closed       a120
on (a17.month_start_date_key = a120.row_key)



