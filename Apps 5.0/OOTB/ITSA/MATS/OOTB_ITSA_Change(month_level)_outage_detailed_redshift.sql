select 'ldb.f_change_request_outage' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_outage       a11 
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_outage       a11 
join ldb.d_calendar_date       a12
on (a11.start_on_key = a12.row_key)
union
select'ldb.d_outage' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_outage       a11 
join ldb.d_outage       a13
on (a11.outage_key = a13.row_key)
union
select'ldb.d_outage_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_outage       a11 
join ldb.d_outage       a13
on (a11.outage_key = a13.row_key)
join ldb.dh_user_group_hierarchy       a14
on (a13.outage_type_src_key = a14.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_outage       a11 
 join ldb.d_calendar_date       a12
on (a11.start_on_key = a12.row_key)
join ldb.d_calendar_month       a15
on (a12.month_start_date_key = a15.row_key)
