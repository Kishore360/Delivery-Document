select 'ldb.f_change_request_closed a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
union
select 'ldb.d_change_employee a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_employee a12
on (a11.change_employee_key = a12.row_key)
union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
union
select 'ldb.d_internal_contact a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_contact a14
on (a11.employee_key = a14.row_key)
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_contact_assigned_to a15
on (a11.assigned_to_key = a15.row_key)
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_organization_group a16
on (a11.assignment_group_key = a16.row_key)
union
select 'ldb.d_business_service a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_business_service a17
on (a11.business_service_key = a17.row_key)
union
select 'ldb.d_environment_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_environment_c a18
on (a11.environment_c_key = a18.row_key)
union
select 'ldb.d_calendar_date a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key)
union
select 'ldb.d_calendar_month a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key)
join ldb.d_calendar_month a110
on (a19.month_start_date_key = a110.row_key)
union
select 'ldb.d_calendar_quarter a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key) join ldb.d_calendar_month a110
on (a19.month_start_date_key = a110.row_key)
join ldb.d_calendar_quarter a111
on (a110.quarter_start_date_key = a111.row_key)
union
select 'ldb.d_change_request a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a112
on (a11.change_request_key = a112.row_key)
union
select 'ldb.d_change_internal_contact_assigned_to a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a112
on (a11.change_request_key = a112.row_key)
join ldb.d_change_internal_contact_assigned_to a113
on (a112.assigned_to_key = a113.row_key)
union
select 'ldb.d_change_request_assignment_group a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a112
on (a11.change_request_key = a112.row_key)
join ldb.d_change_request_assignment_group a114
on (a112.assignment_group_key = a114.row_key)
union
select 'ldb.d_change_business_service a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a112
on (a11.change_request_key = a112.row_key)
join ldb.d_change_business_service a115
on (a112.business_service_key = a115.row_key)
union
select 'ldb.d_change_date a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_date a116
on (a11.change_date_key = a116.row_key)
union
select 'ldb.d_change_calendar_month a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_date a116
on (a11.change_date_key = a116.row_key)
join ldb.d_change_calendar_month a117
on (a116.month_start_date_key = a117.row_key)
union
select 'ldb.d_change_calendar_quarter a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_date a116
on (a11.change_date_key = a116.row_key) join ldb.d_change_calendar_month a117
on (a116.month_start_date_key = a117.row_key)
join ldb.d_change_calendar_quarter a118
on (a117.quarter_start_date_key = a118.row_key)
union
select 'ldb.d_change_configuration_item a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a112
on (a11.change_request_key = a112.row_key)
join ldb.d_change_configuration_item a119
on (a112.configuration_item_key = a119.row_key)
union
select 'ldb.d_change_configuration_item_mdm a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a112
on (a11.change_request_key = a112.row_key) join ldb.d_change_configuration_item a119
on (a112.configuration_item_key = a119.row_key)
join ldb.d_change_configuration_item_mdm a120
on (a119.mdm_key = a120.row_key)
union
select 'ldb.d_change_request_environment_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_environment_c a121
on (a11.change_request_environment_c_key = a121.row_key)
union
select 'ldb.d_change_request_risk a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_risk a122
on (a11.risk_src_key = a122.row_key)
union
select 'ldb.d_segment_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_segment_c a124
on (a11.segment_c_key = a124.row_key)
union
select 'ldb.d_change_request_approval a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_approval a125
on (a11.approval_state_src_key = a125.row_key)
union
select 'ldb.d_change_request_category a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_category a126
on (a11.category_src_key = a126.row_key)
union
select 'ldb.d_change_request_reported_type a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_reported_type a127
on (a11.reported_type_src_key = a127.row_key)
union
select 'ldb.d_change_department a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_department a128
on (a11.change_department_key = a128.row_key)
union
select 'ldb.d_change_employee_mdm a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_employee a12
on (a11.change_employee_key = a12.row_key)
join ldb.d_change_employee_mdm a129
on (a12.employee_mdm_key = a129.row_key)
union
select 'ldb.d_change_request_impact a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_impact a130
on (a11.impact_src_key = a130.row_key)
union
select 'ldb.d_change_request_priority a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_priority a131
on (a11.priority_src_key = a131.row_key)
union
select 'ldb.d_change_request_reason a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_reason a132
on (a11.reason_src_key = a132.row_key)
union
select 'ldb.d_change_request_review_status a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_review_status a133
on (a11.review_status_src_key = a133.row_key)
union
select 'ldb.d_change_request_scope a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_scope a134
on (a11.scope_src_key = a134.row_key)
union
select 'ldb.d_change_request_state a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_state a135
on (a11.state_src_key = a135.row_key)
union
select 'ldb.d_change_request_type a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_type a136
on (a11.type_src_key = a136.row_key)
union
select 'ldb.d_change_request_urgency a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_urgency a137
on (a11.urgency_src_key = a137.row_key)
union
select 'ldb.d_internal_organization_department a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_organization_department a138
on (a11.requested_by_department_key = a138.row_key)
union
select 'ldb.d_domain a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_domain a139
on (a11.domain_key = a139.row_key)
union
select 'ldb.d_internal_contact_mdm a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_contact a14
on (a11.employee_key = a14.row_key)
join ldb.d_internal_contact_mdm a140
on (a14.employee_mdm_key = a140.row_key)
union
select 'ldb.d_location a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_location a141
on (a11.location_key = a141.row_key)
union
select 'ldb.d_business_service_criticality a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_business_service a17
on (a11.business_service_key = a17.row_key)
join ldb.d_business_service_criticality a142
on (a17.criticality_key = a142.row_key)
union
select 'ldb.d_business_service_used_for a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_business_service a17
on (a11.business_service_key = a17.row_key)
join ldb.d_business_service_used_for a143
on (a17.used_for_src_key = a143.row_key)
union
select 'ldb.d_calendar_week a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key)
join ldb.d_calendar_week a144
on (a19.week_start_date_key = a144.row_key)
union
select 'ldb.d_change_calendar_week a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_date a116
on (a11.change_date_key = a116.row_key)
join ldb.d_change_calendar_week a145
on (a116.week_start_date_key = a145.row_key)
union
select 'ldb.d_change_request_close_code a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a112
on (a11.change_request_key = a112.row_key)
join ldb.d_change_request_close_code a146
on (a112.close_code_src_key = a146.row_key)
union
select 'ldb.d_change_domain a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a112
on (a11.change_request_key = a112.row_key)
join ldb.d_change_domain a147
on (a112.domain_key = a147.row_key)
union
select 'ldb.d_change_location a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a112
on (a11.change_request_key = a112.row_key)
join ldb.d_change_location a148
on (a112.location_key = a148.row_key)
union
select 'ldb.d_change_request_service_owner_c a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a112
on (a11.change_request_key = a112.row_key)
join ldb.d_change_request_service_owner_c a149
on (a112.service_owner_c_key = a149.row_key)
union
select 'ldb.d_change_request_parent_c a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a112
on (a11.change_request_key = a112.row_key)
join ldb.d_change_request_parent_c a150
on (a112.change_request_parent_c_key = a150.row_key)
union
select 'ldb.d_internal_contact_general_manager_c a151 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_segment_c a124
on (a11.segment_c_key = a124.row_key)
join ldb.d_internal_contact_general_manager_c a151
on (a124.general_manager_c_key = a151.row_key)
union
select 'ldb.d_lov_segment_type_c a152 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_segment_c a124
on (a11.segment_c_key = a124.row_key)
join ldb.d_lov_segment_type_c a152
on (a124.segment_type_c_key = a152.row_key)
union
select 'ldb.d_change_business_service_criticality a153 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a112
on (a11.change_request_key = a112.row_key) join ldb.d_change_business_service a115
on (a112.business_service_key = a115.row_key)
join ldb.d_change_business_service_criticality a153
on (a115.criticality_key = a153.row_key)
union
select 'ldb.d_change_business_service_used_for a154 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a112
on (a11.change_request_key = a112.row_key) join ldb.d_change_business_service a115
on (a112.business_service_key = a115.row_key)
join ldb.d_change_business_service_used_for a154
on (a115.used_for_src_key = a154.row_key)
union
select 'ldb.d_change_request_tribe_c a155 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a112
on (a11.change_request_key = a112.row_key) join ldb.d_change_configuration_item a119
on (a112.configuration_item_key = a119.row_key) join ldb.d_change_configuration_item_mdm a120
on (a119.mdm_key = a120.row_key)
join ldb.d_change_request_tribe_c a155
on (a120.change_request_tribe_c_key = a155.row_key)
union
select 'ldb.d_calendar_year a156 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key) join ldb.d_calendar_month a110
on (a19.month_start_date_key = a110.row_key) join ldb.d_calendar_quarter a111
on (a110.quarter_start_date_key = a111.row_key)
join ldb.d_calendar_year a156
on (a111.year_start_date_key = a156.row_key)
union
select 'ldb.d_change_calendar_year a157 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_date a116
on (a11.change_date_key = a116.row_key) join ldb.d_change_calendar_month a117
on (a116.month_start_date_key = a117.row_key) join ldb.d_change_calendar_quarter a118
on (a117.quarter_start_date_key = a118.row_key)
join ldb.d_change_calendar_year a157
on (a118.year_start_date_key = a157.row_key)
