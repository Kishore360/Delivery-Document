select 'ldb.f_agent_log_c a11 ' as Table_name, count(a11.row_key) Row_Count

from ldb.f_agent_log_c a11

union

select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count

from ldb.f_agent_log_c a11

join ldb.d_calendar_date a12

on (a11.start_time_c_key = a12.row_key)

union

select 'ldb.d_calendar_month a13 ' as Table_name, count(a11.row_key) Row_Count

from ldb.f_agent_log_c a11

join ldb.d_calendar_date a12

on (a11.start_time_c_key = a12.row_key)

join ldb.d_calendar_month a13

on (a12.month_start_date_key = a13.row_key)

union

select 'ldb.d_calendar_quarter a14 ' as Table_name, count(a11.row_key) Row_Count

from ldb.f_agent_log_c a11

join ldb.d_calendar_date a12

on (a11.start_time_c_key = a12.row_key) join ldb.d_calendar_month a13

on (a12.month_start_date_key = a13.row_key)

join ldb.d_calendar_quarter a14

on (a13.quarter_start_date_key = a14.row_key)

union

select 'ldb.d_calendar_week a15 ' as Table_name, count(a11.row_key) Row_Count

from ldb.f_agent_log_c a11

join ldb.d_calendar_date a12

on (a11.start_time_c_key = a12.row_key)

join ldb.d_calendar_week a15

on (a12.week_start_date_key = a15.row_key)

union

select 'ldb.d_calendar_year a16 ' as Table_name, count(a11.row_key) Row_Count

from ldb.f_agent_log_c a11

join ldb.d_calendar_date a12

on (a11.start_time_c_key = a12.row_key) join ldb.d_calendar_month a13

on (a12.month_start_date_key = a13.row_key) join ldb.d_calendar_quarter a14

on (a13.quarter_start_date_key = a14.row_key)

join ldb.d_calendar_year a16

on (a14.year_start_date_key = a16.row_key)

union

select 'ldb.o_data_freshness a17 ' as Table_name, count(a11.row_key) Row_Count

from ldb.f_agent_log_c a11

join ldb.o_data_freshness a17

on (a11.source_id = a17.source_id)