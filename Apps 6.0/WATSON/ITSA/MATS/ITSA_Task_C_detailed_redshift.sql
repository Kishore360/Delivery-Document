select 'ldb.f_task a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
union
select 'ldb.d_internal_contact a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_internal_contact a14
on (a11.employee_key = a14.row_key)
union
select 'ldb.d_segment_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_segment_c a15
on (a11.segment_c_key = a15.row_key)
union
select 'ldb.d_internal_contact_assigned_to a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_internal_contact_assigned_to a16
on (a11.assigned_to_key = a16.row_key)
union
select 'ldb.d_internal_organization_group a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_internal_organization_group a17
on (a11.assignment_group_key = a17.row_key)
union
select 'ldb.d_calendar_date a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_calendar_date a18
on (a11.date_key = a18.row_key)
union
select 'ldb.d_task a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a19
on (a11.task_key = a19.row_key)
union
select 'ldb.d_parent_task a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a19
on (a11.task_key = a19.row_key)
join ldb.d_parent_task a110
on (a19.parent_task_key = a110.row_key)
union
select 'ldb.d_application_mdm a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_mdm a111
on (a12.mdm_key = a111.row_key)
union
select 'ldb.d_business_service a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_business_service a112
on (a11.business_service_key = a112.row_key)
union
select 'ldb.d_configuration_item_mdm a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_configuration_item_mdm a113
on (a13.mdm_key = a113.row_key)
union
select 'ldb.d_internal_contact_mdm a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_internal_contact a14
on (a11.employee_key = a14.row_key)
join ldb.d_internal_contact_mdm a114
on (a14.employee_mdm_key = a114.row_key)
union
select 'ldb.d_location a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_location a115
on (a11.location_key = a115.row_key)
union
select 'ldb.d_lov_segment_type_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_segment_c a15
on (a11.segment_c_key = a15.row_key)
join ldb.d_lov_segment_type_c a116
on (a15.segment_type_c_key = a116.row_key)
union
select 'ldb.d_task_tribe_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task_tribe_c a117
on (a11.tribe_c_key = a117.row_key)
union
select 'ldb.d_calendar_month a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_calendar_date a18
on (a11.date_key = a18.row_key)
join ldb.d_calendar_month a118
on (a18.month_start_date_key = a118.row_key)
union
select 'ldb.d_task_approval a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a19
on (a11.task_key = a19.row_key)
join ldb.d_task_approval a119
on (a19.approval_src_key = a119.row_key)
union
select 'ldb.d_task_closed_by a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a19
on (a11.task_key = a19.row_key)
join ldb.d_task_closed_by a120
on (a19.closed_by_key = a120.row_key)
union
select 'ldb.d_task_contacttype a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a19
on (a11.task_key = a19.row_key)
join ldb.d_task_contacttype a121
on (a19.contact_type_src_key = a121.row_key)
union
select 'ldb.d_task_impact a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a19
on (a11.task_key = a19.row_key)
join ldb.d_task_impact a122
on (a19.impact_src_key = a122.row_key)
union
select 'ldb.d_task_opened_by a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a19
on (a11.task_key = a19.row_key)
join ldb.d_task_opened_by a123
on (a19.opened_by_key = a123.row_key)
union
select 'ldb.d_task_priority a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a19
on (a11.task_key = a19.row_key)
join ldb.d_task_priority a124
on (a19.priority_src_key = a124.row_key)
union
select 'ldb.d_task_state a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a19
on (a11.task_key = a19.row_key)
join ldb.d_task_state a125
on (a19.state_src_key = a125.row_key)
union
select 'ldb.d_task_type a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a19
on (a11.task_key = a19.row_key)
join ldb.d_task_type a126
on (a19.task_type_src_key = a126.row_key)
union
select 'ldb.d_task_urgency a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a19
on (a11.task_key = a19.row_key)
join ldb.d_task_urgency a127
on (a19.urgency_src_key = a127.row_key)
