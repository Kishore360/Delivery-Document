select 'ldb.n_incident_weekly a11 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.n_incident_weekly a11 
union
select 'ldb.d_internal_contact_assigned_to a12 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.n_incident_weekly a11 
join ldb.d_internal_contact_assigned_to a12 
on (a11.assigned_to_key = a12.row_key) 
union
select 'ldb.d_internal_organization_group a13 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.n_incident_weekly a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.n_incident_weekly a11 
join ldb.d_calendar_date a14 
on (a11.n_key = a14.row_key) 
union
select 'ldb.d_internal_organization_department a15 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.n_incident_weekly a11 
join ldb.d_internal_organization_department a15 
on (a11.opened_by_department_key = a15.row_key) 
union
select 'ldb.d_lov_incident_category_c a16 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.n_incident_weekly a11 
join ldb.d_lov_incident_category_c a16 
on (a11.category_src_key = a16.row_key) 
union
select 'ldb.d_incident_priority a17 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.n_incident_weekly a11 
join ldb.d_incident_priority a17 
on (a11.priority_src_key = a17.row_key) 
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.n_incident_weekly a11 
join ldb.d_calendar_date a14 
on (a11.n_key = a14.row_key) 
join ldb.d_calendar_month a18 
on (a14.month_start_date_key = a18.row_key) 
