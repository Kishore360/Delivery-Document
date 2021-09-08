select 'ldb.f_incident_state a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
join ldb.d_calendar_date a12 
on (a11.state_on_key = a12.row_key) 
union
select 'ldb.d_incident a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
join ldb.d_incident a13 
on (a11.incident_key = a13.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
join ldb.d_internal_contact_assigned_to a14 
on (a11.assigned_to_key = a14.row_key) 
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
union
select 'ldb.d_business_service a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
join ldb.d_business_service a16 
on (a11.business_service_key = a16.row_key) 
union
select 'ldb.d_incident_state_from a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
join ldb.d_incident_state_from a17 
on (a11.from_state_src_key = a17.row_key) 
union
select 'ldb.d_incident_state_to a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
join ldb.d_incident_state_to a18 
on (a11.to_state_src_key = a18.row_key) 
union
select 'ldb.d_scafe_core_realm_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
join ldb.d_scafe_core_realm_c a19 
on (a11.scafe_core_realm_c_key = a19.row_key) 
union
select 'ldb.d_calendar_month a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
join ldb.d_calendar_date a12 
on (a11.state_on_key = a12.row_key) 
join ldb.d_calendar_month a110 
on (a12.month_start_date_key = a110.row_key) 
union
select 'ldb.d_incident_priority a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
join ldb.d_incident_priority a111 
on (a11.priority_src_key = a111.row_key) 
union
select 'ldb.d_incident_state a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
join ldb.d_incident a13 
on (a11.incident_key = a13.row_key) 
join ldb.d_incident_state a112 
on (a13.state_src_key = a112.row_key) 