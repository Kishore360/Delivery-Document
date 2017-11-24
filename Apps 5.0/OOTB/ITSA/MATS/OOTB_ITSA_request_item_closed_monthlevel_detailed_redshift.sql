select 'ldb.f_request_item_closed' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_calendar_date       a12
on (a11.closed_on_key = a12.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_internal_contact       a13
on (a11.closed_by_key = a13.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key = a14.row_key)
union
select'ldb.d_master_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_master_item       a15
on (a11.catalog_item_key = a15.row_key)
union
select'ldb.d_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_request_item       a16
on (a11.request_item_key = a16.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_internal_contact_assigned_to       a17
on (a11.assigned_to_key = a17.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11
 join ldb.d_calendar_date       a12
on (a11.closed_on_key = a12.row_key)
join ldb.d_calendar_month       a18
on (a12.month_start_date_key = a18.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
 join ldb.d_calendar_date       a12
on (a11.closed_on_key = a12.row_key)
join ldb.d_calendar_week       a19
on (a12.week_start_date_key = a19.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_configuration_item       a110
on (a11.configuration_item_key = a110.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_internal_organization_department       a111
on (a11.opened_by_department_key = a111.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
 join ldb.d_internal_contact       a13
on (a11.closed_by_key = a13.row_key)
join ldb.d_internal_contact_mdm       a112
on (a13.row_current_key = a112.row_current_key)
union
select'ldb.d_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_request       a113
on (a11.request_key = a113.row_key)
union
select'ldb.d_sc_req_item_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_sc_req_item_priority       a114
on (a11.priority_src_key = a114.row_key)
union
select'ldb.d_request_item_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11 
join ldb.d_request_item_state       a115
on (a11.state_src_key = a115.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11
 join ldb.d_calendar_date       a12
on (a11.closed_on_key = a12.row_key)
join ldb.d_calendar_quarter       a116
on (a12.quarter_start_date_key = a116.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_closed       a11
 join ldb.d_calendar_date       a12
on (a11.closed_on_key = a12.row_key)
join ldb.d_calendar_year       a117
on (a12.year_start_date_key = a117.row_key)



