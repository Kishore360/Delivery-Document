
select'ldb.f_call_center_stats_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call_center_stats_c       a11 
union
select'ldb.d_call_center_kpi_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call_center_stats_c       a11 
join ldb.d_call_center_kpi_c       a12
on (a11.stat_key = a12.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call_center_stats_c       a11 
join ldb.d_calendar_date       a14
on (a11.month_key = a14.month_start_date_key)
