select 'ldb.f_agent_call_summary' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_agent_call_summary       a11 
union
select'ldb.d_agent' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_agent_call_summary       a11 
join ldb.d_agent       a12
on (a11.agent_key = a12.row_key)
union
select'ldb.d_group_lvl' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_agent_call_summary       a11 
join ldb.d_group_lvl       a13
on (a11.group_lvl_key = a13.row_key)
union
select'ldb.d_skill' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_agent_call_summary       a11 
join ldb.d_skill       a14
on (a11.skill_key = a14.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_agent_call_summary       a11 
join ldb.d_calendar_date       a15
on (a11.day_key = a15.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_agent_call_summary       a11 
 join ldb.d_calendar_date       a15
on (a11.day_key = a15.row_key)
join ldb.d_calendar_month       a16
on (a15.month_start_date_key = a16.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_agent_call_summary       a11
 join ldb.d_calendar_date       a15
on (a11.day_key = a15.row_key)
join ldb.d_calendar_quarter       a17
on (a15.quarter_start_date_key = a17.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_agent_call_summary       a11 
 join ldb.d_calendar_date       a15
on (a11.day_key = a15.row_key)
join ldb.d_calendar_week       a18
on (a15.week_start_date_key = a18.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_agent_call_summary       a11 
 join ldb.d_calendar_date       a15
on (a11.day_key = a15.row_key)
join ldb.d_calendar_year       a19
on (a15.year_start_date_key = a19.row_key)
union
select'ldb.d_acd' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_agent_call_summary       a11 
join ldb.d_acd       a110
on (a11.acd_key = a110.row_key)
union
select'ldb.d_source' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_agent_call_summary       a11 
join ldb.d_source       a111
on (a11.source_id = a111.source_id)

