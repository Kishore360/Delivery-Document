select 'ldb.f_application_availability_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
union
select 'ldb.d_archer_application_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_archer_application_c a12
on (a11.application_archer_c_key = a12.row_key)
union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_calendar_date a14
on (a11.date_key = a14.row_key)
union
select 'ldb.d_calendar_month a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_calendar_date a14
on (a11.date_key = a14.row_key)
join ldb.d_calendar_month a15
on (a14.month_start_date_key = a15.row_key)
union
select 'ldb.d_calendar_quarter a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_calendar_date a14
on (a11.date_key = a14.row_key) join ldb.d_calendar_month a15
on (a14.month_start_date_key = a15.row_key)
join ldb.d_calendar_quarter a16
on (a15.quarter_start_date_key = a16.row_key)
union
select 'ldb.d_configuration_item_mdm a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_configuration_item_mdm a17
on (a13.mdm_key = a17.row_key)
union
select 'ldb.d_calendar_week a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_calendar_date a14
on (a11.date_key = a14.row_key)
join ldb.d_calendar_week a18
on (a14.week_start_date_key = a18.row_key)
union
select 'ldb.d_calendar_year a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_calendar_date a14
on (a11.date_key = a14.row_key) join ldb.d_calendar_month a15
on (a14.month_start_date_key = a15.row_key) join ldb.d_calendar_quarter a16
on (a15.quarter_start_date_key = a16.row_key)
join ldb.d_calendar_year a19
on (a16.year_start_date_key = a19.row_key)