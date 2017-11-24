select 'ldb.f_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
left outer join ldb.d_calendar_date       a12
on (a11.opened_on_key = a12.row_key)
union
select'ldb.d_calendar_date_closed' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
left outer join ldb.d_calendar_date_closed       a12
on (a11.closed_on_key = a12.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
left outer join ldb.d_calendar_date       a12
on (a11.opened_on_key = a12.row_key)
left outer join ldb.d_calendar_month       a13
on (a12.month_start_date_key = a13.row_key)
union
select'ldb.d_calendar_month_closed' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
left outer join ldb.d_calendar_date       a12
on (a11.closed_on_key = a12.row_key)
left outer join ldb.d_calendar_month_closed       a13
on (a12.month_start_date_key = a13.row_key)
union
select'ldb.d_request_item_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
left outer join ldb.d_request_item_state       a14
on (a11.state_src_key = a14.row_key)
union
select'ldb.d_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
left outer join ldb.d_request_item       a15
on (a11.request_item_key = a15.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
left outer join ldb.d_calendar_date       a12
on (a11.opened_on_key = a12.row_key)
left outer join ldb.d_calendar_week       a17
on (a12.week_start_date_key = a17.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
left outer join ldb.d_calendar_date       a12
on (a11.opened_on_key = a12.row_key)
left outer join ldb.d_calendar_quarter       a17
on (a12.quarter_start_date_key = a17.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
left outer join ldb.d_internal_contact_assigned_to       a16
on (a11.assigned_to_key = a16.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
left outer join ldb.d_internal_organization_department       a16
on (a11.opened_by_department_key = a16.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
left outer join ldb.d_internal_contact       a16
on (a11.opened_by_key = a16.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
 left outer join ldb.d_internal_contact       a16
on (a11.opened_by_key = a16.row_key)
left outer join ldb.d_internal_contact_mdm       a17
on (a16.row_current_key = a17.row_current_key)
union
select'ldb.d_master_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
left outer join ldb.d_master_item       a16
on (a11.catalog_item_key = a16.row_key)
