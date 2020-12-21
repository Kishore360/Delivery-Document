select 'ldb.f_problem_task a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
union
select 'ldb.d_problem_task_employee a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task_employee a12
on (a11.problem_task_employee_key = a12.row_key)
union
select 'ldb.d_problem a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem a13
on (a11.problem_key = a13.row_key)
union
select 'ldb.d_problem_task a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task a14
on (a11.problem_task_key = a14.row_key)
union
select 'ldb.d_problem_task_application a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task a14
on (a11.problem_task_key = a14.row_key)
join ldb.d_problem_task_application a15
on (a14.application_key = a15.row_key)
union
select 'ldb.d_problem_task_assigned_to a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task a14
on (a11.problem_task_key = a14.row_key)
join ldb.d_problem_task_assigned_to a16
on (a14.assigned_to_key = a16.row_key)
union
select 'ldb.d_problem_task_assignment_group a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task a14
on (a11.problem_task_key = a14.row_key)
join ldb.d_problem_task_assignment_group a17
on (a14.assignment_group_key = a17.row_key)
union
select 'ldb.d_problem_task_date a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task_date a18
on (a11.problem_task_date_key = a18.row_key)
union
select 'ldb.d_problem_task_configuration_item a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task a14
on (a11.problem_task_key = a14.row_key)
join ldb.d_problem_task_configuration_item a19
on (a14.configuration_item_key = a19.row_key)
union
select 'ldb.d_problem_priority a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_priority a110
on (a11.problem_priority_src_key = a110.row_key)
union
select 'ldb.d_problem_task_approval a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task_approval a111
on (a11.approval_src_key = a111.row_key)
union
select 'ldb.d_problem_task_reported_type a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task_reported_type a112
on (a11.reported_type_src_key = a112.row_key)
union
select 'ldb.d_problem_task_employee_mdm a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task_employee a12
on (a11.problem_task_employee_key = a12.row_key)
join ldb.d_problem_task_employee_mdm a113
on (a12.employee_mdm_key = a113.row_key)
union
select 'ldb.d_problem_task_impact a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task_impact a114
on (a11.impact_src_key = a114.row_key)
union
select 'ldb.d_problem_task_priority a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task_priority a115
on (a11.priority_src_key = a115.row_key)
union
select 'ldb.d_problem_task_state a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task_state a116
on (a11.state_src_key = a116.row_key)
union
select 'ldb.d_problem_task_urgency a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task_urgency a117
on (a11.urgency_src_key = a117.row_key)
union
select 'ldb.d_problem_assignment_group a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_assignment_group a118
on (a11.problem_assignment_group_key = a118.row_key)
union
select 'ldb.d_problem_state a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_state a119
on (a11.problem_state_src_key = a119.row_key)
union
select 'ldb.d_problem_task_application_mdm a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task a14
on (a11.problem_task_key = a14.row_key) join ldb.d_problem_task_application a15
on (a14.application_key = a15.row_key)
join ldb.d_problem_task_application_mdm a120
on (a15.mdm_key = a120.row_key)
union
select 'ldb.d_problem_task_business_service a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task a14
on (a11.problem_task_key = a14.row_key)
join ldb.d_problem_task_business_service a121
on (a14.business_service_key = a121.row_key)
union
select 'ldb.d_problem_task_calendar_month a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task_date a18
on (a11.problem_task_date_key = a18.row_key)
join ldb.d_problem_task_calendar_month a122
on (a18.month_start_date_key = a122.row_key)
union
select 'ldb.d_problem_task_configuration_item_mdm a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task a14
on (a11.problem_task_key = a14.row_key) join ldb.d_problem_task_configuration_item a19
on (a14.configuration_item_key = a19.row_key)
join ldb.d_problem_task_configuration_item_mdm a123
on (a19.mdm_key = a123.row_key)
union
select 'ldb.d_problem_task_location a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task a14
on (a11.problem_task_key = a14.row_key)
join ldb.d_problem_task_location a124
on (a14.location_key = a124.row_key)
union
select 'ldb.d_problem_task_assignment_group_manager a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task a14
on (a11.problem_task_key = a14.row_key) join ldb.d_problem_task_assignment_group a17
on (a14.assignment_group_key = a17.row_key)
join ldb.d_problem_task_assignment_group_manager a125
on (a17.manager_key = a125.row_key)



