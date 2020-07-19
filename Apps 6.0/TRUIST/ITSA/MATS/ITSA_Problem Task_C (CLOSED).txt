select 'ldb.f_problem_task_closed a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
union
select 'ldb.d_archer_application_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_archer_application_c a13
on (a11.application_archer_c_key = a13.row_key)
union
select 'ldb.d_archer_software_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_archer_software_c a14
on (a11.archer_id_c_key = a14.row_key)
union
select 'ldb.d_configuration_item a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_configuration_item a15
on (a11.configuration_item_key = a15.row_key)
union
select 'ldb.d_internal_contact a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_internal_contact a16
on (a11.employee_key = a16.row_key)
union
select 'ldb.d_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_internal_contact_assigned_to a17
on (a11.assigned_to_key = a17.row_key)
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_internal_organization_group a18
on (a11.assignment_group_key = a18.row_key)
union
select 'ldb.d_calendar_date a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key)
union
select 'ldb.d_calendar_month a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key)
join ldb.d_calendar_month a110
on (a19.month_start_date_key = a110.row_key)
union
select 'ldb.d_calendar_quarter a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key) join ldb.d_calendar_month a110
on (a19.month_start_date_key = a110.row_key)
join ldb.d_calendar_quarter a111
on (a110.quarter_start_date_key = a111.row_key)
union
select 'ldb.d_calendar_year a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key) join ldb.d_calendar_month a110
on (a19.month_start_date_key = a110.row_key) join ldb.d_calendar_quarter a111
on (a110.quarter_start_date_key = a111.row_key)
join ldb.d_calendar_year a112
on (a111.year_start_date_key = a112.row_key)
union
select 'ldb.d_problem a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_problem a113
on (a11.problem_key = a113.row_key)
union
select 'ldb.d_problem_task a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_problem_task a114
on (a11.problem_task_key = a114.row_key)
union
select 'ldb.d_application_mdm a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_mdm a115
on (a12.mdm_key = a115.row_key)
union
select 'ldb.d_business_service a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_business_service a116
on (a11.business_service_key = a116.row_key)
union
select 'ldb.d_configuration_item_mdm a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_configuration_item a15
on (a11.configuration_item_key = a15.row_key)
join ldb.d_configuration_item_mdm a117
on (a15.mdm_key = a117.row_key)
union
select 'ldb.d_internal_contact_mdm a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_internal_contact a16
on (a11.employee_key = a16.row_key)
join ldb.d_internal_contact_mdm a118
on (a16.employee_mdm_key = a118.row_key)
union
select 'ldb.d_location a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_location a119
on (a11.location_key = a119.row_key)
union
select 'ldb.d_problem_priority a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_problem_priority a120
on (a11.problem_priority_src_key = a120.row_key)
union
select 'ldb.d_problem_task_approval a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_problem_task_approval a121
on (a11.approval_src_key = a121.row_key)
union
select 'ldb.d_problem_task_reported_type a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_problem_task_reported_type a122
on (a11.reported_type_src_key = a122.row_key)
union
select 'ldb.d_problem_task_impact a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_problem_task_impact a123
on (a11.impact_src_key = a123.row_key)
union
select 'ldb.d_problem_task_priority a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_problem_task_priority a124
on (a11.priority_src_key = a124.row_key)
union
select 'ldb.d_problem_task_state a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_problem_task_state a125
on (a11.state_src_key = a125.row_key)
union
select 'ldb.d_problem_task_urgency a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_problem_task_urgency a126
on (a11.urgency_src_key = a126.row_key)
union
select 'ldb.d_internal_contact_problem_dim_assigned_to_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_problem a113
on (a11.problem_key = a113.row_key)
join ldb.d_internal_contact_problem_dim_assigned_to_c a127
on (a113.assigned_to_key = a127.row_key)
union
select 'ldb.d_problem_assignment_group a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_problem_assignment_group a128
on (a11.problem_assignment_group_key = a128.row_key)
union
select 'ldb.d_problem_state a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_closed a11
join ldb.d_problem_state a129
on (a11.problem_state_src_key = a129.row_key)