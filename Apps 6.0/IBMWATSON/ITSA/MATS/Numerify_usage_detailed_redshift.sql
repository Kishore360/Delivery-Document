select 'ldb.f_numerify_application_dashboard_usage_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_numerify_application_dashboard_usage_c a11
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_numerify_application_dashboard_usage_c a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
union
select 'ldb.d_calendar_month a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_numerify_application_dashboard_usage_c a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
join ldb.d_calendar_month a13
on (a12.month_start_date_key = a13.row_key)
union
select 'ldb.d_calendar_quarter a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_numerify_application_dashboard_usage_c a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key) join ldb.d_calendar_month a13
on (a12.month_start_date_key = a13.row_key)
join ldb.d_calendar_quarter a14
on (a13.quarter_start_date_key = a14.row_key)
union
select 'ldb.d_numerify_application_dashboard_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_numerify_application_dashboard_usage_c a11
join ldb.d_numerify_application_dashboard_c a15
on (a11.numerify_application_dashboard_c_key = a15.row_key)
union
select 'ldb.d_numerify_application_user_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_numerify_application_dashboard_usage_c a11
join ldb.d_numerify_application_user_c a16
on (a11.numerify_application_user_c_key = a16.row_key)
union
select 'ldb.d_calendar_week a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_numerify_application_dashboard_usage_c a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
join ldb.d_calendar_week a17
on (a12.week_start_date_key = a17.row_key)
union
select 'ldb.d_calendar_year a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_numerify_application_dashboard_usage_c a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key) join ldb.d_calendar_month a13
on (a12.month_start_date_key = a13.row_key) join ldb.d_calendar_quarter a14
on (a13.quarter_start_date_key = a14.row_key)
join ldb.d_calendar_year a18
on (a14.year_start_date_key = a18.row_key)