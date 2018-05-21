select 'ldb.f_change_request a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_change_request a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a13 
on (a11.change_request_key = a13.row_key) 
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
select 'ldb.dh_user_group_hierarchy a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
union
select 'ldb.d_business_service a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_business_service a17 
on (a11.business_service_key = a17.row_key) 
union
select 'ldb.d_calendar_date a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
union
select 'ldb.d_co_manager_role_vp_dir_ad_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_co_manager_role_vp_dir_ad_c a19 
on (a11.owned_by_c_key = a19.change_owner_key) 
union
select 'ldb.d_internal_contact_co_associate_director_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_co_manager_role_vp_dir_ad_c a19 
on (a11.owned_by_c_key = a19.change_owner_key) 
join ldb.d_internal_contact_co_associate_director_c a110 
on (a19.associate_director_key = a110.row_key) 
union
select 'ldb.d_internal_contact_co_director_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_co_manager_role_vp_dir_ad_c a19 
on (a11.owned_by_c_key = a19.change_owner_key) 
join ldb.d_internal_contact_co_director_c a111 
on (a19.director_key = a111.row_key) 
union
select 'ldb.d_change_request_risk a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_risk a112 
on (a11.risk_src_key = a112.row_key) 
union
select 'ldb.d_internal_contact_co_vp_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_co_manager_role_vp_dir_ad_c a19 
on (a11.owned_by_c_key = a19.change_owner_key) 
join ldb.d_internal_contact_co_vp_c a113 
on (a19.vp_key = a113.row_key) 
union
select 'ldb.d_configuration_item a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_configuration_item a114 
on (a11.configuration_item_key = a114.row_key) 
union
select 'ldb.d_calendar_month a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_month a115 
on (a18.month_start_date_key = a115.row_key) 
union
select 'ldb.d_lov_cr_assignee_prior_changes_bucket_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_lov_cr_assignee_prior_changes_bucket_c a116 
on (a11.assignee_prior_changes_bucket_c_key = a116.row_key) 
union
select 'ldb.d_lov_cr_assignee_prior_changes_failure_rate_bucket_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_lov_cr_assignee_prior_changes_failure_rate_bucket_c a117 
on (a11.assignee_prior_changes_failure_rate_bucket_c_key = a117.row_key) 
union
select 'ldb.d_internal_organization_change_request_ci_approval_group_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_change_request_ci_approval_group_c a118 
on (a11.approval_group_c_key = a118.row_key) 
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
select 'ldb.d_internal_contact_change_request_manager_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact_change_request_manager_c a123 
on (a11.change_manager_c_key = a123.row_key) 
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
select 'ldb.d_change_request_review_status a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_review_status a126 
on (a11.review_status_src_key = a126.row_key) 
union
select 'ldb.d_change_request_scope a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_scope a127 
on (a11.scope_src_key = a127.row_key) 
union
select 'ldb.d_configuration_item_change_request_service_offering_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_configuration_item_change_request_service_offering_c a128 
on (a11.service_offering_c_key = a128.row_key) 
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
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a134 
on (a12.row_current_key = a134.row_current_key) 
union
select 'ldb.d_location a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_location a135 
on (a11.location_key = a135.row_key) 
union
select 'ldb.d_internal_contact_change_request_ci_owned_by_c a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact_change_request_ci_owned_by_c a136 
on (a11.owned_by_c_key = a136.row_key) 
union
select 'ldb.dh_user_group_level1 a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level1 a137 
on (a16.lev_1_key = a137.row_key) 
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
select 'ldb.d_calendar_week a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_week a140 
on (a18.week_start_date_key = a140.row_key) 
union
select 'ldb.d_change_request_close_code a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a13 
on (a11.change_request_key = a13.row_key) 
join ldb.d_change_request_close_code a141 
on (a13.close_code_src_key = a141.row_key) 
union
select 'ldb.d_lov_change_request_multi_service_impact_c a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a13 
on (a11.change_request_key = a13.row_key) 
join ldb.d_lov_change_request_multi_service_impact_c a142 
on (a13.multi_service_impact_src_c_key = a142.row_key) 
union
select 'ldb.d_lov_change_request_require_downtime_c a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a13 
on (a11.change_request_key = a13.row_key) 
join ldb.d_lov_change_request_require_downtime_c a143 
on (a13.require_downtime_src_c_key = a143.row_key) 
union
select 'ldb.d_lov_change_request_service_type_c a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a13 
on (a11.change_request_key = a13.row_key) 
join ldb.d_lov_change_request_service_type_c a144 
on (a13.service_type_src_c_key = a144.row_key) 
union
select 'ldb.d_lov_change_request_capability_to_detect_c a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a13 
on (a11.change_request_key = a13.row_key) 
join ldb.d_lov_change_request_capability_to_detect_c a145 
on (a13.capability_to_detect_src_c_key = a145.row_key) 
union
select 'ldb.dh_user_group_level2 a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level2 a146 
on (a16.lev_2_key = a146.row_key) 
union
select 'ldb.d_calendar_quarter a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_quarter a147 
on (a18.quarter_start_date_key = a147.row_key) 
union
select 'ldb.d_calendar_year a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_year a148 
on (a18.year_start_date_key = a148.row_key) 
