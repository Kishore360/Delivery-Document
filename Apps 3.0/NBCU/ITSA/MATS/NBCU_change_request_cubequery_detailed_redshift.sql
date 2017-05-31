select 'ldb.f_change_request a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_internal_organization_group a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) 
union
select 'ldb.dh_user_group_hierarchy a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) 
join ldb.dh_user_group_hierarchy a14 
on (a13.row_dn_key = a14.lev_0_key) 
union
select 'ldb.d_business_service a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_business_service a15 
on (a11.business_service_key = a15.row_key) 
union
select 'ldb.d_change_request a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a16 
on (a11.change_request_key = a16.row_key) 
union
select 'ldb.d_configuration_item a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_configuration_item a17 
on (a11.configuration_item_key = a17.row_key) 
union
select 'ldb.d_calendar_date a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact_assigned_to a19 
on (a11.assigned_to_key = a19.row_key) 
union
select 'ldb.d_change_request_category a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_category a110 
on (a11.category_src_key = a110.row_key) 
union
select 'ldb.d_change_request_impact a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_impact a111 
on (a11.impact_src_key = a111.row_key) 
union
select 'ldb.d_change_request_priority a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_priority a112 
on (a11.priority_src_key = a112.row_key) 
union
select 'ldb.d_change_request_reason a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_reason a113 
on (a11.reason_src_key = a113.row_key) 
union
select 'ldb.d_change_request_reported_type a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_reported_type a114 
on (a11.reported_type_src_key = a114.row_key) 
union
select 'ldb.d_change_request_state a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_state a115 
on (a11.state_src_key = a115.row_key) 
union
select 'ldb.d_change_request_review_status a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_review_status a116 
on (a11.review_status_src_key = a116.row_key) 
union
select 'ldb.d_change_request_risk a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_risk a117 
on (a11.risk_src_key = a117.row_key) 
union
select 'ldb.d_change_request_scope a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_scope a118 
on (a11.scope_src_key = a118.row_key) 
union
select 'ldb.d_change_request_type a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_type a119 
on (a11.type_src_key = a119.row_key) 
union
select 'ldb.d_change_request_urgency a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_urgency a120 
on (a11.urgency_src_key = a120.row_key) 
union
select 'ldb.d_lov_change_request_completion_code_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_lov_change_request_completion_code_c a121 
on (a11.completion_code_src_c_key = a121.row_key) 
union
select 'ldb.d_internal_organization_department a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_department a122 
on (a11.requested_by_department_key = a122.row_key) 
union
select 'ldb.d_domain a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_domain a123 
on (a11.domain_key = a123.row_key) 
union
select 'ldb.d_internal_contact_mdm a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a124 
on (a12.row_current_key = a124.row_current_key) 
union
select 'ldb.d_lov_change_request_sub_category_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_lov_change_request_sub_category_c a125 
on (a11.sub_category_src_c_key = a125.row_key) 
union
select 'ldb.d_location a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_location a126 
on (a11.location_key = a126.row_key) 
union
select 'ldb.d_lov_change_request_urgency_category_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_lov_change_request_urgency_category_c a127 
on (a11.urgency_category_src_c_key = a127.row_key) 
union
select 'ldb.dh_user_group_level1 a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) join ldb.dh_user_group_hierarchy a14 
on (a13.row_dn_key = a14.lev_0_key) 
join ldb.dh_user_group_level1 a128 
on (a14.lev_1_key = a128.row_key) 
union
select 'ldb.d_business_service_criticality a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_business_service a15 
on (a11.business_service_key = a15.row_key) 
join ldb.d_business_service_criticality a129 
on (a15.criticality_key = a129.row_key) 
union
select 'ldb.d_business_service_used_for a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_business_service a15 
on (a11.business_service_key = a15.row_key) 
join ldb.d_business_service_used_for a130 
on (a15.used_for_src_key = a130.row_key) 
union
select 'ldb.dh_user_group_level2 a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) join ldb.dh_user_group_hierarchy a14 
on (a13.row_dn_key = a14.lev_0_key) 
join ldb.dh_user_group_level2 a131 
on (a14.lev_2_key = a131.row_key) 
union
select 'ldb.d_calendar_month a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_month a132 
on (a18.month_start_date_key = a132.row_key) 
union
select 'ldb.dh_user_group_level3 a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) join ldb.dh_user_group_hierarchy a14 
on (a13.row_dn_key = a14.lev_0_key) 
join ldb.dh_user_group_level3 a133 
on (a14.lev_3_key = a133.row_key) 
union
select 'ldb.dh_user_group_level4 a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) join ldb.dh_user_group_hierarchy a14 
on (a13.row_dn_key = a14.lev_0_key) 
join ldb.dh_user_group_level4 a134 
on (a14.lev_4_key = a134.row_key) 
union
select 'ldb.dh_user_group_level5 a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) join ldb.dh_user_group_hierarchy a14 
on (a13.row_dn_key = a14.lev_0_key) 
join ldb.dh_user_group_level5 a135 
on (a14.lev_5_key = a135.row_key) 
union
select 'ldb.d_internal_contact_executive_supervisor_c a138' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join  ldb.d_configuration_item a17 
on (a11.configuration_item_key = a17.row_key) 
join ldb.d_internal_contact_executive_supervisor_c a138
on 	(a17.executive_sponsor_c_key = a138.row_key)

