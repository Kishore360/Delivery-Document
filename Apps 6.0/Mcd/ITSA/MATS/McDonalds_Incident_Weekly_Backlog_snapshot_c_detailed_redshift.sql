select 'ldb.f_n_incident_agg_snapshot_weekly_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_incident_agg_snapshot_weekly_c a11 
union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_incident_agg_snapshot_weekly_c a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_incident_agg_snapshot_weekly_c a11 
join ldb.d_internal_contact_assigned_to a13 
on (a11.assigned_to_key = a13.row_key) 
union
select 'ldb.d_business_service a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_incident_agg_snapshot_weekly_c a11 
join ldb.d_business_service a14 
on (a11.business_service_key = a14.row_key) 
union
select 'ldb.d_calendar_week a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_incident_agg_snapshot_weekly_c a11 
join ldb.d_calendar_week a15 
on (a11.period_start_c_key = a15.row_key) 
union
select 'ldb.d_internal_contact_assignment_group_manager_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_incident_agg_snapshot_weekly_c a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) 
join ldb.d_internal_contact_assignment_group_manager_c a16 
on (a12.manager_c_key = a16.row_key) 