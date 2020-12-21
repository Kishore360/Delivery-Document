select 'ldb.f_change_task a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
union
select 'ldb.d_change_task_employee a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task_employee a13
on (a11.change_task_employee_key = a13.row_key)
union
select 'ldb.d_change_request a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key)
union
select 'ldb.d_change_task a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a15
on (a11.change_task_key = a15.row_key)
union
select 'ldb.d_change_task_application a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a15
on (a11.change_task_key = a15.row_key)
join ldb.d_change_task_application a16
on (a15.application_key = a16.row_key)
union
select 'ldb.d_change_task_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a15
on (a11.change_task_key = a15.row_key)
join ldb.d_change_task_assigned_to a17
on (a15.assigned_to_key = a17.row_key)
union
select 'ldb.d_change_task_assignment_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a15
on (a11.change_task_key = a15.row_key)
join ldb.d_change_task_assignment_group a18
on (a15.assignment_group_key = a18.row_key)
union
select 'ldb.d_change_task_date a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task_date a19
on (a11.change_task_date_key = a19.row_key)
union
select 'ldb.d_change_task_configuration_item a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a15
on (a11.change_task_key = a15.row_key)
join ldb.d_change_task_configuration_item a110
on (a15.configuration_item_key = a110.row_key)
union
select 'ldb.d_change_request_priority a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request_priority a111
on (a11.parent_priority_src_key = a111.row_key)
union
select 'ldb.d_change_task_employee_mdm a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task_employee a13
on (a11.change_task_employee_key = a13.row_key)
join ldb.d_change_task_employee_mdm a112
on (a13.employee_mdm_key = a112.row_key)
union
select 'ldb.d_change_request_assignment_group a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request_assignment_group a113
on (a11.parent_assignment_group_key = a113.row_key)
union
select 'ldb.d_change_request_close_code a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key)
join ldb.d_change_request_close_code a114
on (a14.close_code_src_key = a114.row_key)
union
select 'ldb.d_change_request_phase a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key)
join ldb.d_change_request_phase a115
on (a14.phase_src_key = a115.row_key)
union
select 'ldb.d_change_request_phase_state a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key)
join ldb.d_change_request_phase_state a116
on (a14.phase_state_src_key = a116.row_key)
union
select 'ldb.d_change_request_state a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request_state a117
on (a11.parent_state_src_key = a117.row_key)
union
select 'ldb.d_change_task_application_mdm a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a15
on (a11.change_task_key = a15.row_key) join ldb.d_change_task_application a16
on (a15.application_key = a16.row_key)
join ldb.d_change_task_application_mdm a118
on (a16.mdm_key = a118.row_key)
union
select 'ldb.d_change_task_approval a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a15
on (a11.change_task_key = a15.row_key)
join ldb.d_change_task_approval a119
on (a15.approval_src_key = a119.row_key)
union
select 'ldb.d_change_task_business_service a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a15
on (a11.change_task_key = a15.row_key)
join ldb.d_change_task_business_service a120
on (a15.business_service_key = a120.row_key)
union
select 'ldb.d_change_task_configuration_item_mdm a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a15
on (a11.change_task_key = a15.row_key) join ldb.d_change_task_configuration_item a110
on (a15.configuration_item_key = a110.row_key)
join ldb.d_change_task_configuration_item_mdm a121
on (a110.mdm_key = a121.row_key)
union
select 'ldb.d_change_task_reported_type a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a15
on (a11.change_task_key = a15.row_key)
join ldb.d_change_task_reported_type a122
on (a15.reported_type_src_key = a122.row_key)
union
select 'ldb.d_change_task_impact a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a15
on (a11.change_task_key = a15.row_key)
join ldb.d_change_task_impact a123
on (a15.impact_src_key = a123.row_key)
union
select 'ldb.d_change_task_location a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a15
on (a11.change_task_key = a15.row_key)
join ldb.d_change_task_location a124
on (a15.location_key = a124.row_key)
union
select 'ldb.d_change_task_priority a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a15
on (a11.change_task_key = a15.row_key)
join ldb.d_change_task_priority a125
on (a15.priority_src_key = a125.row_key)
union
select 'ldb.d_change_task_state a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a15
on (a11.change_task_key = a15.row_key)
join ldb.d_change_task_state a126
on (a15.state_src_key = a126.row_key)
union
select 'ldb.d_change_task_task_type a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a15
on (a11.change_task_key = a15.row_key)
join ldb.d_change_task_task_type a127
on (a15.task_type_src_key = a127.row_key)
union
select 'ldb.d_change_task_urgency a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a15
on (a11.change_task_key = a15.row_key)
join ldb.d_change_task_urgency a128
on (a15.urgency_src_key = a128.row_key)
union
select 'ldb.d_change_request_type a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request_type a129
on (a11.parent_type_src_key = a129.row_key)
union
select 'ldb.d_change_task_assignment_group_manager a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a15
on (a11.change_task_key = a15.row_key) join ldb.d_change_task_assignment_group a18
on (a15.assignment_group_key = a18.row_key)
join ldb.d_change_task_assignment_group_manager a130
on (a18.manager_key = a130.row_key)


