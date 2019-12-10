select 'ldb.f_change_request_closed a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
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
select 'ldb.d_change_request a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a18
on (a11.change_request_key = a18.row_key)
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
select 'ldb.d_change_request_risk a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_risk a112
on (a11.risk_src_key = a112.row_key)
union
select 'ldb.d_configuration_item_mdm a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_configuration_item_mdm a113
on (a13.mdm_key = a113.row_key)
union
select 'ldb.d_application_mdm a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_mdm a114
on (a12.mdm_key = a114.row_key)
union
select 'ldb.d_change_request_approval a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_approval a115
on (a11.approval_state_src_key = a115.row_key)
union
select 'ldb.d_change_request_category a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_category a116
on (a11.category_src_key = a116.row_key)
union
select 'ldb.d_change_request_reported_type a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_reported_type a117
on (a11.reported_type_src_key = a117.row_key)
union
select 'ldb.d_change_request_impact a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_impact a118
on (a11.impact_src_key = a118.row_key)
union
select 'ldb.d_change_request_priority a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_priority a119
on (a11.priority_src_key = a119.row_key)
union
select 'ldb.d_change_request_reason a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_reason a120
on (a11.reason_src_key = a120.row_key)
union
select 'ldb.d_change_request_review_status a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_review_status a121
on (a11.review_status_src_key = a121.row_key)
union
select 'ldb.d_change_request_scope a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_scope a122
on (a11.scope_src_key = a122.row_key)
union
select 'ldb.d_change_request_state a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_state a123
on (a11.state_src_key = a123.row_key)
union
select 'ldb.d_change_request_type a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_type a124
on (a11.type_src_key = a124.row_key)
union
select 'ldb.d_change_request_urgency a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_urgency a125
on (a11.urgency_src_key = a125.row_key)
union
select 'ldb.d_internal_organization_department a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_organization_department a126
on (a11.requested_by_department_key = a126.row_key)
union
select 'ldb.d_domain a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_domain a127
on (a11.domain_key = a127.row_key)
union
select 'ldb.d_internal_contact_mdm a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_contact a14
on (a11.employee_key = a14.row_key)
join ldb.d_internal_contact_mdm a128
on (a14.employee_mdm_key = a128.row_key)
union
select 'ldb.d_location a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_location a129
on (a11.location_key = a129.row_key)
union
select 'ldb.d_change_p1_or_p2_inc_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_p1_or_p2_inc_c a130
on (a11.p1_or_p2_inc_c_key = a130.row_key)
union
select 'ldb.d_business_service_criticality a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_business_service a17
on (a11.business_service_key = a17.row_key)
join ldb.d_business_service_criticality a131
on (a17.criticality_key = a131.row_key)
union
select 'ldb.d_business_service_used_for a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_business_service a17
on (a11.business_service_key = a17.row_key)
join ldb.d_business_service_used_for a132
on (a17.used_for_src_key = a132.row_key)
union
select 'ldb.d_calendar_week a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key)
join ldb.d_calendar_week a133
on (a19.week_start_date_key = a133.row_key)
union
select 'ldb.d_lov_change_group_category_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_organization_group a16
on (a11.assignment_group_key = a16.row_key)
join ldb.d_lov_change_group_category_c a134
on (a16.change_group_category_c_key = a134.row_key)
union
select 'ldb.d_lov_change_consumption_question_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a18
on (a11.change_request_key = a18.row_key)
join ldb.d_lov_change_consumption_question_c a135
on (a18.consumption_question_c_key = a135.row_key)
union
select 'ldb.d_lov_change_affected_cmdb_c a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a18
on (a11.change_request_key = a18.row_key)
join ldb.d_lov_change_affected_cmdb_c a136
on (a18.change_affected_cmdb_c_key = a136.row_key)
union
select 'ldb.d_lov_change_outage_required_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a18
on (a11.change_request_key = a18.row_key)
join ldb.d_lov_change_outage_required_c a137
on (a18.change_outage_required_c_key = a137.row_key)
union
select 'ldb.d_lov_change_pre_testing_result_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a18
on (a11.change_request_key = a18.row_key)
join ldb.d_lov_change_pre_testing_result_c a138
on (a18.pre_testing_result_c_key = a138.row_key)
union
select 'ldb.d_lov_change_reason_for_change_c a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a18
on (a11.change_request_key = a18.row_key)
join ldb.d_lov_change_reason_for_change_c a139
on (a18.reason_for_change_c_key = a139.row_key)
union
select 'ldb.d_lov_change_change_assessment_c a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a18
on (a11.change_request_key = a18.row_key)
join ldb.d_lov_change_change_assessment_c a140
on (a18.change_assessment_c_key = a140.row_key)
union
select 'ldb.d_ci_owned_by a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_ci_owned_by a141
on (a13.owned_by_key = a141.row_key)
union
select 'ldb.d_service_prb_owner_group_c a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_business_service a17
on (a11.business_service_key = a17.row_key)
join ldb.d_service_prb_owner_group_c a142
on (a17.service_prb_owner_group_c_key = a142.row_key)
union
select 'ldb.d_calendar_year a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key) join ldb.d_calendar_month a110
on (a19.month_start_date_key = a110.row_key) join ldb.d_calendar_quarter a111
on (a110.quarter_start_date_key = a111.row_key)
join ldb.d_calendar_year a143
on (a111.year_start_date_key = a143.row_key)