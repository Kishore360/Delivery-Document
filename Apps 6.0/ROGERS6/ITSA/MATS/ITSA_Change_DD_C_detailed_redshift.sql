select 'ldb.f_change_final_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_final_c a11
union
select 'ldb.d_application_event_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_final_c a11
join ldb.d_application_event_c a12
on (a11.application_key = a12.row_key)
union
select 'ldb.d_configuration_item a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_final_c a11
join ldb.d_configuration_item a14
on (a11.configuration_item_key = a14.row_key)
union
select 'ldb.d_internal_contact_director_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_final_c a11
join ldb.d_configuration_item a14
on (a11.configuration_item_key = a14.row_key)
join ldb.d_internal_contact_director_c a15
on (a14.support_director_c_key = a15.row_key)
union
select 'ldb.d_internal_contact_manager_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_final_c a11
join ldb.d_configuration_item a14
on (a11.configuration_item_key = a14.row_key)
join ldb.d_internal_contact_manager_c a16
on (a14.managed_by_c_key = a16.row_key)
union
select 'ldb.d_internal_contact_vp_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_final_c a11
join ldb.d_configuration_item a14
on (a11.configuration_item_key = a14.row_key)
join ldb.d_internal_contact_vp_c a17
on (a14.vp_c_key = a17.row_key)
union
select 'ldb.d_internal_contact_assigned_to a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_final_c a11
join ldb.d_internal_contact_assigned_to a18
on (a11.assigned_to_key = a18.row_key)
union
select 'ldb.d_calendar_date a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_final_c a11
join ldb.d_calendar_date a19
on (a11.opened_on_key = a19.row_key)
union
select 'ldb.d_calendar_month a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_final_c a11
join ldb.d_calendar_date a19
on (a11.opened_on_key = a19.row_key)
join ldb.d_calendar_month a110
on (a19.month_start_date_key = a110.row_key)
union
select 'ldb.d_calendar_quarter a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_final_c a11
join ldb.d_calendar_date a19
on (a11.opened_on_key = a19.row_key) join ldb.d_calendar_month a110
on (a19.month_start_date_key = a110.row_key)
join ldb.d_calendar_quarter a111
on (a110.quarter_start_date_key = a111.row_key)
union
select 'ldb.d_change_request a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_final_c a11
join ldb.d_change_request a112
on (a11.change_request_key = a112.row_key)
union
select 'ldb.d_internal_organization_support_group_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_final_c a11
join ldb.d_internal_organization_support_group_c a113
on (a11.change_initiator_workgroup_c_key = a113.row_key)
union
select 'ldb.d_support_group_business_unit_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_final_c a11
join ldb.d_internal_organization_support_group_c a113
on (a11.change_initiator_workgroup_c_key = a113.row_key)
join ldb.d_support_group_business_unit_c a114
on (a113.business_unit_c_key = a114.row_key)
union
select 'ldb.d_internal_contact_vp_svp_change_request_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_final_c a11
join ldb.d_internal_organization_support_group_c a113
on (a11.change_initiator_workgroup_c_key = a113.row_key) join ldb.d_support_group_business_unit_c a114
on (a113.business_unit_c_key = a114.row_key)
join ldb.d_internal_contact_vp_svp_change_request_c a115
on (a114.vp_svp_c_key = a115.row_key)
union
select 'ldb.d_change_task a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_final_c a11
join ldb.d_change_task a116
on (a11.change_task_key = a116.row_key)
union
select 'ldb.d_calendar_year a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_final_c a11
join ldb.d_calendar_date a19
on (a11.opened_on_key = a19.row_key) join ldb.d_calendar_month a110
on (a19.month_start_date_key = a110.row_key) join ldb.d_calendar_quarter a111
on (a110.quarter_start_date_key = a111.row_key)
join ldb.d_calendar_year a117
on (a111.year_start_date_key = a117.row_key)
union
select 'ldb.d_internal_organization_group a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_final_c a11
join ldb.d_internal_organization_group a118
on (a11.assignment_group_key = a118.row_key)
union
select 'ldb.d_change_request_priority a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_final_c a11
join ldb.d_change_request_priority a119
on (a11.priority_src_key = a119.row_key)
union
select 'ldb.d_change_request_reason a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_final_c a11
join ldb.d_change_request_reason a120
on (a11.reason_src_key = a120.row_key)
union
select 'ldb.d_lov_type_src_view_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_final_c a11
join ldb.d_lov_type_src_view_c a121
on (a11.type_src_key = a121.row_key)
union
select 'ldb.d_change_request_urgency a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_final_c a11
join ldb.d_change_request_urgency a122
on (a11.urgency_src_key = a122.row_key)
union
select 'ldb.d_configuration_item a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_final_c a11
join ldb.d_configuration_item a123
on (a11.configuration_item_key = a123.row_key)
union
select 'ldb.d_incident a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_final_c a11
join ldb.d_incident a124
on (a11.incident_c_key = a124.row_key)
union
select 'ldb.d_calendar_week a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_final_c a11
join ldb.d_calendar_date a19
on (a11.opened_on_key = a19.row_key)
join ldb.d_calendar_week a125
on (a19.week_start_date_key = a125.row_key)
union
select 'ldb.d_lov_change_request_sub_category_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_final_c a11
join ldb.d_change_request a112
on (a11.change_request_key = a112.row_key)
join ldb.d_lov_change_request_sub_category_c a126
on (a112.subcategory_src_c_key = a126.row_key)
union
select 'ldb.d_change_task_priority a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_final_c a11
join ldb.d_change_task a116
on (a11.change_task_key = a116.row_key)
join ldb.d_change_task_priority a127
on (a116.priority_src_key = a127.row_key)
union
select 'ldb.d_change_task_state a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_final_c a11
join ldb.d_change_task a116
on (a11.change_task_key = a116.row_key)
join ldb.d_change_task_state a128
on (a116.state_src_key = a128.row_key)
union
select 'ldb.d_lov_change_request_failed_change_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_final_c a11
join ldb.d_change_request a112
on (a11.change_request_key = a112.row_key)
join ldb.d_lov_change_request_failed_change_c a129
on (a112.failed_change_src_c_key = a129.row_key)
