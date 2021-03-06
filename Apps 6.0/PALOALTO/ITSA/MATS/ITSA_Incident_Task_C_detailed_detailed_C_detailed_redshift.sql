select 'ldb.f_incident_tasks_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_calendar_date a12 
on (a11.date_key = a12.row_key) 
union
select 'ldb.d_calendar_month a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_calendar_date a12 
on (a11.date_key = a12.row_key) 
join ldb.d_calendar_month a13 
on (a12.month_start_date_key = a13.row_key) 
union
select 'ldb.d_calendar_quarter a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_calendar_date a12 
on (a11.date_key = a12.row_key) join ldb.d_calendar_month a13 
on (a12.month_start_date_key = a13.row_key) 
join ldb.d_calendar_quarter a14 
on (a13.quarter_start_date_key = a14.row_key) 
union
select 'ldb.d_internal_contact_opened_by_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_internal_contact_opened_by_c a15 
on (a11.opened_by_c_key = a15.row_key) 
union
select 'ldb.d_calendar_date_fiscal a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_calendar_date_fiscal a16 
on (a11.fiscal_date_key = a16.row_key) 
union
select 'ldb.d_incident_tasks_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_incident_tasks_c a17 
on (a11.incident_tasks_c_key = a17.row_key) 
union
select 'ldb.d_internal_contact_employee_type_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_internal_contact_employee_type_c a18 
on (a11.opened_by_c_key = a18.row_key) 
union
select 'ldb.d_incident a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_incident a19 
on (a11.incident_key = a19.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_calendar_date_fiscal a16 
on (a11.fiscal_date_key = a16.row_key) 
join ldb.d_calendar_fiscal_quarter a110 
on (a16.quarter_start_date_key = a110.row_key) 
union
select 'ldb.d_calendar_fiscal_year a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_calendar_date_fiscal a16 
on (a11.fiscal_date_key = a16.row_key) 
join ldb.d_calendar_fiscal_year a111 
on (a16.year_start_date_key = a111.row_key) 
union
select 'ldb.d_calendar_week a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_calendar_date a12 
on (a11.date_key = a12.row_key) 
join ldb.d_calendar_week a112 
on (a12.week_start_date_key = a112.row_key) 
union
select 'ldb.d_calendar_year a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_calendar_date a12 
on (a11.date_key = a12.row_key) join ldb.d_calendar_month a13 
on (a12.month_start_date_key = a13.row_key) join ldb.d_calendar_quarter a14 
on (a13.quarter_start_date_key = a14.row_key) 
join ldb.d_calendar_year a113 
on (a14.year_start_date_key = a113.row_key) 
union
select 'ldb.d_internal_organization_group_parent_internal_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_internal_organization_group_parent_internal_c a114 
on (a11.assignment_group_c_key = a114.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_internal_contact_assigned_to a115 
on (a11.assigned_to_key = a115.row_key) 
union
select 'ldb.d_internal_organization_group a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_internal_organization_group a116 
on (a11.assignment_group_key = a116.row_key) 
union
select 'ldb.d_duration_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_duration_c a117 
on (a11.opened_by_employee_duration_c = a117.row_key) 
union
select 'ldb.d_internal_contact_task_closed_by_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_internal_contact_task_closed_by_c a118 
on (a11.closed_by_c_key = a118.row_key) 
union
select 'ldb.d_lov_sc_req_item_employee_type_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_internal_contact_employee_type_c a18 
on (a11.opened_by_c_key = a18.row_key) 
join ldb.d_lov_sc_req_item_employee_type_c a119 
on (a18.employee_type_c_key = a119.row_key) 
union
select 'ldb.d_lov_incident_task_impact_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_incident_tasks_c a17 
on (a11.incident_tasks_c_key = a17.row_key) 
join ldb.d_lov_incident_task_impact_c a120 
on (a17.impact_src_key = a120.row_key) 
union
select 'ldb.d_lov_incident_task_priority_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_incident_tasks_c a17 
on (a11.incident_tasks_c_key = a17.row_key) 
join ldb.d_lov_incident_task_priority_c a121 
on (a17.priority_src_key = a121.row_key) 
union
select 'ldb.d_lov_incident_task_state_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_incident_tasks_c a17 
on (a11.incident_tasks_c_key = a17.row_key) 
join ldb.d_lov_incident_task_state_c a122 
on (a17.state_src_key = a122.row_key) 
union
select 'ldb.d_lov_incident_task_urgency_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_incident_tasks_c a17 
on (a11.incident_tasks_c_key = a17.row_key) 
join ldb.d_lov_incident_task_urgency_c a123 
on (a17.urgency_src_key = a123.row_key) 
union
select 'ldb.d_internal_organization_group_parent_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_internal_organization_group_parent_internal_c a114 
on (a11.assignment_group_c_key = a114.row_key) 
join ldb.d_internal_organization_group_parent_c a124 
on (a114.parent_row_c_key = a124.row_key) 