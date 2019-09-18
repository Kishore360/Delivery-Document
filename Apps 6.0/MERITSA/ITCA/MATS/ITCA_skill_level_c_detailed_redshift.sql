select 'ldb.f_skill_call_summary' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_skill_call_summary       a11 
union
select'ldb.d_skill' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_skill_call_summary       a11 
join ldb.d_skill       a12
on (a11.skill_key = a12.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_skill_call_summary       a11 
join ldb.d_calendar_date       a13
on (a11.day_key = a13.row_key)
union
select'ldb.o_data_freshness' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_skill_call_summary       a11 
join ldb.o_data_freshness       a14
on (a11.source_id = a14.source_id)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_skill_call_summary       a11 
 join ldb.d_calendar_date       a13
on (a11.day_key = a13.row_key)
join ldb.d_calendar_month       a15
on (a13.month_start_date_key = a15.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_skill_call_summary       a11 
 join ldb.d_calendar_date       a13
on (a11.day_key = a13.row_key)
join ldb.d_calendar_quarter       a16
on (a13.quarter_start_date_key = a16.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_skill_call_summary       a11 
 join ldb.d_calendar_date       a13
on (a11.day_key = a13.row_key)
join ldb.d_calendar_week       a17
on (a13.week_start_date_key = a17.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_skill_call_summary       a11 
 join ldb.d_calendar_date       a13
on (a11.day_key = a13.row_key)
join ldb.d_calendar_year       a18
on (a13.year_start_date_key = a18.row_key)
union
select'ldb.d_acd' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_skill_call_summary       a11 
join ldb.d_acd       a19
on (a11.acd_key = a19.row_key)
union
select'ldb.d_source' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_skill_call_summary       a11 
join ldb.d_source       a110
on (a11.source_id = a110.source_id)