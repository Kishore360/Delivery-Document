select 'ldb.f_incident_tasks_c a11 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_tasks_c a11 										
union										
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_tasks_c a11 										
join ldb.d_internal_contact a12 										
on (a11.opened_by_c_key = a12.row_key) 										
union										
select 'ldb.d_internal_contact_employee_type_c a13 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_tasks_c a11 										
join ldb.d_internal_contact_employee_type_c a13 										
on (a11.opened_by_c_key = a13.row_key) 										
union										
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_tasks_c a11 										
join ldb.d_calendar_date a14 										
on (a11.opened_on_c_key = a14.row_key) 										
union										
select 'ldb.d_incident_tasks_c a15 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_tasks_c a11 										
join ldb.d_incident_tasks_c a15 										
on (a11.incident_tasks_c_key = a15.row_key) 										
union										
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_tasks_c a11 										
join ldb.d_internal_organization_group a16 										
on (a11.assignment_group_c_key = a16.row_key) 										
union										
select 'ldb.d_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_tasks_c a11 										
join ldb.d_internal_contact_assigned_to a17 										
on (a11.assigned_to_c_key = a17.row_key) 										
union										
select 'ldb.d_internal_contact_opened_by_c a18 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_tasks_c a11 										
join ldb.d_internal_contact_opened_by_c a18 										
on (a11.opened_by_c_key = a18.row_key) 										
union										
select 'ldb.d_duration_c a19 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_tasks_c a11 										
join ldb.d_duration_c a19 										
on (a11.opened_by_employee_duration = a19.duration_c_key) 										
union										
select 'ldb.d_lov_employee_type_c a110 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_tasks_c a11 										
join ldb.d_internal_contact_employee_type_c a13 										
on (a11.opened_by_c_key = a13.row_key) 										
join ldb.d_lov_employee_type_c a110 										
on (a13.employee_type_c_key = a110.row_key) 										
union										
select 'ldb.d_incident a111 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_tasks_c a11 										
join ldb.d_incident a111 										
on (a11.incident_c_key = a111.row_key) 										
union										
select 'ldb.d_internal_contact_task_closed_by_c a112 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_tasks_c a11 										
join ldb.d_internal_contact_task_closed_by_c a112 										
on (a11.closed_by_c_key = a112.row_key) 										
union										
select 'ldb.d_incident_task_impact_c a113 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_tasks_c a11 										
join ldb.d_incident_tasks_c a15 										
on (a11.incident_tasks_c_key = a15.row_key) 										
join ldb.d_incident_task_impact_c a113 										
on (a15.impact_src_key = a113.row_key) 										
union										
select 'ldb.d_incident_task_priority_c a114 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_tasks_c a11 										
join ldb.d_incident_tasks_c a15 										
on (a11.incident_tasks_c_key = a15.row_key) 										
join ldb.d_incident_task_priority_c a114 										
on (a15.priority_src_key = a114.row_key) 										
union										
select 'ldb.d_incident_task_state_c a115 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_tasks_c a11 										
join ldb.d_incident_tasks_c a15 										
on (a11.incident_tasks_c_key = a15.row_key) 										
join ldb.d_incident_task_state_c a115 										
on (a15.state_src_key = a115.row_key) 										
union										
select 'ldb.d_incident_task_urgency_c a116 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_tasks_c a11 										
join ldb.d_incident_tasks_c a15 										
on (a11.incident_tasks_c_key = a15.row_key) 										
join ldb.d_incident_task_urgency_c a116 										
on (a15.urgency_src_key = a116.row_key) 										
union										
select 'ldb.d_calendar_month a117 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_tasks_c a11 										
join ldb.d_calendar_date a14 										
on (a11.opened_on_c_key = a14.row_key) 										
join ldb.d_calendar_month a117 										
on (a14.month_start_date_key = a117.row_key) 										
union										
select 'ldb.d_internal_organization_group_parent_c a118 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_tasks_c a11 										
join ldb.d_internal_organization_group a16 										
on (a11.assignment_group_c_key = a16.row_key) 										
join ldb.d_internal_organization_group_parent_c a118 										
on (a16.parent_row_key_c = a118.row_key) 										
union										
select 'ldb.d_calendar_week a119 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_tasks_c a11 										
join ldb.d_calendar_date a14 										
on (a11.opened_on_c_key = a14.row_key) 										
join ldb.d_calendar_week a119 										
on (a14.week_start_date_key = a119.row_key) 										
