select 'ldb.f_change_request_closed a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
union
select 'ldb.d_internal_organization_group a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_organization_group a13
on (a11.assignment_group_key = a13.row_key)
union
select 'ldb.d_change_request a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key)
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_contact_assigned_to a15
on (a11.assigned_to_key = a15.row_key)
union
select 'ldb.d_business_service a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_business_service a16
on (a11.business_service_key = a16.row_key)
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key)
union
select 'ldb.d_calendar_quarter a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key)
join ldb.d_calendar_quarter a19
on (a18.quarter_start_date_key = a19.row_key)
union
select 'ldb.d_change_request_risk a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_risk a110
on (a11.risk_src_key = a110.row_key)
union
select 'ldb.d_co_manager_role_vp_dir_ad_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_co_manager_role_vp_dir_ad_c a111
on (a11.owned_by_c_key = a111.change_owner_key)
union
select 'ldb.d_internal_contact_co_associate_director_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_co_manager_role_vp_dir_ad_c a111
on (a11.owned_by_c_key = a111.change_owner_key)
join ldb.d_internal_contact_co_associate_director_c a112
on (a111.associate_director_key = a112.row_key)
union
select 'ldb.d_internal_contact_co_vp_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_co_manager_role_vp_dir_ad_c a111
on (a11.owned_by_c_key = a111.change_owner_key)
join ldb.d_internal_contact_co_vp_c a113
on (a111.vp_key = a113.row_key)
union
select 'ldb.d_internal_contact_co_director_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_co_manager_role_vp_dir_ad_c a111
on (a11.owned_by_c_key = a111.change_owner_key)
join ldb.d_internal_contact_co_director_c a114
on (a111.director_key = a114.row_key)
union
select 'ldb.d_configuration_item a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_configuration_item a115
on (a11.configuration_item_key = a115.row_key)
union
select 'ldb.d_configuration_item_mdm a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_configuration_item a115
on (a11.configuration_item_key = a115.row_key)
join ldb.d_configuration_item_mdm a116
on (a115.mdm_key = a116.row_key)
union
select 'ldb.d_internal_contact a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_contact a117
on (a11.employee_key = a117.row_key)
union
select 'ldb.d_calendar_date_fiscal a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date_fiscal a118
on (a11.fiscal_date_key = a118.row_key)
union
select 'ldb.d_calendar_fiscal_year a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date_fiscal a118
on (a11.fiscal_date_key = a118.row_key)
join ldb.d_calendar_fiscal_year a119
on (a118.year_start_date_key = a119.row_key)
union
select 'ldb.d_calendar_year a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key) join ldb.d_calendar_quarter a19
on (a18.quarter_start_date_key = a19.row_key)
join ldb.d_calendar_year a120
on (a19.year_start_date_key = a120.row_key)
union
select 'ldb.d_location a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_location a121
on (a11.location_key = a121.row_key)
union
select 'ldb.d_business_service_parent_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_business_service a16
on (a11.business_service_key = a16.row_key)
join ldb.d_business_service_parent_c a122
on (a16.parent_business_service_c_key = a122.row_key)
union
select 'ldb.d_application_mdm a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_mdm a123
on (a12.mdm_key = a123.row_key)
union
select 'ldb.d_lov_cr_assignee_prior_changes_bucket_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_lov_cr_assignee_prior_changes_bucket_c a124
on (a11.assignee_prior_changes_bucket_c_key = a124.row_key)
union
select 'ldb.d_lov_cr_assignee_prior_changes_failure_rate_bucket_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_lov_cr_assignee_prior_changes_failure_rate_bucket_c a125
on (a11.assignee_prior_changes_failure_rate_bucket_c_key = a125.row_key)
union
select 'ldb.d_internal_organization_change_request_ci_approval_group_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_organization_change_request_ci_approval_group_c a126
on (a11.approval_group_c_key = a126.row_key)
union
select 'ldb.d_change_request_approval a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_approval a127
on (a11.approval_state_src_key = a127.row_key)
union
select 'ldb.d_change_request_category a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_category a128
on (a11.category_src_key = a128.row_key)
union
select 'ldb.d_change_request_reported_type a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_reported_type a129
on (a11.reported_type_src_key = a129.row_key)
union
select 'ldb.d_change_request_impact a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_impact a130
on (a11.impact_src_key = a130.row_key)
union
select 'ldb.d_internal_contact_change_request_manager_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_contact_change_request_manager_c a131
on (a11.change_manager_c_key = a131.row_key)
union
select 'ldb.d_change_request_priority a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_priority a132
on (a11.priority_src_key = a132.row_key)
union
select 'ldb.d_change_request_reason a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_reason a133
on (a11.reason_src_key = a133.row_key)
union
select 'ldb.d_change_request_review_status a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_review_status a134
on (a11.review_status_src_key = a134.row_key)
union
select 'ldb.d_change_request_scope a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_scope a135
on (a11.scope_src_key = a135.row_key)
union
select 'ldb.d_configuration_item_change_request_service_offering_c a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_configuration_item_change_request_service_offering_c a136
on (a11.service_offering_c_key = a136.row_key)
union
select 'ldb.d_change_request_state a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_state a137
on (a11.state_src_key = a137.row_key)
union
select 'ldb.d_change_request_type a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_type a138
on (a11.type_src_key = a138.row_key)
union
select 'ldb.d_change_request_urgency a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_urgency a139
on (a11.urgency_src_key = a139.row_key)
union
select 'ldb.d_critical_incident_c a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_critical_incident_c a140
on (a11.critical_incident_c_key = a140.row_key)
union
select 'ldb.d_domain a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_domain a141
on (a11.domain_key = a141.row_key)
union
select 'ldb.d_lov_change_req_pg_downtime_priority_c a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_lov_change_req_pg_downtime_priority_c a142
on (a11.pg_downtime_priority_src_c_key = a142.row_key)
union
select 'ldb.d_incident a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_incident a143
on (a11.incident_key = a143.row_key)
union
select 'ldb.d_internal_contact_change_request_ci_owned_by_c a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_contact_change_request_ci_owned_by_c a144
on (a11.owned_by_c_key = a144.row_key)
union
select 'ldb.d_internal_contact_test_manager_c a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_contact_test_manager_c a145
on (a11.test_manager_c_key = a145.row_key)
union
select 'ldb.d_lov_change_request_impact_classification_c a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key)
join ldb.d_lov_change_request_impact_classification_c a146
on (a14.impact_classification_c_key = a146.row_key)
union
select 'ldb.d_business_service_criticality a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_business_service a16
on (a11.business_service_key = a16.row_key)
join ldb.d_business_service_criticality a147
on (a16.criticality_key = a147.row_key)
union
select 'ldb.d_business_service_used_for a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_business_service a16
on (a11.business_service_key = a16.row_key)
join ldb.d_business_service_used_for a148
on (a16.used_for_src_key = a148.row_key)
union
select 'ldb.d_calendar_week a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
join ldb.d_calendar_week a149
on (a17.week_start_date_key = a149.row_key)
union
select 'ldb.d_change_request_close_code a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key)
join ldb.d_change_request_close_code a150
on (a14.close_code_src_key = a150.row_key)
union
select 'ldb.d_lov_change_request_component_c a151 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key)
join ldb.d_lov_change_request_component_c a151
on (a14.component_c_key = a151.row_key)
union
select 'ldb.d_lov_change_request_multi_service_impact_c a152 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key)
join ldb.d_lov_change_request_multi_service_impact_c a152
on (a14.multi_service_impact_src_c_key = a152.row_key)
union
select 'ldb.d_internal_organization_department a153 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_organization_department a153
on (a11.requested_by_department_key = a153.row_key)
union
select 'ldb.d_lov_change_request_downtime_impact_c a154 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key)
join ldb.d_lov_change_request_downtime_impact_c a154
on (a14.change_downtime_impact_c_key = a154.row_key)
union
select 'ldb.d_internal_contact_mdm a155 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_contact a117
on (a11.employee_key = a117.row_key)
join ldb.d_internal_contact_mdm a155
on (a117.employee_mdm_key = a155.row_key)
union
select 'ldb.d_calendar_fiscal_quarter a156 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date_fiscal a118
on (a11.fiscal_date_key = a118.row_key)
join ldb.d_calendar_fiscal_quarter a156
on (a118.quarter_start_date_key = a156.row_key)
union
select 'ldb.d_lov_change_request_project_related_c a157 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key)
join ldb.d_lov_change_request_project_related_c a157
on (a14.project_related_c_key = a157.row_key)
union
select 'ldb.d_lov_change_request_require_downtime_c a158 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key)
join ldb.d_lov_change_request_require_downtime_c a158
on (a14.require_downtime_src_c_key = a158.row_key)
union
select 'ldb.d_lov_change_request_service_type_c a159 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key)
join ldb.d_lov_change_request_service_type_c a159
on (a14.service_type_src_c_key = a159.row_key)
union
select 'ldb.d_lov_change_request_capability_to_detect_c a160 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key)
join ldb.d_lov_change_request_capability_to_detect_c a160
on (a14.capability_to_detect_src_c_key = a160.row_key)
union
select 'ldb.d_configuration_item_criticality_c a161 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_configuration_item a115
on (a11.configuration_item_key = a115.row_key)
join ldb.d_configuration_item_criticality_c a161
on (a115.business_critical_c_key = a161.row_key)
union
select 'ldb.d_business_service_grand_parent_c a162 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_business_service a16
on (a11.business_service_key = a16.row_key) join ldb.d_business_service_parent_c a122
on (a16.parent_business_service_c_key = a122.row_key)
join ldb.d_business_service_grand_parent_c a162
on (a122.parent_business_service_c_key = a162.row_key)