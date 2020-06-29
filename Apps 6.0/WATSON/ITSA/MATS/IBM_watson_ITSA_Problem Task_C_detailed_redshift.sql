select 'ldb.f_problem_task a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
union
select 'ldb.d_problem a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem a12
on (a11.problem_key = a12.row_key)
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_internal_contact a13
on (a11.opened_by_key = a13.row_key)
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_internal_contact_assigned_to a14
on (a11.assigned_to_key = a14.row_key)
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key)
union
select 'ldb.d_calendar_date a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_calendar_date a16
on (a11.opened_on_key = a16.row_key)
union
select 'ldb.d_problem_task a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task a17
on (a11.problem_task_key = a17.row_key)
union
select 'ldb.d_tribe_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_tribe_c a18
on (a11.tribe_c_key = a18.row_key)
union
select 'ldb.d_segment_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_tribe_c a18
on (a11.tribe_c_key = a18.row_key)
join ldb.d_segment_c a19
on (a18.segment_c_key = a19.row_key)
union
select 'ldb.d_application a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_application a110
on (a11.application_key = a110.row_key)
union
select 'ldb.d_business_service a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_business_service a111
on (a11.business_service_key = a111.row_key)
union
select 'ldb.d_configuration_item a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_configuration_item a112
on (a11.configuration_item_key = a112.row_key)
union
select 'ldb.d_internal_contact_mdm a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_internal_contact a13
on (a11.opened_by_key = a13.row_key)
join ldb.d_internal_contact_mdm a113
on (a13.row_current_key = a113.row_current_key)
union
select 'ldb.d_location a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_location a114
on (a11.location_key = a114.row_key)
union
select 'ldb.d_problem_assignment_group a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_assignment_group a115
on (a11.problem_assignment_group_key = a115.row_key)
union
select 'ldb.d_problem_priority a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_priority a116
on (a11.problem_priority_src_key = a116.row_key)
union
select 'ldb.d_problem_task_approval a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task_approval a117
on (a11.approval_src_key = a117.row_key)
union
select 'ldb.d_problem_task_reported_type a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task_reported_type a118
on (a11.reported_type_src_key = a118.row_key)
union
select 'ldb.d_problem_task_impact a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task_impact a119
on (a11.impact_src_key = a119.row_key)
union
select 'ldb.d_problem_task_priority a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task_priority a120
on (a11.priority_src_key = a120.row_key)
union
select 'ldb.d_problem_task_state a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task_state a121
on (a11.state_src_key = a121.row_key)
union
select 'ldb.d_problem_task_urgency a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task_urgency a122
on (a11.urgency_src_key = a122.row_key)
union
select 'ldb.d_lov_problem_status_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem a12
on (a11.problem_key = a12.row_key)
join ldb.d_lov_problem_status_c a123
on (a12.status_src_c_key = a123.row_key)
union
select 'ldb.d_calendar_month a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_calendar_date a16
on (a11.opened_on_key = a16.row_key)
join ldb.d_calendar_month a124
on (a16.month_start_date_key = a124.row_key)
union
select 'ldb.d_problem_state a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_state a125
on (a11.problem_state_src_key = a125.row_key)
union
select 'ldb.d_lov_segment_type_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_tribe_c a18
on (a11.tribe_c_key = a18.row_key) join ldb.d_segment_c a19
on (a18.segment_c_key = a19.row_key)
join ldb.d_lov_segment_type_c a126
on (a19.segment_type_c_key = a126.row_key)
