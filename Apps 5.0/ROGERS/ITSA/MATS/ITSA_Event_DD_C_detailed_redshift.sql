select 'ldb.f_incident_event_c	a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c	a11 
union
select 'ldb.d_calendar_date	a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c	a11 
join	ldb.d_calendar_date	a12 
on (a11.opened_on_key = a12.row_key) 
union
select 'ldb.d_incident	a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c	a11 
join	ldb.d_incident	a13 
on (a11.incident_key = a13.row_key) 
union
select 'ldb.d_incident_requester_c	a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c	a11 
join	ldb.d_incident	a13 
on (a11.incident_key = a13.row_key) 
join	ldb.d_incident_requester_c	a14 
on (a13.row_key = a14.row_key) 
union
select 'ldb.d_calendar_year	a155 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c	a11 
join	ldb.d_calendar_date	a12 
on (a11.opened_on_key = a12.row_key) 
join	ldb.d_calendar_year	a155 
on (a12.year_start_date_key = a155.row_key) 
union
select 'ldb.d_incident_state	a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c	a11 
join	ldb.d_incident	a13 
on (a11.incident_key = a13.row_key) 
join	ldb.d_incident_state	a15 
on (a13.state_src_key = a15.row_key) 
union
select 'ldb.d_internal_organization_group	a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c	a11 
join	ldb.d_internal_organization_group	a16 
on (a11.assignment_group_key = a16.row_key) 
union
select 'ldb.d_internal_organization_last_resolved_by_c	a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c	a11 
join	ldb.d_internal_organization_last_resolved_by_c	a17 
on (a11.resolved_by_group_key = a17.row_key) 
union
select 'ldb.d_configuration_item	a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c	a11 
join	ldb.d_incident	a13 
on (a11.incident_key = a13.row_key) 
join	ldb.d_configuration_item	a121 
on (a11.configuration_item_key = a121.row_key) 
union
select 'ldb.d_internal_contact_director_c	a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c	a11 
join	ldb.d_configuration_item	a121 
on (a11.configuration_item_key = a121.row_key) 
join	ldb.d_internal_contact_director_c	a131 
on (a121.support_director_c_key = a131.row_key) 
union
select 'ldb.d_internal_contact_manager_c	a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c	a11 
join	ldb.d_configuration_item	a121 
on (a11.configuration_item_key = a121.row_key) 
join	ldb.d_internal_contact_manager_c	a141 
on (a121.managed_by_c_key = a141.row_key) 
union
select 'ldb.d_internal_contact_vp_c	a151 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c	a11 
join	ldb.d_configuration_item	a121 
on (a11.configuration_item_key = a121.row_key) 
join	ldb.d_internal_contact_vp_c	a151 
on (a121.vp_c_key = a151.row_key) 
union
select 'ldb.d_lov_incident_sub_status_c	a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c	a11 
join	ldb.d_incident	a13 
on (a11.incident_key = a13.row_key) 
join	ldb.d_lov_incident_sub_status_c	a16 
on (a13.sub_status_src_c_key = a16.row_key) 