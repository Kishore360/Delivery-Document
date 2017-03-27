select 'ldb.n_incident_weekly a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_weekly a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_weekly a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_weekly a11 
join ldb.d_calendar_date a13 
on (a11.n_key = a13.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_weekly a11 
join ldb.d_internal_contact_assigned_to a14 
on (a11.assigned_to_key = a14.row_key) 
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_weekly a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
union
select 'ldb.d_internal_organization_assignment_group_parent a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_weekly a11 
join ldb.d_internal_organization_assignment_group_parent a16 
on (a11.assignment_group_parent_c_key = a16.row_key) 
union
select 'ldb.d_configuration_item a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_weekly a11 
join ldb.d_configuration_item a17 
on (a11.configuration_item_key = a17.row_key) 
union
select 'ldb.d_internal_contact_mdm a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_weekly a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a18 
on (a12.row_current_key = a18.row_current_key) 
union
select 'ldb.d_incident_agebucket a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_weekly a11 
join ldb.d_incident_agebucket a19 
on (a11.age_key = a19.row_key) 
union
select 'ldb.d_incident_category a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_weekly a11 
join ldb.d_incident_category a110 
on (a11.category_src_key = a110.row_key) 
union
select 'ldb.d_incident_state a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_weekly a11 
join ldb.d_incident_state a111 
on (a11.state_src_key = a111.row_key) 
union
select 'ldb.d_task_priority a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_weekly a11 
join ldb.d_task_priority a112 
on (a11.priority_src_key = a112.row_key) 
union
select 'ldb.d_calendar_week a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_weekly a11 
join ldb.d_calendar_date a13 
on (a11.n_key = a13.row_key) 
join ldb.d_calendar_week a113 
on (a13.week_start_date_key = a113.row_key)
