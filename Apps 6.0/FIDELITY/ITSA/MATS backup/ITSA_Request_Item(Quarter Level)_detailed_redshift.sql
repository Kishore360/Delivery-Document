select 'ldb.f_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item a11 
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item a11 
join ldb.d_calendar_date a12
on (a11.date_key=a12.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item a11 
 join ldb.d_calendar_date a12
on (a11.date_key=a12.row_key)
join ldb.d_calendar_month a13
on (a12.month_start_date_key=a13.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item a11 
join ldb.d_internal_contact a14
on (a11.employee_key=a14.row_key)
union
select'ldb.d_master_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item a11 
join ldb.d_master_item a15
on (a11.catalog_item_key=a15.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item a11 
  join ldb.d_calendar_date a12
on (a11.date_key=a12.row_key)
join ldb.d_calendar_month a13
on (a12.month_start_date_key=a13.row_key)
join ldb.d_calendar_quarter a16
on (a13.quarter_start_date_key=a16.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item a11 
 join ldb.d_internal_contact a14
on (a11.employee_key=a14.row_key)
join ldb.d_internal_organization_department a17
on (a14.department_key=a17.row_key);

	