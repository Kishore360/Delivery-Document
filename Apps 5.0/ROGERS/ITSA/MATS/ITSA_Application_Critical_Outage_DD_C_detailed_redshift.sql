select 'ldb.f_application_availability_at_day_level_c	a11 ' as Table_name, count(1) Row_Count
from ldb.f_application_availability_at_day_level_c	a11 
union
select 'ldb.d_configuration_item	a12 ' as Table_name, count(1) Row_Count
from ldb.f_application_availability_at_day_level_c	a11 
join	ldb.d_configuration_item	a12 
on (a11.configuration_item_key = a12.row_key) 
union
select 'ldb.d_incident	a13 ' as Table_name, count(1) Row_Count
from ldb.f_application_availability_at_day_level_c	a11 
join	ldb.d_incident	a13 
on (a11.incident_key = a13.row_key) 
union
select 'ldb.d_calendar_date	a14 ' as Table_name, count(1) Row_Count
from ldb.f_application_availability_at_day_level_c	a11 
join	ldb.d_calendar_date	a14 
on (a11.date_key = a14.row_key) 
union
select 'ldb.d_calendar_year	a15 ' as Table_name, count(1) Row_Count
from ldb.f_application_availability_at_day_level_c	a11 
join	ldb.d_calendar_date	a14 
on (a11.date_key = a14.row_key) 
join	ldb.d_calendar_year	a15 
on (a14.year_start_date_key = a15.row_key) 
union
select 'ldb.d_application_event_c	a16 ' as Table_name, count(1) Row_Count
from ldb.f_application_availability_at_day_level_c	a11 
join	ldb.d_application_event_c	a16 
on (a11.application_key = a16.row_key) 
union
select 'ldb.d_outage	a17 ' as Table_name, count(1) Row_Count
from ldb.f_application_availability_at_day_level_c	a11 
join	ldb.d_outage	a17 
on (a11.outage_key = a17.row_key) 
union
select 'ldb.d_outage_type	a18 ' as Table_name, count(1) Row_Count
from ldb.f_application_availability_at_day_level_c	a11 
join	ldb.d_outage	a17 
on (a11.outage_key = a17.row_key) 
join	ldb.d_outage_type	a18 
on (a17.outage_type_src_key = a18.row_key) 
union
select 'ldb.d_incident_state	a19 ' as Table_name, count(1) Row_Count
from ldb.f_application_availability_at_day_level_c	a11 
join	ldb.d_incident	a13 
on (a11.incident_key = a13.row_key) join	ldb.d_configuration_item	a133 
on (a11.configuration_item_key = a133.row_key) 
join	ldb.d_incident_state	a19 
on (a13.state_src_key = a19.row_key) 
union
select 'ldb.d_lov_incident_sub_status_c	a110 ' as Table_name, count(1) Row_Count
from ldb.f_application_availability_at_day_level_c	a11 
join	ldb.d_incident	a13 
on (a11.incident_key = a13.row_key) join	ldb.d_configuration_item	a133 
on (a11.configuration_item_key = a133.row_key) 
join	ldb.d_lov_incident_sub_status_c	a110 
on (a13.sub_status_src_c_key = a110.row_key) 
union
select 'ldb.d_configuration_item	a133 ' as Table_name, count(1) Row_Count
from ldb.f_application_availability_at_day_level_c	a11 
join	ldb.d_configuration_item	a133 
on (a11.configuration_item_key = a133.row_key) 
union
select 'ldb.d_incident_priority	a16 ' as Table_name, count(1) Row_Count
from ldb.f_application_availability_at_day_level_c	a11 
join	ldb.d_incident_priority	a16 
on (a11.priority_src_key = a16.row_key) 
union
select 'ldb.d_internal_contact_director_c	a110 ' as Table_name, count(1) Row_Count
from ldb.f_application_availability_at_day_level_c	a11 
join	ldb.d_incident	a13 
on (a11.incident_key = a13.row_key) join	ldb.d_configuration_item	a133 
on (a11.configuration_item_key = a133.row_key) 
join	ldb.d_internal_contact_director_c	a110 
on (a133.support_director_c_key = a110.row_key) 
union
select 'ldb.d_internal_contact_manager_c	a111 ' as Table_name, count(1) Row_Count
from ldb.f_application_availability_at_day_level_c	a11 
join	ldb.d_incident	a13 
on (a11.incident_key = a13.row_key) join	ldb.d_configuration_item	a133 
on (a11.configuration_item_key = a133.row_key) 
join	ldb.d_internal_contact_manager_c	a111 
on (a133.managed_by_c_key = a111.row_key) 
union
select 'ldb.d_internal_contact_vp_c	a112 ' as Table_name, count(1) Row_Count
from ldb.f_application_availability_at_day_level_c	a11 
join	ldb.d_incident	a13 
on (a11.incident_key = a13.row_key) join	ldb.d_configuration_item	a133 
on (a11.configuration_item_key = a133.row_key) 
join	ldb.d_internal_contact_vp_c	a112 
on (a133.vp_c_key = a112.row_key) 
