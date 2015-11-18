SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
union
select'ldb.d_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_organization_legalentity         a12
on (a11.company_key = a12.row_key)
union
select'ldb.d_customer' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_customer         a13
on (a11.customer_key = a13.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_organization_department         a14
on (a11.opened_by_department_key = a14.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_contact         a15
on (a11.opened_by_key = a15.row_key)
union
select'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_calendar_time         a16
on (a11.opened_time_key = a16.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_calendar_date         a17
on (a11.opened_on_key = a17.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_calendar_date         a17
on (a11.opened_on_key = a17.row_key)
join ldb.d_calendar_month         a18
on (a17.month_start_date_key = a18.row_key)
)a
)b
