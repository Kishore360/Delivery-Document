select 'ldb.f_change_request_closed' as Table_Name, count(1) Row_Count
 from  ldb.f_change_request_closed       a11 
union
select'ldb.d_calendar_date' as Table_Name, count(1) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_calendar_date       a12
on (a11.closed_on_key = a12.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(1) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_calendar_date       a12
on (a11.closed_on_key = a12.row_key)
join ldb.d_calendar_month       a13
on (a12.month_start_date_key = a13.row_key)
union
select'ldb.d_change_request_state' as Table_Name, count(1) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_state       a14
on (a11.state_src_key = a14.row_key)
union
select'ldb.d_change_request' as Table_Name, count(1) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request       a15
on (a11.change_request_key = a15.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(1) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_calendar_date       a12
on (a11.closed_on_key = a12.row_key)
join ldb.d_calendar_week       a17
on (a12.week_start_date_key = a17.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(1) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_calendar_date       a12
on (a11.closed_on_key = a12.row_key)
join ldb.d_calendar_quarter       a17
on (a12.quarter_start_date_key = a17.row_key)
union
select'ldb.d_change_request_category' as Table_Name, count(1) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_category       a16
on (a11.category_src_key = a16.row_key)
union
select'ldb.d_change_request_risk' as Table_Name, count(1) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_risk       a16
on (a11.risk_src_key = a16.row_key)
union
select'ldb.d_change_request_type' as Table_Name, count(1) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_type       a16
on (a11.type_src_key = a16.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(1) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_configuration_item       a16
on (a11.configuration_item_key = a16.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(1) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_internal_organization_department       a16
on (a11.requested_by_department_key = a16.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(1) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_internal_organization_group       a16
on (a11.assignment_group_key = a16.row_key)
