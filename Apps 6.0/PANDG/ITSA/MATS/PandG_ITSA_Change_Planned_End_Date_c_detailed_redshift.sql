select 'ldb.f_change_request_planned_end_date a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_internal_contact a12 
on (a11.employee_key = a12.row_key) 
union
select 'ldb.d_calendar_date_fiscal a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_calendar_date_fiscal a13 on (a11.date_key = a13.row_key) 
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
union
select 'ldb.d_change_request a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_change_request a15 
on (a11.change_request_key = a15.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_internal_contact_assigned_to a16 
on (a11.assigned_to_key = a16.row_key) 
union
select 'ldb.dh_user_group_hierarchy a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
join ldb.dh_user_group_hierarchy a17 
on (a14.row_dn_key = a17.lev_0_key) 
union
select 'ldb.d_business_service a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_business_service a18 
on (a11.business_service_key = a18.row_key) 
union
select 'ldb.d_calendar_date a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_calendar_date a19 
on (a11.date_key = a19.row_key) 
union
select 'ldb.d_co_manager_role_vp_dir_ad_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_co_manager_role_vp_dir_ad_c a110 
on (a11.owned_by_c_key = a110.change_owner_key) 
union
select 'ldb.d_internal_contact_co_associate_director_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_co_manager_role_vp_dir_ad_c a110 
on (a11.owned_by_c_key = a110.change_owner_key) 
join ldb.d_internal_contact_co_associate_director_c a111 
on (a110.associate_director_key = a111.row_key) 
union
select 'ldb.d_internal_contact_co_director_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_co_manager_role_vp_dir_ad_c a110 
on (a11.owned_by_c_key = a110.change_owner_key) 
join ldb.d_internal_contact_co_director_c a112 
on (a110.director_key = a112.row_key) 
union
select 'ldb.d_change_request_risk a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_change_request_risk a113 
on (a11.risk_src_key = a113.row_key) 
union
select 'ldb.d_internal_contact_co_vp_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_co_manager_role_vp_dir_ad_c a110 
on (a11.owned_by_c_key = a110.change_owner_key) 
join ldb.d_internal_contact_co_vp_c a114 
on (a110.vp_key = a114.row_key) 
union
select 'ldb.d_configuration_item a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_configuration_item a115 
on (a11.configuration_item_key = a115.row_key) 
union
select 'ldb.d_calendar_month a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_calendar_date a19 
on (a11.date_key = a19.row_key) 
join ldb.d_calendar_month a116 
on (a19.month_start_date_key = a116.row_key) 
union
select 'ldb.d_location a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_location a117 
on (a11.location_key = a117.row_key) 
union
select 'ldb.d_business_service_parent_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_business_service a18 
on (a11.business_service_key = a18.row_key) 
join ldb.d_business_service_parent_c a118 
on (a18.parent_business_service_c_key = a118.row_key) 
union
select 'ldb.d_lov_cr_assignee_prior_changes_bucket_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_lov_cr_assignee_prior_changes_bucket_c a119 
on (a11.assignee_prior_changes_bucket_c_key = a119.row_key) 
union
select 'ldb.d_lov_cr_assignee_prior_changes_failure_rate_bucket_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_lov_cr_assignee_prior_changes_failure_rate_bucket_c a120 
on (a11.assignee_prior_changes_failure_rate_bucket_c_key = a120.row_key) 
union
select 'ldb.d_internal_organization_change_request_ci_approval_group_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_internal_organization_change_request_ci_approval_group_c a121 
on (a11.approval_group_c_key = a121.row_key) 
union
select 'ldb.d_change_request_approval a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_change_request_approval a122 
on (a11.approval_state_src_key = a122.row_key) 
union
select 'ldb.d_change_request_category a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_change_request_category a123 
on (a11.category_src_key = a123.row_key) 
union
select 'ldb.d_change_request_reported_type a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_change_request_reported_type a124 
on (a11.reported_type_src_key = a124.row_key) 
union
select 'ldb.d_change_request_impact a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_change_request_impact a125 
on (a11.impact_src_key = a125.row_key) 
union
select 'ldb.d_internal_contact_change_request_manager_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_internal_contact_change_request_manager_c a126 
on (a11.change_manager_c_key = a126.row_key) 
union
select 'ldb.d_change_request_priority a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_change_request_priority a127 
on (a11.priority_src_key = a127.row_key) 
union
select 'ldb.d_change_request_reason a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_change_request_reason a128 
on (a11.reason_src_key = a128.row_key) 
union
select 'ldb.d_change_request_review_status a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_change_request_review_status a129 
on (a11.review_status_src_key = a129.row_key) 
union
select 'ldb.d_change_request_scope a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_change_request_scope a130 
on (a11.scope_src_key = a130.row_key) 
union
select 'ldb.d_configuration_item_change_request_service_offering_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_configuration_item_change_request_service_offering_c a131 
on (a11.service_offering_c_key = a131.row_key) 
union
select 'ldb.d_change_request_state a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_change_request_state a132 
on (a11.state_src_key = a132.row_key) 
union
select 'ldb.d_change_request_type a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_change_request_type a133 
on (a11.type_src_key = a133.row_key) 
union
select 'ldb.d_change_request_urgency a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_change_request_urgency a134 
on (a11.urgency_src_key = a134.row_key) 
union
select 'ldb.d_critical_incident_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_critical_incident_c a135 
on (a11.critical_incident_c_key = a135.row_key) 
union
select 'ldb.d_internal_organization_department a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_internal_organization_department a136 
on (a11.requested_by_department_key = a136.row_key) 
union
select 'ldb.d_domain a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_domain a137 
on (a11.domain_key = a137.row_key) 
union
select 'ldb.d_lov_change_req_pg_downtime_priority_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_lov_change_req_pg_downtime_priority_c a138 
on (a11.pg_downtime_priority_src_c_key = a138.row_key) 
union
select 'ldb.d_internal_contact_mdm a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_internal_contact a12 
on (a11.employee_key = a12.row_key) 
join ldb.d_internal_contact_mdm a139 
on (a12.row_current_key = a139.row_current_key) 
union
select 'ldb.d_calendar_fiscal_quarter a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.date_key = a13.row_key) 
join ldb.d_calendar_fiscal_quarter a140 
on (a13.quarter_start_date_key = a140.row_key) 
union
select 'ldb.d_incident a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_incident a141 
on (a11.incident_key = a141.row_key) 
union
select 'ldb.d_internal_contact_change_request_ci_owned_by_c a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_internal_contact_change_request_ci_owned_by_c a142 
on (a11.owned_by_c_key = a142.row_key) 
union
select 'ldb.d_internal_contact_test_manager_c a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_internal_contact_test_manager_c a143 
on (a11.test_manager_c_key = a143.row_key) 
union
select 'ldb.dh_user_group_level1 a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) join ldb.dh_user_group_hierarchy a17 
on (a14.row_dn_key = a17.lev_0_key) 
join ldb.dh_user_group_level1 a144 
on (a17.lev_1_key = a144.row_key) 
union
select 'ldb.d_lov_change_request_impact_classification_c a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_change_request a15 
on (a11.change_request_key = a15.row_key) 
join ldb.d_lov_change_request_impact_classification_c a145 
on (a15.impact_classification_c_key = a145.row_key) 
union
select 'ldb.d_business_service_criticality a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_business_service a18 
on (a11.business_service_key = a18.row_key) 
join ldb.d_business_service_criticality a146 
on (a18.criticality_key = a146.row_key) 
union
select 'ldb.d_business_service_used_for a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_business_service a18 
on (a11.business_service_key = a18.row_key) 
join ldb.d_business_service_used_for a147 
on (a18.used_for_src_key = a147.row_key) 
union
select 'ldb.d_calendar_week a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_calendar_date a19 
on (a11.date_key = a19.row_key) 
join ldb.d_calendar_week a148 
on (a19.week_start_date_key = a148.row_key) 
union
select 'ldb.d_change_request_close_code a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_change_request a15 
on (a11.change_request_key = a15.row_key) 
join ldb.d_change_request_close_code a149 
on (a15.close_code_src_key = a149.row_key) 
union
select 'ldb.d_lov_change_request_component_c a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_change_request a15 
on (a11.change_request_key = a15.row_key) 
join ldb.d_lov_change_request_component_c a150 
on (a15.component_c_key = a150.row_key) 
union
select 'ldb.d_lov_change_request_multi_service_impact_c a151 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_change_request a15 
on (a11.change_request_key = a15.row_key) 
join ldb.d_lov_change_request_multi_service_impact_c a151 
on (a15.multi_service_impact_src_c_key = a151.row_key) 
union
select 'ldb.d_lov_change_request_downtime_impact_c a152 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_change_request a15 
on (a11.change_request_key = a15.row_key) 
join ldb.d_lov_change_request_downtime_impact_c a152 
on (a15.change_downtime_impact_c_key = a152.row_key) 
union
select 'ldb.d_calendar_fiscal_year a153 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.date_key = a13.row_key) 
join ldb.d_calendar_fiscal_year a153 
on (a13.year_start_date_key = a153.row_key) 
union
select 'ldb.d_lov_change_request_project_related_c a154 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_change_request a15 
on (a11.change_request_key = a15.row_key) 
join ldb.d_lov_change_request_project_related_c a154 
on (a15.project_related_c_key = a154.row_key) 
union
select 'ldb.d_lov_change_request_require_downtime_c a155 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_change_request a15 
on (a11.change_request_key = a15.row_key) 
join ldb.d_lov_change_request_require_downtime_c a155 
on (a15.require_downtime_src_c_key = a155.row_key) 
union
select 'ldb.d_lov_change_request_service_type_c a156 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_change_request a15 
on (a11.change_request_key = a15.row_key) 
join ldb.d_lov_change_request_service_type_c a156 
on (a15.service_type_src_c_key = a156.row_key) 
union
select 'ldb.d_lov_change_request_capability_to_detect_c a157 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_change_request a15 
on (a11.change_request_key = a15.row_key) 
join ldb.d_lov_change_request_capability_to_detect_c a157 
on (a15.capability_to_detect_src_c_key = a157.row_key) 
union
select 'ldb.dh_user_group_level2 a158 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) join ldb.dh_user_group_hierarchy a17 
on (a14.row_dn_key = a17.lev_0_key) 
join ldb.dh_user_group_level2 a158 
on (a17.lev_2_key = a158.row_key) 
union
select 'ldb.d_calendar_quarter a159 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_calendar_date a19 on (a11.date_key = a19.row_key) 
join ldb.d_calendar_month a20 ON (a19.month_start_date_key=a20.row_key)
join ldb.d_calendar_quarter a159 on (a20.quarter_start_date_key = a159.row_key) 
union
select 'ldb.d_business_service_grand_parent_c a160 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_business_service a18 
on (a11.business_service_key = a18.row_key) join ldb.d_business_service_parent_c a118 
on (a18.parent_business_service_c_key = a118.row_key) 
join ldb.d_business_service_grand_parent_c a160 
on (a118.parent_business_service_c_key = a160.row_key) 
union

select 'ldb.d_calendar_year a160' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_calendar_date a19 on (a11.date_key = a19.row_key) 
join ldb.d_calendar_month a20 ON (a19.month_start_date_key=a20.row_key)
join ldb.d_calendar_quarter a159 on (a20.quarter_start_date_key = a159.row_key) 
JOIN ldb.d_calendar_year a160 ON a159.year_start_date_key=a160.row_key

