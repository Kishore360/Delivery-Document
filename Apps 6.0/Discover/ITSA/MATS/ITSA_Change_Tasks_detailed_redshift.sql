select 'ldb.f_change_task a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
union
select 'ldb.d_internal_contact_assigned_to a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_internal_contact_assigned_to a13
on (a11.assigned_to_key = a13.row_key)
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key)
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_calendar_date a15
on (a11.date_key = a15.row_key)
union
select 'ldb.d_change_request a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
union
select 'ldb.d_change_task a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a17
on (a11.change_task_key = a17.row_key)
union
select 'ldb.d_configuration_item a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_configuration_item a18
on (a11.configuration_item_key = a18.row_key)
union
select 'ldb.d_internal_contact a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_internal_contact a19
on (a11.employee_key = a19.row_key)
union
select 'ldb.d_calendar_month a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_calendar_date a15
on (a11.date_key = a15.row_key)
join ldb.d_calendar_month a110
on (a15.month_start_date_key = a110.row_key)
union
select 'ldb.d_calendar_quarter a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_calendar_date a15
on (a11.date_key = a15.row_key) join ldb.d_calendar_month a110
on (a15.month_start_date_key = a110.row_key)
join ldb.d_calendar_quarter a111
on (a110.quarter_start_date_key = a111.row_key)
union
select 'ldb.d_calendar_year a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_calendar_date a15
on (a11.date_key = a15.row_key) join ldb.d_calendar_month a110
on (a15.month_start_date_key = a110.row_key) join ldb.d_calendar_quarter a111
on (a110.quarter_start_date_key = a111.row_key)
join ldb.d_calendar_year a112
on (a111.year_start_date_key = a112.row_key)
union
select 'ldb.d_business_service a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_business_service a113
on (a11.business_service_key = a113.row_key)
union
select 'ldb.d_change_request_assignment_group a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request_assignment_group a114
on (a11.parent_assignment_group_key = a114.row_key)
union
select 'ldb.d_change_request_priority a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request_priority a115
on (a11.parent_priority_src_key = a115.row_key)
union
select 'ldb.d_change_request_state a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request_state a116
on (a11.parent_state_src_key = a116.row_key)
union
select 'ldb.d_change_request_type a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request_type a117
on (a11.parent_type_src_key = a117.row_key)
union
select 'ldb.d_location a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_location a118
on (a11.location_key = a118.row_key)
union
select 'ldb.d_application_mdm a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_mdm a119
on (a12.mdm_key = a119.row_key)
union
select 'ldb.d_change_request_close_code a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
join ldb.d_change_request_close_code a120
on (a16.close_code_src_key = a120.row_key)
union
select 'ldb.d_change_request_phase a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
join ldb.d_change_request_phase a121
on (a16.phase_src_key = a121.row_key)
union
select 'ldb.d_change_request_phase_state a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
join ldb.d_change_request_phase_state a122
on (a16.phase_state_src_key = a122.row_key)
union
select 'ldb.d_change_task_approval a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a17
on (a11.change_task_key = a17.row_key)
join ldb.d_change_task_approval a123
on (a17.approval_src_key = a123.row_key)
union
select 'ldb.d_change_task_reported_type a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a17
on (a11.change_task_key = a17.row_key)
join ldb.d_change_task_reported_type a124
on (a17.reported_type_src_key = a124.row_key)
union
select 'ldb.d_change_task_impact a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a17
on (a11.change_task_key = a17.row_key)
join ldb.d_change_task_impact a125
on (a17.impact_src_key = a125.row_key)
union
select 'ldb.d_change_task_priority a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a17
on (a11.change_task_key = a17.row_key)
join ldb.d_change_task_priority a126
on (a17.priority_src_key = a126.row_key)
union
select 'ldb.d_change_task_state a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a17
on (a11.change_task_key = a17.row_key)
join ldb.d_change_task_state a127
on (a17.state_src_key = a127.row_key)
union
select 'ldb.d_change_task_task_type a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a17
on (a11.change_task_key = a17.row_key)
join ldb.d_change_task_task_type a128
on (a17.task_type_src_key = a128.row_key)
union
select 'ldb.d_change_task_urgency a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a17
on (a11.change_task_key = a17.row_key)
join ldb.d_change_task_urgency a129
on (a17.urgency_src_key = a129.row_key)
union
select 'ldb.d_configuration_item_mdm a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_configuration_item a18
on (a11.configuration_item_key = a18.row_key)
join ldb.d_configuration_item_mdm a130
on (a18.mdm_key = a130.row_key)
union
select 'ldb.d_internal_contact_mdm a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_internal_contact a19
on (a11.employee_key = a19.row_key)
join ldb.d_internal_contact_mdm a131
on (a19.employee_mdm_key = a131.row_key)