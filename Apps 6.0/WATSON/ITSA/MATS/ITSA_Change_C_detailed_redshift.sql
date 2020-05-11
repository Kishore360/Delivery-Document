select 'ldb.f_change_request a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_contact a13
on (a11.employee_key = a13.row_key)
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_contact_assigned_to a14
on (a11.assigned_to_key = a14.row_key)
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key)
union
select 'ldb.d_business_service a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_business_service a16
on (a11.business_service_key = a16.row_key)
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key)
union
select 'ldb.d_calendar_quarter a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key)
join ldb.d_calendar_quarter a19
on (a18.quarter_start_date_key = a19.row_key)
union
select 'ldb.d_change_request a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request a110
on (a11.change_request_key = a110.row_key)
union
select 'ldb.d_change_request_risk a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_risk a111
on (a11.risk_src_key = a111.row_key)
union
select 'ldb.d_configuration_item_mdm a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_configuration_item_mdm a112
on (a12.mdm_key = a112.row_key)
union
select 'ldb.d_environment_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_environment_c a113
on (a11.environment_c_key = a113.row_key)
union
select 'ldb.d_segment_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_segment_c a114
on (a11.segment_c_key = a114.row_key)
union
select 'ldb.d_change_request_approval a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_approval a115
on (a11.approval_state_src_key = a115.row_key)
union
select 'ldb.d_change_request_category a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_category a116
on (a11.category_src_key = a116.row_key)
union
select 'ldb.d_change_request_reported_type a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_reported_type a117
on (a11.reported_type_src_key = a117.row_key)
union
select 'ldb.d_change_request_impact a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_impact a118
on (a11.impact_src_key = a118.row_key)
union
select 'ldb.d_change_request_priority a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_priority a119
on (a11.priority_src_key = a119.row_key)
union
select 'ldb.d_change_request_reason a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_reason a120
on (a11.reason_src_key = a120.row_key)
union
select 'ldb.d_change_request_tribe_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_tribe_c a121
on (a11.tribe_c_key = a121.row_key)
union
select 'ldb.d_change_request_review_status a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_review_status a122
on (a11.review_status_src_key = a122.row_key)
union
select 'ldb.d_change_request_scope a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_scope a123
on (a11.scope_src_key = a123.row_key)
union
select 'ldb.d_change_request_state a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_state a124
on (a11.state_src_key = a124.row_key)
union
select 'ldb.d_change_request_type a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_type a125
on (a11.type_src_key = a125.row_key)
union
select 'ldb.d_change_request_urgency a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_urgency a126
on (a11.urgency_src_key = a126.row_key)
union
select 'ldb.d_internal_organization_department a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_organization_department a127
on (a11.requested_by_department_key = a127.row_key)
union
select 'ldb.d_domain a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_domain a128
on (a11.domain_key = a128.row_key)
union
select 'ldb.d_internal_contact_mdm a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_contact a13
on (a11.employee_key = a13.row_key)
join ldb.d_internal_contact_mdm a129
on (a13.employee_mdm_key = a129.row_key)
union
select 'ldb.d_location a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_location a130
on (a11.location_key = a130.row_key)
union
select 'ldb.d_change_request_parent_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_parent_c a131
on (a11.parent_task_c_key = a131.row_key)
union
select 'ldb.d_business_service_criticality a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_business_service a16
on (a11.business_service_key = a16.row_key)
join ldb.d_business_service_criticality a132
on (a16.criticality_key = a132.row_key)
union
select 'ldb.d_business_service_used_for a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_business_service a16
on (a11.business_service_key = a16.row_key)
join ldb.d_business_service_used_for a133
on (a16.used_for_src_key = a133.row_key)
union
select 'ldb.d_calendar_week a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
join ldb.d_calendar_week a134
on (a17.week_start_date_key = a134.row_key)
union
select 'ldb.d_change_request_close_code a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request a110
on (a11.change_request_key = a110.row_key)
join ldb.d_change_request_close_code a135
on (a110.close_code_src_key = a135.row_key)
union
select 'ldb.d_change_request_service_owner_c a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request a110
on (a11.change_request_key = a110.row_key)
join ldb.d_change_request_service_owner_c a136
on (a110.service_owner_c_key = a136.row_key)
union
select 'ldb.d_internal_contact_general_manager_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_segment_c a114
on (a11.segment_c_key = a114.row_key)
join ldb.d_internal_contact_general_manager_c a137
on (a114.general_manager_c_key = a137.row_key)
union
select 'ldb.d_lov_segment_type_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_segment_c a114
on (a11.segment_c_key = a114.row_key)
join ldb.d_lov_segment_type_c a138
on (a114.segment_type_c_key = a138.row_key)
union
select 'ldb.d_calendar_year a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key) join ldb.d_calendar_quarter a19
on (a18.quarter_start_date_key = a19.row_key)
join ldb.d_calendar_year a139
on (a19.year_start_date_key = a139.row_key)

