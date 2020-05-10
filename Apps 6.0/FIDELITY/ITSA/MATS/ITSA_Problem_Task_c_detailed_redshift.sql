select 'ldb.f_problem_task a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
union
select 'ldb.d_internal_contact a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_internal_contact a14
on (a11.employee_key = a14.row_key)
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_internal_contact_assigned_to a15
on (a11.assigned_to_key = a15.row_key)
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_internal_organization_group a16
on (a11.assignment_group_key = a16.row_key)
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key)
union
select 'ldb.d_calendar_quarter a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key)
join ldb.d_calendar_quarter a19
on (a18.quarter_start_date_key = a19.row_key)
union
select 'ldb.d_calendar_week a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
join ldb.d_calendar_week a110
on (a17.week_start_date_key = a110.row_key)
union
select 'ldb.d_calendar_year a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key) join ldb.d_calendar_quarter a19
on (a18.quarter_start_date_key = a19.row_key)
join ldb.d_calendar_year a111
on (a19.year_start_date_key = a111.row_key)
union
select 'ldb.d_problem a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem a112
on (a11.problem_key = a112.row_key)
union
select 'ldb.d_problem_task a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task a113
on (a11.problem_task_key = a113.row_key)
union
select 'ldb.d_problem_task_assignment_group_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task a113
on (a11.problem_task_key = a113.row_key)
join ldb.d_problem_task_assignment_group_c a114
on (a113.assignment_group_c_key = a114.row_key)
union
select 'ldb.d_problem_task_configuration_item_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task a113
on (a11.problem_task_key = a113.row_key)
join ldb.d_problem_task_configuration_item_c a115
on (a113.configuration_item_c_key = a115.row_key)
union
select 'ldb.d_application_mdm a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_mdm a116
on (a12.mdm_key = a116.row_key)
union
select 'ldb.d_business_service a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_business_service a117
on (a11.business_service_key = a117.row_key)
union
select 'ldb.d_configuration_item_mdm a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_configuration_item_mdm a118
on (a13.mdm_key = a118.row_key)
union
select 'ldb.d_internal_contact_mdm a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_internal_contact a14
on (a11.employee_key = a14.row_key)
join ldb.d_internal_contact_mdm a119
on (a14.employee_mdm_key = a119.row_key)
union
select 'ldb.d_location a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_location a120
on (a11.location_key = a120.row_key)
union
select 'ldb.d_problem_assignment_group a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_assignment_group a121
on (a11.problem_assignment_group_key = a121.row_key)
union
select 'ldb.d_problem_priority a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_priority a122
on (a11.problem_priority_src_key = a122.row_key)
union
select 'ldb.d_problem_task_approval a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task_approval a123
on (a11.approval_src_key = a123.row_key)
union
select 'ldb.d_problem_task_reported_type a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task_reported_type a124
on (a11.reported_type_src_key = a124.row_key)
union
select 'ldb.d_problem_task_impact a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task_impact a125
on (a11.impact_src_key = a125.row_key)
union
select 'ldb.d_problem_task_priority a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task_priority a126
on (a11.priority_src_key = a126.row_key)
union
select 'ldb.d_problem_task_state a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task_state a127
on (a11.state_src_key = a127.row_key)
union
select 'ldb.d_problem_task_urgency a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task_urgency a128
on (a11.urgency_src_key = a128.row_key)
union
select 'ldb.d_problem_state a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_state a129
on (a11.problem_state_src_key = a129.row_key)