select 'ldb.f_request_item_keyword' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword       a11 
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword       a11 
join ldb.d_internal_contact       a12
on (a11.employee_key=a12.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword       a11 
join ldb.d_internal_contact_assigned_to       a13
on (a11.assigned_to_key=a13.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword       a11 
join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key=a14.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword       a11 
join ldb.d_calendar_date       a15
on (a11.date_key=a15.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword       a11 
 join ldb.d_calendar_date       a15
on (a11.date_key=a15.row_key)
join ldb.d_calendar_month       a16
on (a15.month_start_date_key=a16.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword       a11 
  join ldb.d_calendar_date       a15
on (a11.date_key=a15.row_key)
join ldb.d_calendar_month       a16
on (a15.month_start_date_key=a16.row_key)
join ldb.d_calendar_quarter       a17
on (a16.quarter_start_date_key=a17.row_key)
union
select'ldb.d_master_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword       a11 
join ldb.d_master_item       a18
on (a11.catalog_item_key=a18.row_key)
union
select'ldb.d_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword       a11 
join ldb.d_request_item       a19
on (a11.request_item_key=a19.row_key)
union
select'ldb.d_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword       a11 
join ldb.d_request       a110
on (a11.request_key=a110.row_key)
union
select'ldb.d_internal_contact_task_closed_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword       a11 
join ldb.d_internal_contact_task_closed_by       a111
on (a11.closed_by_key=a111.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key=a12.row_key)
join ldb.d_internal_contact_mdm       a112
on (a12.employee_mdm_key=a112.row_key)
union
select'ldb.d_sc_req_item_approval' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword       a11 
join ldb.d_sc_req_item_approval       a113
on (a11.request_item_approval_state_src_key=a113.row_key)
union
select'ldb.d_request_item_stage' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword       a11 
join ldb.d_request_item_stage       a114
on (a11.request_item_stage_src_key=a114.row_key)
union
select'ldb.d_request_item_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword       a11 
join ldb.d_request_item_state       a115
on (a11.request_item_state_src_key=a115.row_key)
union
select'ldb.d_internal_contact_requested_for' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword       a11 
join ldb.d_internal_contact_requested_for       a116
on (a11.requested_for_key=a116.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword       a11 
 join ldb.d_calendar_date       a15
on (a11.date_key=a15.row_key)
join ldb.d_calendar_week       a117
on (a15.week_start_date_key=a117.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword       a11 
   join ldb.d_calendar_date       a15
on (a11.date_key=a15.row_key)
join ldb.d_calendar_month       a16
on (a15.month_start_date_key=a16.row_key)
join ldb.d_calendar_quarter       a17
on (a16.quarter_start_date_key=a17.row_key)
join ldb.d_calendar_year       a118
on (a17.year_start_date_key=a118.row_key);


