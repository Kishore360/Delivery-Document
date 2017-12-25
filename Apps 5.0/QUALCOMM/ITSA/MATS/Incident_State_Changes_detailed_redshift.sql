select 'ldb.f_incident_state a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
join ldb.d_calendar_date a12 
on (a11.state_on_key = a12.row_key) 
union
select 'ldb.d_calendar_week a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
join ldb.d_calendar_date a12 
on (a11.state_on_key = a12.row_key) 
join ldb.d_calendar_week a13 
on (a12.week_start_date_key = a13.row_key) 
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
select 'ldb.d_incident a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
union
select 'ldb.d_incident_closed_by a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
join ldb.d_incident_closed_by a17 
on (a16.closed_by_key = a17.row_key) 
union
select 'ldb.d_incident_opened_by a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
join ldb.d_incident_opened_by a18 
on (a16.opened_by_key = a18.row_key) 
union
select 'ldb.d_calendar_month a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
join ldb.d_calendar_date a12 
on (a11.state_on_key = a12.row_key) 
join ldb.d_calendar_month a19 
on (a12.month_start_date_key = a19.row_key) 
union
select 'ldb.d_calendar_quarter a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
join ldb.d_calendar_date a12 
on (a11.state_on_key = a12.row_key) 
join ldb.d_calendar_quarter a110 
on (a12.quarter_start_date_key = a110.row_key) 
union
select 'ldb.d_calendar_year a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
join ldb.d_calendar_date a12 
on (a11.state_on_key = a12.row_key) 
join ldb.d_calendar_year a111 
on (a12.year_start_date_key = a111.row_key) 
union
select 'ldb.d_internal_contact_employee_manager_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) join ldb.d_incident_opened_by a18 
on (a16.opened_by_key = a18.row_key) 
join ldb.d_internal_contact_employee_manager_c a112 
on (a18.manager_key = a112.row_key) 
union
select 'ldb.d_parent_incident a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
join ldb.d_parent_incident a113 
on (a16.parent_incident_key = a113.row_key) 
union
select 'ldb.d_incident_resolved_by a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
join ldb.d_incident_resolved_by a114 
on (a16.resolved_by_key = a114.row_key) 
union
select 'ldb.d_configuration_item a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
join ldb.d_configuration_item a115 
on (a11.configuration_item_key = a115.row_key) 
union
select 'ldb.d_incident_state_from a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
join ldb.d_incident_state_from a116 
on (a11.from_state_src_key = a116.row_key) 
union
select 'ldb.d_incident_state_to a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
join ldb.d_incident_state_to a117 
on (a11.to_state_src_key = a117.row_key) 
union
select 'ldb.d_incident_previous_state_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
join ldb.d_incident_previous_state_c a118 
on (a11.previous_state_src_key = a118.row_key) 
union
select 'ldb.o_data_freshness a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
join ldb.d_calendar_date a12 
on (a11.state_on_key = a12.row_key) 
join ldb.o_data_freshness a119 
on (a12.source_id = a119.source_id) 
union
select 'ldb.d_incident_priority a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
join ldb.d_incident_priority a120 
on (a11.priority_src_key = a120.row_key) 
union
select 'ldb.d_incident_state a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
join ldb.d_incident_state a121 
on (a16.state_src_key = a121.row_key) 
