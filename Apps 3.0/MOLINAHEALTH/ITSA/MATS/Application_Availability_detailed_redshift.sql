select 'ldb.f_application_outage_c a11 ' as Table_name, count(a11.*) Row_Count
from ldb.f_application_outage_c a11
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.*) Row_Count
from ldb.f_application_outage_c a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) 
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.*) Row_Count
from ldb.f_application_outage_c a11 
join ldb.d_calendar_date a13 
on (a11.calendar_date_key = a13.row_key) 
union
select 'ldb.d_location a14 ' as Table_name, count(a11.*) Row_Count
from ldb.f_application_outage_c a11 
join ldb.d_location a14 
on (a11.location_key = a14.row_key) 
union
select 'ldb.d_schedule_c a15 ' as Table_name, count(a11.*) Row_Count
from ldb.f_application_outage_c a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) 
join ldb.d_schedule_c a15 
on (a12.schedule_c_key = a15.row_key) 
