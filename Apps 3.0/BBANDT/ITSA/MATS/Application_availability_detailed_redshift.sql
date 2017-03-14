select 'ldb.f_application_availability_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_calendar_date a12 
on (a11.calendar_date_key = a12.row_key)
union
select 'ldb.d_calendar_time a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_calendar_time a12 
on (a11.avail_start_time_c_key = a12.row_key)
union
select 'ldb.d_application_schedule_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_application_schedule_c a12 
on (a11.application_schedule_c_key = a12.row_key);