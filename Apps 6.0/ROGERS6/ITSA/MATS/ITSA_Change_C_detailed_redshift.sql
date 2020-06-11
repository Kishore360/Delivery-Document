select 'ldb.f_change_request a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_contact a12
on (a11.employee_key = a12.row_key)
union
select 'ldb.d_change_request a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request a13
on (a11.change_request_key = a13.row_key)
union
select 'ldb.d_lov_change_request_sub_category_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request a13
on (a11.change_request_key = a13.row_key)
join ldb.d_lov_change_request_sub_category_c a14
on (a13.subcategory_src_c_key = a14.row_key)
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_contact_assigned_to a15
on (a11.assigned_to_key = a15.row_key)
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_organization_group a16
on (a11.assignment_group_key = a16.row_key)
union
select 'ldb.d_business_service a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_business_service a17
on (a11.business_service_key = a17.row_key)
union
select 'ldb.d_calendar_date a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_calendar_date a18
on (a11.date_key = a18.row_key)
union
select 'ldb.d_calendar_month a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_calendar_date a18
on (a11.date_key = a18.row_key)
join ldb.d_calendar_month a19
on (a18.month_start_date_key = a19.row_key)
union
select 'ldb.d_calendar_quarter a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_calendar_date a18
on (a11.date_key = a18.row_key) join ldb.d_calendar_month a19
on (a18.month_start_date_key = a19.row_key)
join ldb.d_calendar_quarter a110
on (a19.quarter_start_date_key = a110.row_key)
union
select 'ldb.d_internal_organization_support_group_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_organization_support_group_c a111
on (a11.change_initiator_workgroup_c_key = a111.row_key)
union
select 'ldb.d_internal_contact_support_group_manager_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_organization_support_group_c a111
on (a11.change_initiator_workgroup_c_key = a111.row_key)
join ldb.d_internal_contact_support_group_manager_c a112
on (a111.support_manager_c_key = a112.row_key)
union
select 'ldb.d_manager_business_unit_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_organization_support_group_c a111
on (a11.change_initiator_workgroup_c_key = a111.row_key) join ldb.d_internal_contact_support_group_manager_c a112
on (a111.support_manager_c_key = a112.row_key)
join ldb.d_manager_business_unit_c a113
on (a112.manager_business_unit_c_key = a113.row_key)
union
select 'ldb.d_change_request_risk a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_risk a114
on (a11.risk_src_key = a114.row_key)
union
select 'ldb.d_configuration_item a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_configuration_item a115
on (a11.configuration_item_key = a115.row_key)
union
select 'ldb.d_incident a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_incident a116
on (a11.incident_c_key = a116.row_key)
union
select 'ldb.d_calendar_week a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_calendar_date a18
on (a11.date_key = a18.row_key)
join ldb.d_calendar_week a117
on (a18.week_start_date_key = a117.row_key)
union
select 'ldb.d_calendar_year a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_calendar_date a18
on (a11.date_key = a18.row_key) join ldb.d_calendar_month a19
on (a18.month_start_date_key = a19.row_key) join ldb.d_calendar_quarter a110
on (a19.quarter_start_date_key = a110.row_key)
join ldb.d_calendar_year a118
on (a110.year_start_date_key = a118.row_key)
union
select 'ldb.d_change_request_approval a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_approval a119
on (a11.approval_state_src_key = a119.row_key)
union
select 'ldb.d_change_request_category a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_category a120
on (a11.category_src_key = a120.row_key)
union
select 'ldb.d_change_request_reported_type a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_reported_type a121
on (a11.reported_type_src_key = a121.row_key)
union
select 'ldb.d_change_request_impact a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_impact a122
on (a11.impact_src_key = a122.row_key)
union
select 'ldb.d_internal_contact_requested_by_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_contact_requested_by_c a123
on (a11.requested_by_key = a123.row_key)
union
select 'ldb.d_change_request_priority a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_priority a124
on (a11.priority_src_key = a124.row_key)
union
select 'ldb.d_change_request_reason a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_reason a125
on (a11.reason_src_key = a125.row_key)
union
select 'ldb.d_internal_contact_task_for_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_contact_task_for_c a126
on (a11.task_for_c_key = a126.row_key)
union
select 'ldb.d_change_request_review_status a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_review_status a127
on (a11.review_status_src_key = a127.row_key)
union
select 'ldb.d_change_request_scope a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_scope a128
on (a11.scope_src_key = a128.row_key)
union
select 'ldb.d_change_request_state a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_state a129
on (a11.state_src_key = a129.row_key)
union
select 'ldb.d_change_request_type a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_type a130
on (a11.type_src_key = a130.row_key)
union
select 'ldb.d_change_request_urgency a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_urgency a131
on (a11.urgency_src_key = a131.row_key)
union
select 'ldb.d_internal_organization_department a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_organization_department a132
on (a11.requested_by_department_key = a132.row_key)
union
select 'ldb.d_domain a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_domain a133
on (a11.domain_key = a133.row_key)
union
select 'ldb.d_internal_contact_mdm a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_contact a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_contact_mdm a134
on (a12.employee_mdm_key = a134.row_key)
union
select 'ldb.d_lov_fact_source_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_lov_fact_source_c a135
on (a11.fact_source_c_key = a135.row_key)
union
select 'ldb.d_location a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_location a136
on (a11.location_key = a136.row_key)
union
select 'ldb.d_problem a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_problem a137
on (a11.problem_c_key = a137.row_key)
union
select 'ldb.d_business_service_criticality a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_business_service a17
on (a11.business_service_key = a17.row_key)
join ldb.d_business_service_criticality a138
on (a17.criticality_key = a138.row_key)
union
select 'ldb.d_business_service_used_for a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_business_service a17
on (a11.business_service_key = a17.row_key)
join ldb.d_business_service_used_for a139
on (a17.used_for_src_key = a139.row_key)
union
select 'ldb.d_lov_change_request_sub_status_c a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request a13
on (a11.change_request_key = a13.row_key)
join ldb.d_lov_change_request_sub_status_c a140
on (a13.sub_status_src_c_key = a140.row_key)
union
select 'ldb.d_lov_change_request_environment_c a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request a13
on (a11.change_request_key = a13.row_key)
join ldb.d_lov_change_request_environment_c a141
on (a13.environment_src_c_key = a141.row_key)
union
select 'ldb.d_lov_change_request_failed_change_c a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request a13
on (a11.change_request_key = a13.row_key)
join ldb.d_lov_change_request_failed_change_c a142
on (a13.failed_change_src_c_key = a142.row_key)
union
select 'ldb.d_incident_priority a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_incident a116
on (a11.incident_c_key = a116.row_key)
join ldb.d_incident_priority a143
on (a116.priority_src_key = a143.row_key)
