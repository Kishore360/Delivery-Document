select 'ldb.f_change_task a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_internal_contact a13
on (a11.employee_key = a13.row_key)
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_internal_contact_assigned_to a14
on (a11.assigned_to_key = a14.row_key)
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key)
union
select 'ldb.d_change_task a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a16
on (a11.change_task_key = a16.row_key)
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
union
select 'ldb.d_change_request a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request a18
on (a11.change_request_key = a18.row_key)
union
select 'ldb.d_calendar_month a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
join ldb.d_calendar_month a19
on (a17.month_start_date_key = a19.row_key)
union
select 'ldb.d_calendar_quarter a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a19
on (a17.month_start_date_key = a19.row_key)
join ldb.d_calendar_quarter a110
on (a19.quarter_start_date_key = a110.row_key)
union
select 'ldb.d_calendar_week a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
join ldb.d_calendar_week a111
on (a17.week_start_date_key = a111.row_key)
union
select 'ldb.d_calendar_year a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a19
on (a17.month_start_date_key = a19.row_key) join ldb.d_calendar_quarter a110
on (a19.quarter_start_date_key = a110.row_key)
join ldb.d_calendar_year a112
on (a110.year_start_date_key = a112.row_key)
union
select 'ldb.d_change_request_assignment_group a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request_assignment_group a113
on (a11.parent_assignment_group_key = a113.row_key)
union
select 'ldb.d_change_request_priority a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request_priority a114
on (a11.parent_priority_src_key = a114.row_key)
union
select 'ldb.d_change_request_state a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request_state a115
on (a11.parent_state_src_key = a115.row_key)
union
select 'ldb.d_change_request_type a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request_type a116
on (a11.parent_type_src_key = a116.row_key)
union
select 'ldb.d_configuration_item_mdm a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_configuration_item_mdm a117
on (a12.mdm_key = a117.row_key)
union
select 'ldb.d_internal_contact_mdm a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_internal_contact a13
on (a11.employee_key = a13.row_key)
join ldb.d_internal_contact_mdm a118
on (a13.employee_mdm_key = a118.row_key)
union
select 'ldb.d_location a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_location a119
on (a11.location_key = a119.row_key)
union
select 'ldb.d_lov_change_task_backout_during_implementation_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a16
on (a11.change_task_key = a16.row_key)
join ldb.d_lov_change_task_backout_during_implementation_c a120
on (a16.backout_during_implementation_src_c_key = a120.row_key)
union
select 'ldb.d_change_request_close_code a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request a18
on (a11.change_request_key = a18.row_key)
join ldb.d_change_request_close_code a121
on (a18.close_code_src_key = a121.row_key)
union
select 'ldb.d_change_request_phase a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request a18
on (a11.change_request_key = a18.row_key)
join ldb.d_change_request_phase a122
on (a18.phase_src_key = a122.row_key)
union
select 'ldb.d_change_request_phase_state a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request a18
on (a11.change_request_key = a18.row_key)
join ldb.d_change_request_phase_state a123
on (a18.phase_state_src_key = a123.row_key)
union
select 'ldb.d_change_task_approval a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a16
on (a11.change_task_key = a16.row_key)
join ldb.d_change_task_approval a124
on (a16.approval_src_key = a124.row_key)
union
select 'ldb.d_change_task_reported_type a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a16
on (a11.change_task_key = a16.row_key)
join ldb.d_change_task_reported_type a125
on (a16.reported_type_src_key = a125.row_key)
union
select 'ldb.d_change_task_impact a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a16
on (a11.change_task_key = a16.row_key)
join ldb.d_change_task_impact a126
on (a16.impact_src_key = a126.row_key)
union
select 'ldb.d_change_task_priority a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a16
on (a11.change_task_key = a16.row_key)
join ldb.d_change_task_priority a127
on (a16.priority_src_key = a127.row_key)
union
select 'ldb.d_change_task_state a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a16
on (a11.change_task_key = a16.row_key)
join ldb.d_change_task_state a128
on (a16.state_src_key = a128.row_key)
union
select 'ldb.d_change_task_urgency a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a16
on (a11.change_task_key = a16.row_key)
join ldb.d_change_task_urgency a129
on (a16.urgency_src_key = a129.row_key)
union
select 'ldb.d_lov_change_task_implementation_method_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a16
on (a11.change_task_key = a16.row_key)
join ldb.d_lov_change_task_implementation_method_c a130
on (a16.implementation_method_src_c_key = a130.row_key)
union
select 'ldb.d_lov_change_task_source_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a16
on (a11.change_task_key = a16.row_key)
join ldb.d_lov_change_task_source_c a131
on (a16.task_source_src_c_key = a131.row_key)
union
select 'ldb.d_lov_change_task_type_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a16
on (a11.change_task_key = a16.row_key)
join ldb.d_lov_change_task_type_c a132
on (a16.type_src_c_key = a132.row_key)