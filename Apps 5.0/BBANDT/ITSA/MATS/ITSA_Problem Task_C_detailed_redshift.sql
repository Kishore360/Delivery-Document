select 'ldb.f_problem_task_closed a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
union
select 'ldb.d_archer_application_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_archer_application_c a12
on (a11.application_archer_c_key = a12.row_key)
union
select 'ldb.d_software_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_software_c a13
on (a11.archer_id_c_key = a13.row_key)
union
select 'ldb.d_internal_contact a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_internal_contact a14
on (a11.closed_by_key = a14.row_key)
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_internal_contact_assigned_to a15
on (a11.assigned_to_key = a15.row_key)
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_internal_organization_group a16
on (a11.assignment_group_key = a16.row_key)
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_calendar_date a17
on (a11.closed_on_key = a17.row_key)
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_calendar_date a17
on (a11.closed_on_key = a17.row_key)
join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key)
union
select 'ldb.d_problem a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_problem a19
on (a11.problem_key = a19.row_key)
union
select 'ldb.d_problem_task a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_problem_task a110
on (a11.problem_task_key = a110.row_key)
union
select 'ldb.d_application a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_application a111
on (a11.application_key = a111.row_key)
union
select 'ldb.d_business_service a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_business_service a112
on (a11.business_service_key = a112.row_key)
union
select 'ldb.d_configuration_item a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_configuration_item a113
on (a11.configuration_item_key = a113.row_key)
union
select 'ldb.d_internal_contact_mdm a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_internal_contact a14
on (a11.closed_by_key = a14.row_key)
join ldb.d_internal_contact_mdm a114
on (a14.row_current_key = a114.row_current_key)
union
select 'ldb.d_location a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_location a115
on (a11.location_key = a115.row_key)
union
select 'ldb.d_problem_assignment_group a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_problem_assignment_group a116
on (a11.problem_assignment_group_key = a116.row_key)
union
select 'ldb.d_problem_priority a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_problem_priority a117
on (a11.problem_priority_src_key = a117.row_key)
union
select 'ldb.d_problem_task_approval a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_problem_task_approval a118
on (a11.approval_src_key = a118.row_key)
union
select 'ldb.d_problem_task_reported_type a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_problem_task_reported_type a119
on (a11.reported_type_src_key = a119.row_key)
union
select 'ldb.d_problem_task_impact a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_problem_task_impact a120
on (a11.impact_src_key = a120.row_key)
union
select 'ldb.d_problem_task_priority a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_problem_task_priority a121
on (a11.priority_src_key = a121.row_key)
union
select 'ldb.d_problem_task_state a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_problem_task_state a122
on (a11.state_src_key = a122.row_key)
union
select 'ldb.d_problem_task_urgency a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_problem_task_urgency a123
on (a11.urgency_src_key = a123.row_key)
union
select 'ldb.d_internal_contact_problem_dim_assigned_to_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_problem a19
on (a11.problem_key = a19.row_key)
join ldb.d_internal_contact_problem_dim_assigned_to_c a124
on (a19.assigned_to_key = a124.row_key)
union
select 'ldb.d_problem_state a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_problem_state a125
on (a11.problem_state_src_key = a125.row_key)