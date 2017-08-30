select 'ldb.f_incident_activity a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_organization_group a12 
on (a11.current_assginment_group_key = a12.row_key) 
union
select 'ldb.d_incident a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_incident a13 
on (a11.incident_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_calendar_date a14 
on (a11.assigned_on_key = a14.row_key) 
union
select 'ldb.d_calendar_week a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_calendar_date a14 
on (a11.assigned_on_key = a14.row_key) 
join ldb.d_calendar_week a15 
on (a14.week_start_date_key = a15.row_key) 
union
select 'ldb.d_calendar_month a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_calendar_date a14 
on (a11.assigned_on_key = a14.row_key) join ldb.d_calendar_week a15 
on (a14.week_start_date_key = a15.row_key) 
join ldb.d_calendar_month a16 
on (a15.month_start_date_key = a16.row_key) 
union
select 'ldb.d_calendar_quarter a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_calendar_date a14 
on (a11.assigned_on_key = a14.row_key) join ldb.d_calendar_week a15 
on (a14.week_start_date_key = a15.row_key) join ldb.d_calendar_month a16 
on (a15.month_start_date_key = a16.row_key) 
join ldb.d_calendar_quarter a17 
on (a16.quarter_start_date_key = a17.row_key) 
union
select 'ldb.d_calendar_year a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_calendar_date a14 
on (a11.assigned_on_key = a14.row_key) join ldb.d_calendar_week a15 
on (a14.week_start_date_key = a15.row_key) join ldb.d_calendar_month a16 
on (a15.month_start_date_key = a16.row_key) join ldb.d_calendar_quarter a17 
on (a16.quarter_start_date_key = a17.row_key) 
join ldb.d_calendar_year a18 
on (a17.year_start_date_key = a18.row_key) 
union
select 'ldb.d_internal_organization_group_to a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_organization_group_to a19 
on (a11.to_assignment_group_key = a19.row_key) 
union
select 'ldb.d_internal_organization_group_from a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_organization_group_from a110 
on (a11.from_assignment_group_key = a110.row_key) 
union
select 'ldb.d_problem a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_problem a111 
on (a11.problem_key = a111.row_key) 
union
select 'ldb.d_reported_for_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_incident a13 
on (a11.incident_key = a13.row_key) 
join ldb.d_reported_for_c a112 
on (a13.reported_for_c_key = a112.row_key) 
union
select 'ldb.d_internal_organization_activity_change_group_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_organization_activity_change_group_c a113 
on (a11.assignment_group_on_change_c_key = a113.row_key) 
union
select 'ldb.d_internal_contact_to a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_contact_to a114 
on (a11.to_assigned_to_key = a114.row_key) 
union
select 'ldb.d_internal_contact_from a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_contact_from a115 
on (a11.from_assigned_to_key = a115.row_key) 
union
select 'ldb.d_activity_priority_to_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_activity_priority_to_c a116 
on (a11.to_priority_key = a116.row_key) 
union
select 'ldb.d_activity_priority_from_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_activity_priority_from_c a117 
on (a11.from_priority_key = a117.row_key) 
union
select 'ldb.d_internal_contact_activity_change_user_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_contact_activity_change_user_c a118 
on (a11.change_by_user_c_key = a118.row_key) 
union
select 'ldb.d_task_priority a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_task_priority a119 
on (a11.priority_src_key = a119.row_key) 
union
select 'ldb.d_task_contacttype a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_task_contacttype a120 
on (a11.reported_type_src_key = a120.row_key) 
union
select 'ldb.d_gps_reporting_group_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_incident a13 
on (a11.incident_key = a13.row_key) 
join ldb.d_gps_reporting_group_c a121 
on (a13.gps_reporting_group_c_key = a121.row_key) 
union
select 'ldb.d_incident_state a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_incident a13 
on (a11.incident_key = a13.row_key) 
join ldb.d_incident_state a122 
on (a13.state_src_key = a122.row_key) 
union
select 'ldb.d_incident_type_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_incident a13 
on (a11.incident_key = a13.row_key) 
join ldb.d_incident_type_c a123 
on (a13.incident_type_c_key = a123.row_key) 
union
select 'ldb.d_internal_organization_business_group_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_incident a13 
on (a11.incident_key = a13.row_key) join ldb.d_reported_for_c a112 
on (a13.reported_for_c_key = a112.row_key) 
join ldb.d_internal_organization_business_group_c a124 
on (a112.business_group_c_key = a124.row_key) 
