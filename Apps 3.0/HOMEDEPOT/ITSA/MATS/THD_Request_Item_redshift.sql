select'ldb.f_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
left outer join ldb.d_internal_contact       a12
on (a11.opened_by_key=a12.row_key)
union
select'ldb.d_master_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
left outer join ldb.d_master_item       a13
on (a11.catalog_item_key=a13.row_key)
union
select'ldb.d_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
left outer join ldb.d_request_item       a14
on (a11.request_item_key=a14.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
left outer join ldb.d_calendar_date       a15
on (a11.opened_on_key=a15.row_key)
union
select'ldb.d_calendar_date_closed' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
left outer join ldb.d_calendar_date_closed       a16
on (a11.closed_on_key=a16.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
left outer join ldb.d_internal_contact_assigned_to       a17
on (a11.assigned_to_key=a17.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
left outer join ldb.d_internal_organization_group       a18
on (a11.assignment_group_key=a18.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
left outer join ldb.d_internal_organization_department       a19
on (a11.opened_by_department_key=a19.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11
 left outer join ldb.d_internal_contact       a12
on (a11.opened_by_key=a12.row_key)
left outer join ldb.d_internal_contact_mdm       a110
on (a12.row_current_key=a110.row_current_key)
union
select'ldb.d_hr_change_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
left outer join ldb.d_hr_change_category       a111
on (a11.hr_category_src_key=a111.row_key)
union
select'ldb.d_hr_change' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
left outer join ldb.d_hr_change       a112
on (a11.hr_change_key=a112.row_key)
union
select'ldb.d_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
left outer join ldb.d_request       a113
on (a11.request_key=a113.row_key)
union
select'ldb.d_sc_req_item_approval' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
left outer join ldb.d_sc_req_item_approval       a114
on (a11.approval_state_src_key=a114.row_key)
union
select'ldb.d_request_item_stage' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
left outer join ldb.d_request_item_stage       a115
on (a11.stage_src_key=a115.row_key)
union
select'ldb.d_request_item_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
left outer join ldb.d_request_item_state       a116
on (a11.state_src_key=a116.row_key)
union
select'ldb.d_internal_contact_requested_for' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
left outer join ldb.d_internal_contact_requested_for       a117
on (a11.requested_for_key=a117.row_key)
union
select'ldb.d_internal_contact_task_closed_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
left outer join ldb.d_internal_contact_task_closed_by       a118
on (a11.closed_by_key=a118.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11
 left outer join ldb.d_calendar_date       a15
on (a11.opened_on_key=a15.row_key)
left outer join ldb.d_calendar_month       a119
on (a15.month_start_date_key=a119.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
 left outer join ldb.d_calendar_date       a15
on (a11.opened_on_key=a15.row_key)
left outer join ldb.d_calendar_week       a120
on (a15.week_start_date_key=a120.row_key)
union
select'ldb.d_calendar_month_closed' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
 left outer join ldb.d_calendar_date_closed       a16
on (a11.closed_on_key=a16.row_key)
left outer join ldb.d_calendar_month_closed       a121
on (a16.month_start_date_key=a121.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
 left outer join ldb.d_calendar_date       a15
on (a11.opened_on_key=a15.row_key)
left outer join ldb.d_calendar_quarter       a122
on (a15.quarter_start_date_key=a122.row_key)


