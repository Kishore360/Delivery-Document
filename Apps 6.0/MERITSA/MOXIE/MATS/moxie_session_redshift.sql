select 'ldb.from f_chat_session_c a11 ' as Table_name, count(a11.row_key) Row_Count

from ldb.from f_chat_session_c a11

union

select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count

from ldb.from f_chat_session_c a11

join ldb.d_calendar_date a14

on (a11.Calendar_Date_Row_key = a14.row_key)

union

select 'ldb.d_calendar_month a15 ' as Table_name, count(a11.row_key) Row_Count

from ldb.from f_chat_session_c a11

join ldb.d_calendar_date a14

on (a11.Calendar_Date_Row_key = a14.row_key)

join ldb.d_calendar_month a15

on (a14.month_start_date_key = a15.row_key)

union

select 'ldb.d_calendar_quarter a16 ' as Table_name, count(a11.row_key) Row_Count

from ldb.from f_chat_session_c a11

join ldb.d_calendar_date a14

on (a11.Calendar_Date_Row_key = a14.row_key) join ldb.d_calendar_month a15

on (a14.month_start_date_key = a15.row_key)

join ldb.d_calendar_quarter a16

on (a15.quarter_start_date_key = a16.row_key)

union

select 'ldb.d_calendar_week a17 ' as Table_name, count(a11.row_key) Row_Count

from ldb.from f_chat_session_c a11

join ldb.d_calendar_date a14

on (a11.Calendar_Date_Row_key = a14.row_key)

join ldb.d_calendar_week a17

on (a14.week_start_date_key = a17.row_key)

union

select 'ldb.d_calendar_year a18 ' as Table_name, count(a11.row_key) Row_Count

from ldb.from f_chat_session_c a11

join ldb.d_calendar_date a14

on (a11.Calendar_Date_Row_key = a14.row_key) join ldb.d_calendar_month a15

on (a14.month_start_date_key = a15.row_key) join ldb.d_calendar_quarter a16

on (a15.quarter_start_date_key = a16.row_key)

join ldb.d_calendar_year a18

on (a16.year_start_date_key = a18.row_key)

union

select 'ldb.o_data_freshness a19 ' as Table_name, count(a11.row_key) Row_Count

from ldb.from f_chat_session_c a11

join ldb.o_data_freshness a19

on (a11.sourceid = a19.source_id)