select 'ldb.f_incident_tasks_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
union
select 'ldb.d_calendar_date_fiscal a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_calendar_date_fiscal a12 
on (a11.fiscal_date_key = a12.row_key) 
union
select 'ldb.d_internal_contact_employee_type_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_internal_contact_employee_type_c a13 
on (a11.opened_by_c_key = a13.row_key) 
union
select 'ldb.d_internal_organization_group_parent_internal_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_internal_organization_group_parent_internal_c a14 
on (a11.assignment_group_c_key = a14.row_key) 
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_calendar_date a15 
on (a11.date_key = a15.row_key) 
union
select 'ldb.d_calendar_month a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_calendar_date a15 
on (a11.date_key = a15.row_key) 
join ldb.d_calendar_month a16 
on (a15.month_start_date_key = a16.row_key) 
union
select 'ldb.d_calendar_quarter a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_calendar_date a15 
on (a11.date_key = a15.row_key) join ldb.d_calendar_month a16 
on (a15.month_start_date_key = a16.row_key) 
join ldb.d_calendar_quarter a17 
on (a16.quarter_start_date_key = a17.row_key) 
union
select 'ldb.d_internal_contact_opened_by_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_internal_contact_opened_by_c a18 
on (a11.opened_by_c_key = a18.row_key) 
union
select 'ldb.d_incident_tasks_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_incident_tasks_c a19 
on (a11.incident_tasks_c_key = a19.row_key) 
union
select 'ldb.d_incident a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_incident a110 
on (a11.incident_key = a110.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_calendar_date_fiscal a12 
on (a11.fiscal_date_key = a12.row_key) 
join ldb.d_calendar_fiscal_quarter a111 
on (a12.quarter_start_date_key = a111.row_key) 
union
select 'ldb.d_calendar_fiscal_year a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_calendar_date_fiscal a12 
on (a11.fiscal_date_key = a12.row_key) 
join ldb.d_calendar_fiscal_year a112 
on (a12.year_start_date_key = a112.row_key) 
union
select 'ldb.d_calendar_week a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_calendar_date a15 
on (a11.date_key = a15.row_key) 
join ldb.d_calendar_week a113 
on (a15.week_start_date_key = a113.row_key) 
union
select 'ldb.d_calendar_year a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_calendar_date a15 
on (a11.date_key = a15.row_key) join ldb.d_calendar_month a16 
on (a15.month_start_date_key = a16.row_key) join ldb.d_calendar_quarter a17 
on (a16.quarter_start_date_key = a17.row_key) 
join ldb.d_calendar_year a114 
on (a17.year_start_date_key = a114.row_key) 
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
on (a11.opened_by_employee_duration = a117.row_key) 
union
select 'ldb.d_lov_sc_req_item_employee_type_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_internal_contact_employee_type_c a13 
on (a11.opened_by_c_key = a13.row_key) 
join ldb.d_lov_sc_req_item_employee_type_c a118 
on (a13.employee_type_c_key = a118.row_key) 
union
select 'ldb.d_internal_contact_task_closed_by_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_internal_contact_task_closed_by_c a119 
on (a11.closed_by_c_key = a119.row_key) 
union
select 'ldb.d_internal_organization_group_parent_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_internal_organization_group_parent_internal_c a14 
on (a11.assignment_group_c_key = a14.row_key) 
join ldb.d_internal_organization_group_parent_c a120 
on (a14.parent_row_c_key = a120.row_key) 
union
select 'ldb.d_lov_incident_task_impact_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_incident_tasks_c a19 
on (a11.incident_tasks_c_key = a19.row_key) 
join ldb.d_lov_incident_task_impact_c a121 
on (a19.impact_src_key = a121.row_key) 
union
select 'ldb.d_lov_incident_task_priority_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_incident_tasks_c a19 
on (a11.incident_tasks_c_key = a19.row_key) 
join ldb.d_lov_incident_task_priority_c a122 
on (a19.priority_src_key = a122.row_key) 
union
select 'ldb.d_lov_incident_task_state_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_incident_tasks_c a19 
on (a11.incident_tasks_c_key = a19.row_key) 
join ldb.d_lov_incident_task_state_c a123 
on (a19.state_src_key = a123.row_key) 
union
select 'ldb.d_lov_incident_task_urgency_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_tasks_c a11 
join ldb.d_incident_tasks_c a19 
on (a11.incident_tasks_c_key = a19.row_key) 
join ldb.d_lov_incident_task_urgency_c a124 
on (a19.urgency_src_key = a124.row_key) 
