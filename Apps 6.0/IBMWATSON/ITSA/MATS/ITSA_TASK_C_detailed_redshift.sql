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
select 'ldb.d_task_employee a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task_employee a16
on (a11.task_employee_key = a16.row_key)
union
select 'ldb.d_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_internal_contact_assigned_to a17
on (a11.assigned_to_key = a17.row_key)
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_internal_organization_group a18
on (a11.assignment_group_key = a18.row_key)
union
select 'ldb.d_calendar_date a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key)
union
select 'ldb.d_task a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a110
on (a11.task_key = a110.row_key)
union
select 'ldb.d_parent_task a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a110
on (a11.task_key = a110.row_key)
join ldb.d_parent_task a111
on (a110.parent_task_key = a111.row_key)
union
select 'ldb.d_task_application a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a110
on (a11.task_key = a110.row_key)
join ldb.d_task_application a112
on (a110.application_key = a112.row_key)
union
select 'ldb.d_task_assigned_to a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a110
on (a11.task_key = a110.row_key)
join ldb.d_task_assigned_to a113
on (a110.assigned_to_key = a113.row_key)
union
select 'ldb.d_task_internal_organization_group a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a110
on (a11.task_key = a110.row_key)
join ldb.d_task_internal_organization_group a114
on (a110.assignment_group_key = a114.row_key)
union
select 'ldb.d_task_date a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task_date a115
on (a11.task_date_key = a115.row_key)
union
select 'ldb.d_task_configuration_item a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a110
on (a11.task_key = a110.row_key)
join ldb.d_task_configuration_item a116
on (a110.configuration_item_key = a116.row_key)
union
select 'ldb.d_application_mdm a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_mdm a117
on (a12.mdm_key = a117.row_key)
union
select 'ldb.d_business_service a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_business_service a118
on (a11.business_service_key = a118.row_key)
union
select 'ldb.d_configuration_item_mdm a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_configuration_item_mdm a119
on (a13.mdm_key = a119.row_key)
union
select 'ldb.d_internal_contact_mdm a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_internal_contact a14
on (a11.employee_key = a14.row_key)
join ldb.d_internal_contact_mdm a120
on (a14.employee_mdm_key = a120.row_key)
union
select 'ldb.d_location a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_location a121
on (a11.location_key = a121.row_key)
union
select 'ldb.d_lov_segment_type_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_segment_c a15
on (a11.segment_c_key = a15.row_key)
join ldb.d_lov_segment_type_c a122
on (a15.segment_type_c_key = a122.row_key)
union
select 'ldb.d_task_employee_mdm a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task_employee a16
on (a11.task_employee_key = a16.row_key)
join ldb.d_task_employee_mdm a123
on (a16.employee_mdm_key = a123.row_key)
union
select 'ldb.d_task_application_mdm a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a110
on (a11.task_key = a110.row_key) join ldb.d_task_application a112
on (a110.application_key = a112.row_key)
join ldb.d_task_application_mdm a124
on (a112.mdm_key = a124.row_key)
union
select 'ldb.d_task_approval a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a110
on (a11.task_key = a110.row_key)
join ldb.d_task_approval a125
on (a110.approval_src_key = a125.row_key)
union
select 'ldb.d_task_business_service a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a110
on (a11.task_key = a110.row_key)
join ldb.d_task_business_service a126
on (a110.business_service_key = a126.row_key)
union
select 'ldb.d_task_calendar_month a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task_date a115
on (a11.task_date_key = a115.row_key)
join ldb.d_task_calendar_month a127
on (a115.month_start_date_key = a127.row_key)
union
select 'ldb.d_task_closed_by a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a110
on (a11.task_key = a110.row_key)
join ldb.d_task_closed_by a128
on (a110.closed_by_key = a128.row_key)
union
select 'ldb.d_task_configuration_item_mdm a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a110
on (a11.task_key = a110.row_key) join ldb.d_task_configuration_item a116
on (a110.configuration_item_key = a116.row_key)
join ldb.d_task_configuration_item_mdm a129
on (a116.mdm_key = a129.row_key)
union
select 'ldb.d_task_contacttype a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a110
on (a11.task_key = a110.row_key)
join ldb.d_task_contacttype a130
on (a110.contact_type_src_key = a130.row_key)
union
select 'ldb.d_task_impact a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a110
on (a11.task_key = a110.row_key)
join ldb.d_task_impact a131
on (a110.impact_src_key = a131.row_key)
union
select 'ldb.d_task_opened_by a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a110
on (a11.task_key = a110.row_key)
join ldb.d_task_opened_by a132
on (a110.opened_by_key = a132.row_key)
union
select 'ldb.d_task_priority a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a110
on (a11.task_key = a110.row_key)
join ldb.d_task_priority a133
on (a110.priority_src_key = a133.row_key)
union
select 'ldb.d_task_state a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a110
on (a11.task_key = a110.row_key)
join ldb.d_task_state a134
on (a110.state_src_key = a134.row_key)
union
select 'ldb.d_task_type a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a110
on (a11.task_key = a110.row_key)
join ldb.d_task_type a135
on (a110.task_type_src_key = a135.row_key)
union
select 'ldb.d_task_urgency a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a110
on (a11.task_key = a110.row_key)
join ldb.d_task_urgency a136
on (a110.urgency_src_key = a136.row_key)
union
select 'ldb.d_task_tribe_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task a11
join ldb.d_task a110
on (a11.task_key = a110.row_key) join ldb.d_task_configuration_item a116
on (a110.configuration_item_key = a116.row_key)
join ldb.d_task_tribe_c a137
on (a116.task_tribe_c_key = a137.row_key)
