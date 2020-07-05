select 'ldb.f_change_task a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
union
select 'ldb.d_change_task_employee a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task_employee a13
on (a11.change_task_employee_key = a13.row_key)
union
select 'ldb.d_configuration_item a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_configuration_item a14
on (a11.configuration_item_key = a14.row_key)
union
select 'ldb.d_internal_contact a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_internal_contact a15
on (a11.employee_key = a15.row_key)
union
select 'ldb.d_segment_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_segment_c a16
on (a11.segment_c_key = a16.row_key)
union
select 'ldb.d_change_task a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a17
on (a11.change_task_key = a17.row_key)
union
select 'ldb.d_internal_contact_assigned_to a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_internal_contact_assigned_to a18
on (a11.assigned_to_key = a18.row_key)
union
select 'ldb.d_internal_organization_group a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_internal_organization_group a19
on (a11.assignment_group_key = a19.row_key)
union
select 'ldb.d_calendar_date a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_calendar_date a110
on (a11.date_key = a110.row_key)
union
select 'ldb.d_change_request a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request a111
on (a11.change_request_key = a111.row_key)
union
select 'ldb.d_change_task_application a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a17
on (a11.change_task_key = a17.row_key)
join ldb.d_change_task_application a112
on (a17.application_key = a112.row_key)
union
select 'ldb.d_change_task_assigned_to a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a17
on (a11.change_task_key = a17.row_key)
join ldb.d_change_task_assigned_to a113
on (a17.assigned_to_key = a113.row_key)
union
select 'ldb.d_change_task_assignment_group a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a17
on (a11.change_task_key = a17.row_key)
join ldb.d_change_task_assignment_group a114
on (a17.assignment_group_key = a114.row_key)
union
select 'ldb.d_change_task_date a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task_date a115
on (a11.change_task_date_key = a115.row_key)
union
select 'ldb.d_change_task_configuration_item a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a17
on (a11.change_task_key = a17.row_key)
join ldb.d_change_task_configuration_item a116
on (a17.configuration_item_key = a116.row_key)
union
select 'ldb.d_change_task_configuration_item_mdm a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a17
on (a11.change_task_key = a17.row_key) join ldb.d_change_task_configuration_item a116
on (a17.configuration_item_key = a116.row_key)
join ldb.d_change_task_configuration_item_mdm a117
on (a116.mdm_key = a117.row_key)
union
select 'ldb.d_application_mdm a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_mdm a118
on (a12.mdm_key = a118.row_key)
union
select 'ldb.d_business_service a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_business_service a119
on (a11.business_service_key = a119.row_key)
union
select 'ldb.d_change_request_priority a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request_priority a120
on (a11.parent_priority_src_key = a120.row_key)
union
select 'ldb.d_change_request_state a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request_state a121
on (a11.parent_state_src_key = a121.row_key)
union
select 'ldb.d_change_task_employee_mdm a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task_employee a13
on (a11.change_task_employee_key = a13.row_key)
join ldb.d_change_task_employee_mdm a122
on (a13.employee_mdm_key = a122.row_key)
union
select 'ldb.d_change_request_type a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request_type a123
on (a11.parent_type_src_key = a123.row_key)
union
select 'ldb.d_configuration_item_mdm a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_configuration_item a14
on (a11.configuration_item_key = a14.row_key)
join ldb.d_configuration_item_mdm a124
on (a14.mdm_key = a124.row_key)
union
select 'ldb.d_internal_contact_mdm a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_internal_contact a15
on (a11.employee_key = a15.row_key)
join ldb.d_internal_contact_mdm a125
on (a15.employee_mdm_key = a125.row_key)
union
select 'ldb.d_location a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_location a126
on (a11.location_key = a126.row_key)
union
select 'ldb.d_lov_segment_type_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_segment_c a16
on (a11.segment_c_key = a16.row_key)
join ldb.d_lov_segment_type_c a127
on (a16.segment_type_c_key = a127.row_key)
union
select 'ldb.d_change_request_assignment_group a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request_assignment_group a128
on (a11.parent_assignment_group_key = a128.row_key)
union
select 'ldb.d_change_request_close_code a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request a111
on (a11.change_request_key = a111.row_key)
join ldb.d_change_request_close_code a129
on (a111.close_code_src_key = a129.row_key)
union
select 'ldb.d_change_request_phase a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request a111
on (a11.change_request_key = a111.row_key)
join ldb.d_change_request_phase a130
on (a111.phase_src_key = a130.row_key)
union
select 'ldb.d_change_request_phase_state a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request a111
on (a11.change_request_key = a111.row_key)
join ldb.d_change_request_phase_state a131
on (a111.phase_state_src_key = a131.row_key)
union
select 'ldb.d_change_task_application_mdm a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a17
on (a11.change_task_key = a17.row_key) join ldb.d_change_task_application a112
on (a17.application_key = a112.row_key)
join ldb.d_change_task_application_mdm a132
on (a112.mdm_key = a132.row_key)
union
select 'ldb.d_change_task_approval a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a17
on (a11.change_task_key = a17.row_key)
join ldb.d_change_task_approval a133
on (a17.approval_src_key = a133.row_key)
union
select 'ldb.d_change_task_business_service a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a17
on (a11.change_task_key = a17.row_key)
join ldb.d_change_task_business_service a134
on (a17.business_service_key = a134.row_key)
union
select 'ldb.d_change_task_calendar_month a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task_date a115
on (a11.change_task_date_key = a115.row_key)
join ldb.d_change_task_calendar_month a135
on (a115.month_start_date_key = a135.row_key)
union
select 'ldb.d_change_task_reported_type a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a17
on (a11.change_task_key = a17.row_key)
join ldb.d_change_task_reported_type a136
on (a17.reported_type_src_key = a136.row_key)
union
select 'ldb.d_change_task_impact a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a17
on (a11.change_task_key = a17.row_key)
join ldb.d_change_task_impact a137
on (a17.impact_src_key = a137.row_key)
union
select 'ldb.d_change_task_location a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a17
on (a11.change_task_key = a17.row_key)
join ldb.d_change_task_location a138
on (a17.location_key = a138.row_key)
union
select 'ldb.d_change_task_priority a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a17
on (a11.change_task_key = a17.row_key)
join ldb.d_change_task_priority a139
on (a17.priority_src_key = a139.row_key)
union
select 'ldb.d_change_task_state a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a17
on (a11.change_task_key = a17.row_key)
join ldb.d_change_task_state a140
on (a17.state_src_key = a140.row_key)
union
select 'ldb.d_change_task_task_type a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a17
on (a11.change_task_key = a17.row_key)
join ldb.d_change_task_task_type a141
on (a17.task_type_src_key = a141.row_key)
union
select 'ldb.d_change_task_urgency a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a17
on (a11.change_task_key = a17.row_key)
join ldb.d_change_task_urgency a142
on (a17.urgency_src_key = a142.row_key)
union
select 'ldb.d_change_task_tribe_c a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a17
on (a11.change_task_key = a17.row_key) join ldb.d_change_task_configuration_item a116
on (a17.configuration_item_key = a116.row_key) join ldb.d_change_task_configuration_item_mdm a117
on (a116.mdm_key = a117.row_key)
join ldb.d_change_task_tribe_c a143
on (a117.change_task_tribe_c_key = a143.row_key)