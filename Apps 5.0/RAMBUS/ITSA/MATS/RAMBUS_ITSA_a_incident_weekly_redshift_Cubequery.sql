select 'ldb.a_incident_weekly a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.a_incident_weekly a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.a_incident_weekly a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.a_incident_weekly a11 
join ldb.d_internal_contact_assigned_to a13 
on (a11.assigned_to_key = a13.row_key) 
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.a_incident_weekly a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.a_incident_weekly a11 
join ldb.d_calendar_date a15 
on (a11.row_key = a15.row_key) 
union
select 'ldb.d_calendar_week a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.a_incident_weekly a11 
join ldb.d_calendar_date a15 
on (a11.row_key = a15.row_key) 
join ldb.d_calendar_week a16 
on (a15.week_start_date_key = a16.row_key) 
union
select 'ldb.d_location_affected_user_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.a_incident_weekly a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_location_affected_user_c a17 
on (a12.location_key = a17.row_key) 
union
select 'ldb.d_configuration_item a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.a_incident_weekly a11 
join ldb.d_configuration_item a18 
on (a11.business_service_key = a18.row_key) 
union
select 'ldb.d_internal_organization_department a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.a_incident_weekly a11 
join ldb.d_internal_organization_department a19 
on (a11.opened_by_department_key = a19.row_key) 
union
select 'ldb.d_lov_incident_category_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.a_incident_weekly a11 
join ldb.d_lov_incident_category_c a110 
on (a11.category_src_key = a110.row_key) 
union
select 'ldb.d_calendar_month a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.a_incident_weekly a11 
join ldb.d_calendar_date a15 
on (a11.row_key = a15.row_key) 
join ldb.d_calendar_month a111 
on (a15.month_start_date_key = a111.row_key) 
