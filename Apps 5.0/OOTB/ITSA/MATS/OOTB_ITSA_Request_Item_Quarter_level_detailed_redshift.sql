select 'ldb.f_request_item' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
union
select'ldb.d_calendar_date' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_calendar_date       a12
on (a11.opened_on_key = a12.row_key)
union
select'ldb.d_master_item' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_master_item       a12
on (a11.catalog_item_key = a12.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
 join ldb.d_calendar_date       a12
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_month       a13
on (a12.month_start_date_key = a13.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
 join ldb.d_internal_contact a12
 on a12.row_key=a11.closed_by_key
join ldb.d_internal_organization_department       a111
on (a12.department_key = a111.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
 join ldb.d_calendar_date       a12
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_quarter       a13
on (a12.quarter_start_date_key = a13.row_key)