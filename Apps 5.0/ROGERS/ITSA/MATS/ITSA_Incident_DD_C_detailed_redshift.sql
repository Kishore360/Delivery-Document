select 'ldb.f_incident_application_availability_c	a11 ' as Table_name, count(1) Row_Count
from ldb.f_incident_application_availability_c	a11 
union
select 'ldb.d_calendar_date	a12 ' as Table_name, count(1) Row_Count
from ldb.f_incident_application_availability_c	a11 
join	ldb.d_calendar_date	a12 
on (a11.opened_on_key = a12.row_key) 
union
select 'ldb.d_incident	a13 ' as Table_name, count(1) Row_Count
from ldb.f_incident_application_availability_c	a11 
join	ldb.d_incident	a13 
on (a11.incident_key = a13.row_key) 
union
select 'ldb.d_calendar_year	a14 ' as Table_name, count(1) Row_Count
from ldb.f_incident_application_availability_c	a11 
join	ldb.d_calendar_date	a12 
on (a11.opened_on_key = a12.row_key) 
join	ldb.d_calendar_year	a14 
on (a12.year_start_date_key = a14.row_key) 
union
select 'ldb.d_incident_state	a15 ' as Table_name, count(1) Row_Count
from ldb.f_incident_application_availability_c	a11 
join	ldb.d_incident_state	a15 
on (a11.state_src_key = a15.row_key) 
union
select 'ldb.d_lov_incident_sub_status_c	a16 ' as Table_name, count(1) Row_Count
from ldb.f_incident_application_availability_c	a11 
join	ldb.d_incident	a13 
on (a11.incident_key = a13.row_key) 
join	ldb.d_lov_incident_sub_status_c	a16 
on (a13.sub_status_src_c_key = a16.row_key) 