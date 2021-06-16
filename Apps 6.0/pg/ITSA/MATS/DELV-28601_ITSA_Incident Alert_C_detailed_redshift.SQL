select 'ldb.d_incident_alert_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_incident_alert_c a11
union
select 'ldb.d_alert_incident_assigned_to_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_incident_alert_c a11
join ldb.d_alert_incident_assigned_to_c a12
on (a11.alert_incident_assigned_to_c_key = a12.row_key)
union
select 'ldb.d_alert_incident_assignment_group_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_incident_alert_c a11
join ldb.d_alert_incident_assignment_group_c a13
on (a11.alert_incident_assignment_group_c_key = a13.row_key)
union
select 'ldb.d_alert_incident_commander_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_incident_alert_c a11
join ldb.d_alert_incident_commander_c a14
on (a11.alert_incident_commander_c_key = a14.row_key)
union
select 'ldb.d_alert_incident_liason_officer_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_incident_alert_c a11
join ldb.d_alert_incident_liason_officer_c a15
on (a11.alert_incident_liason_officer_c_key = a15.row_key)
union
select 'ldb.d_alert_incident_opened_by_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_incident_alert_c a11
join ldb.d_alert_incident_opened_by_c a16
on (a11.alert_incident_opened_by_c_key = a16.row_key)
union
select 'ldb.d_alert_incident_pg_operations_manager_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_incident_alert_c a11
join ldb.d_alert_incident_pg_operations_manager_c a17
on (a11.alert_incident_pg_operations_manager_c_key = a17.row_key)
union
select 'ldb.d_lov_alert_incident_resolution_code_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_incident_alert_c a11
join ldb.d_lov_alert_incident_resolution_code_c a18
on (a11.alert_incident_resolution_code_c_key = a18.row_key)
union
select 'ldb.d_alert_incident_resolved_by_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_incident_alert_c a11
join ldb.d_alert_incident_resolved_by_c a19
on (a11.alert_incident_resolved_by_c_key = a19.row_key)
union
select 'ldb.d_incident_alert_severity_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_incident_alert_c a11
join ldb.d_incident_alert_severity_c a110
on (a11.alert_incident_severity_c_key = a110.row_key)
union
select 'ldb.d_alert_incident_source_ci_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_incident_alert_c a11
join ldb.d_alert_incident_source_ci_c a111
on (a11.alert_incident_source_ci_c_key = a111.row_key)
union
select 'ldb.d_lov_alert_incident_state_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_incident_alert_c a11
join ldb.d_lov_alert_incident_state_c a112
on (a11.alert_incident_state_c_key = a112.row_key)
union
select 'ldb.d_alert_incident_tsp_csm_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_incident_alert_c a11
join ldb.d_alert_incident_tsp_csm_c a113
on (a11.alert_incident_tsp_csm_c_key = a113.row_key)
union
select 'ldb.d_alert_incident_source_incident_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_incident_alert_c a11
join ldb.d_alert_incident_source_incident_c a114
on (a11.alert_incident_source_incident_c_key = a114.row_key)