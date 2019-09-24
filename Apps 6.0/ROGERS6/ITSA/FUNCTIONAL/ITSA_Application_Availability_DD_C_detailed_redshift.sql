select 'ldb.f_application_availability_at_day_level_c	a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_at_day_level_c	a11 
union
select 'ldb.d_application_event_c	a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_at_day_level_c	a11 
join	ldb.d_application_event_c	a12 
on (a11.application_key = a12.row_key) 
union
select 'ldb.d_configuration_item	a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_at_day_level_c	a11 
join	ldb.d_configuration_item	a13 
on (a11.configuration_item_key = a13.row_key) 
union
select 'ldb.d_calendar_date	a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_at_day_level_c	a11 
join	ldb.d_calendar_date	a14 
on (a11.date_key = a14.row_key) 
union
select 'ldb.d_calendar_year	a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_at_day_level_c	a11 
join	ldb.d_calendar_date	a14 
on (a11.date_key = a14.row_key) 
join	ldb.d_calendar_year	a15 
on (a14.year_start_date_key = a15.row_key) 
union
select 'ldb.d_incident_priority	a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_at_day_level_c	a11 
left outer join	ldb.d_incident_priority	a16 
on (a11.priority_src_key = a16.row_key) 