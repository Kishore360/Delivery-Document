select 'ldb.f_change_task a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
union
select 'ldb.d_internal_contact a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_internal_contact a14
on (a11.employee_key = a14.row_key)
union
select 'ldb.d_segment_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_segment_c a15
on (a11.segment_c_key = a15.row_key)
union
select 'ldb.d_change_task a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a16
on (a11.change_task_key = a16.row_key)
union
select 'ldb.d_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_internal_contact_assigned_to a17
on (a11.assigned_to_key = a17.row_key)
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_internal_organization_group a18
on (a11.assignment_group_key = a18.row_key)
union
select 'ldb.d_calendar_date a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key)
union
select 'ldb.d_change_request a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request a110
on (a11.change_request_key = a110.row_key)
union
select 'ldb.d_application_mdm a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_mdm a111
on (a12.mdm_key = a111.row_key)
union
select 'ldb.d_business_service a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_business_service a112
on (a11.business_service_key = a112.row_key)
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
select 'ldb.d_change_task_tribe_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task_tribe_c a116
on (a11.tribe_c_key = a116.row_key)
union
select 'ldb.d_change_request_type a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request_type a117
on (a11.parent_type_src_key = a117.row_key)
union
select 'ldb.d_configuration_item_mdm a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_configuration_item_mdm a118
on (a13.mdm_key = a118.row_key)
union
select 'ldb.d_internal_contact_mdm a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_internal_contact a14
on (a11.employee_key = a14.row_key)
join ldb.d_internal_contact_mdm a119
on (a14.employee_mdm_key = a119.row_key)
union
select 'ldb.d_location a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_location a120
on (a11.location_key = a120.row_key)
union
select 'ldb.d_lov_segment_type_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_segment_c a15
on (a11.segment_c_key = a15.row_key)
join ldb.d_lov_segment_type_c a121
on (a15.segment_type_c_key = a121.row_key)
union
select 'ldb.d_calendar_month a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key)
join ldb.d_calendar_month a122
on (a19.month_start_date_key = a122.row_key)
union
select 'ldb.d_change_request_close_code a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request a110
on (a11.change_request_key = a110.row_key)
join ldb.d_change_request_close_code a123
on (a110.close_code_src_key = a123.row_key)
union
select 'ldb.d_change_request_phase a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request a110
on (a11.change_request_key = a110.row_key)
join ldb.d_change_request_phase a124
on (a110.phase_src_key = a124.row_key)
union
select 'ldb.d_change_request_phase_state a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request a110
on (a11.change_request_key = a110.row_key)
join ldb.d_change_request_phase_state a125
on (a110.phase_state_src_key = a125.row_key)
union
select 'ldb.d_change_task_approval a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a16
on (a11.change_task_key = a16.row_key)
join ldb.d_change_task_approval a126
on (a16.approval_src_key = a126.row_key)
union
select 'ldb.d_change_task_reported_type a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a16
on (a11.change_task_key = a16.row_key)
join ldb.d_change_task_reported_type a127
on (a16.reported_type_src_key = a127.row_key)
union
select 'ldb.d_change_task_impact a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a16
on (a11.change_task_key = a16.row_key)
join ldb.d_change_task_impact a128
on (a16.impact_src_key = a128.row_key)
union
select 'ldb.d_change_task_priority a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a16
on (a11.change_task_key = a16.row_key)
join ldb.d_change_task_priority a129
on (a16.priority_src_key = a129.row_key)
union
select 'ldb.d_change_task_state a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a16
on (a11.change_task_key = a16.row_key)
join ldb.d_change_task_state a130
on (a16.state_src_key = a130.row_key)
union
select 'ldb.d_change_task_task_type a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a16
on (a11.change_task_key = a16.row_key)
join ldb.d_change_task_task_type a131
on (a16.task_type_src_key = a131.row_key)
union
select 'ldb.d_change_task_urgency a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a16
on (a11.change_task_key = a16.row_key)
join ldb.d_change_task_urgency a132
on (a16.urgency_src_key = a132.row_key)

