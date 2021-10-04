select 'ldb.f_incident_task	a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task	a11 
union
select 'ldb.d_calendar_date	a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task	a11 
join	ldb.d_calendar_date	a12 
on (a11.opened_on_key = a12.row_key) 
union
select 'ldb.d_incident_task	a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task	a11 
join	ldb.d_incident_task	a13 
on (a11.incident_task_c_key = a13.row_key) 
union
select 'ldb.d_calendar_month	a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task	a11 
join	ldb.d_calendar_date	a12 
on (a11.opened_on_key = a12.row_key) 
join	ldb.d_calendar_month	a14 
on (a12.month_start_date_key = a14.row_key) 
union
select 'ldb.d_calendar_week	a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task	a11 
join	ldb.d_calendar_date	a12 
on (a11.opened_on_key = a12.row_key) 
join	ldb.d_calendar_week	a15 
on (a12.week_start_date_key = a15.row_key) 
union
select 'ldb.d_internal_contact_assigned_to	a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task	a11 
join	ldb.d_internal_contact_assigned_to	a16 
on (a11.assigned_to_key = a16.row_key) 
union
select 'ldb.d_internal_organization_group	a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task	a11 
join	ldb.d_internal_organization_group	a17 
on (a11.assignment_group_key = a17.row_key) 
union
select 'ldb.d_business_service	a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task	a11 
join	ldb.d_business_service	a18 
on (a11.business_service_key = a18.row_key) 
union
select 'ldb.d_internal_contact_opened_by_c	a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task	a11 
join	ldb.d_internal_contact_opened_by_c	a19 
on (a11.opened_by_key = a19.row_key) 
union
select 'ldb.d_incident_task_age_bucket	a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task	a11 
join	ldb.d_incident_task_age_bucket	a110 
on (a11.age_key = a110.row_key) 
union
select 'ldb.d_incident	a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task	a11 
join	ldb.d_incident	a111 
on (a11.parent_incident_key = a111.row_key) 
union
select 'ldb.d_internal_contact_task_closed_by	a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task	a11 
join	ldb.d_internal_contact_task_closed_by	a112 
on (a11.closed_by_key = a112.row_key) 
union
select 'ldb.d_location	a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task	a11 
join	ldb.d_location	a113 
on (a11.location_key = a113.row_key) 
union
select 'ldb.d_incident_task_priority	a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task	a11 
join	ldb.d_incident_task	a13 
on (a11.incident_task_c_key = a13.row_key) 
join	ldb.d_incident_task_priority	a114 
on (a13.priority_src_key = a114.row_key) 
union
select 'ldb.d_incident_task_state	a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task	a11 
join	ldb.d_incident_task	a13 
on (a11.incident_task_c_key = a13.row_key) 
join	ldb.d_incident_task_state	a115 
on (a13.state_src_key = a115.row_key) 