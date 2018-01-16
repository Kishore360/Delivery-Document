select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
union
select 'ldb.d_customer a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a12 
on (a11.customer_key = a12.row_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
union
select 'ldb.d_calendar_time a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
union
select 'ldb.dh_user_group_hierarchy a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
join ldb.dh_user_group_hierarchy a17 
on (a16.row_dn_key = a17.lev_0_key) 
union
select 'ldb.d_business_service a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a18 
on (a11.business_service_key = a18.row_key) 
union
select 'ldb.d_configuration_item a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a19 
on (a11.configuration_item_key = a19.row_key) 
union
select 'ldb.d_calendar_date a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
union
select 'ldb.d_change_request_caused_by a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_change_request_caused_by a111 
on (a11.caused_by_change_key = a111.row_key) 
union
select 'ldb.d_change_request a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_change_request a112 
on (a11.change_request_key = a112.row_key) 
union
select 'ldb.d_incident a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a113 
on (a11.incident_key = a113.row_key) 
union
select 'ldb.d_internal_contact_requested_for_incident_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_requested_for_incident_c a114 
on (a11.requested_for_key = a114.row_key) 
union
select 'ldb.d_internal_contact_executive_supervisor_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a19 
on (a11.configuration_item_key = a19.row_key) 
join ldb.d_internal_contact_executive_supervisor_c a115 
on (a19.executive_sponsor_c_key = a115.row_key) 
union
select 'ldb.d_incident_parent_task_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_parent_task_c a116 
on (a11.parent_task_c_key = a116.row_key) 
union
select 'ldb.d_location_requested_for a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_requested_for_incident_c a114 
on (a11.requested_for_key = a114.row_key) 
join ldb.d_location_requested_for a117 
on (a114.location_key = a117.row_key) 
union
select 'ldb.d_internal_organization_resolver_group_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_resolver_group_c a118 
on (a11.resolver_group_c_key = a118.row_key) 
union
select 'ldb.dh_resolver_group_hierarchy_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_resolver_group_c a118 
on (a11.resolver_group_c_key = a118.row_key) 
join ldb.dh_resolver_group_hierarchy_c a119 
on (a118.row_dn_key = a119.lev_0_key) 
union
select 'ldb.d_task_priority a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_priority a120 
on (a11.priority_src_key = a120.row_key) 
union
select 'ldb.d_lov_area_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_area_c a121 
on (a11.area_c_key = a121.row_key) 
union
select 'ldb.d_lov_category_selector_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_category_selector_c a122 
on (a11.category_selector_c_key = a122.row_key) 
union
select 'ldb.d_internal_organization_legalentity a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_legalentity a123 
on (a11.company_key = a123.row_key) 
union
select 'ldb.d_incident_contact_type_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_contact_type_c a124 
on (a11.contact_type_src_c_key = a124.row_key) 
union
select 'ldb.d_customer_mdm a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a12 
on (a11.customer_key = a12.row_key) 
join ldb.d_customer_mdm a125 
on (a12.row_current_key = a125.row_current_key) 
union
select 'ldb.d_lov_data_center_ops_locations_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_data_center_ops_locations_c a126 
on (a11.data_center_ops_locations_c_key = a126.row_key) 
union
select 'ldb.d_internal_organization_department a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_department a127 
on (a11.opened_by_department_key = a127.row_key) 
union
select 'ldb.d_domain a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_domain a128 
on (a11.domain_key = a128.row_key) 
union
select 'ldb.d_internal_contact_mdm a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_contact_mdm a129 
on (a13.row_current_key = a129.row_current_key) 
union
select 'ldb.d_lov_tier_4_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_tier_4_c a130 
on (a11.tier_4_c_key = a130.row_key) 
union
select 'ldb.d_calendar_time_hour a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
join ldb.d_calendar_time_hour a131 
on (a14.hour_24_format_num = a131.hour_24_format_num) 
union
select 'ldb.d_internal_contact_incident_opened_by_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_incident_opened_by_c a132 
on (a11.opened_by_c_key = a132.row_key) 
union
select 'ldb.d_lov_problem_category_incident_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_problem_category_incident_c a133 
on (a11.problem_category_c_key = a133.row_key) 
union
select 'ldb.d_lov_region_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_region_c a134 
on (a11.region_c_key = a134.row_key) 
union
select 'ldb.d_lov_resolved_via_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_resolved_via_c a135 
on (a11.resolved_via_c_key = a135.row_key) 
union
select 'ldb.d_lov_root_cause_category_c a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_root_cause_category_c a136 
on (a11.root_cause_category_src_c_key = a136.row_key) 
union
select 'ldb.d_lov_u_reason_for_l1_resolveable_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_u_reason_for_l1_resolveable_c a137 
on (a11.reason_for_l1_resolveable_c_reason_for_l1_resolveable_key = a137.row_key) 
union
select 'ldb.d_lov_source_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_source_c a138 
on (a11.source_src_c_key = a138.row_key) 
union
select 'ldb.d_task_impact a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_impact a139 
on (a11.impact_src_key = a139.row_key) 
union
select 'ldb.d_location a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location a140 
on (a11.location_key = a140.row_key) 
union
select 'ldb.d_task_urgency a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_urgency a141 
on (a11.urgency_src_key = a141.row_key) 
union
select 'ldb.d_internal_contact_assigned_to_manager_c a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
join ldb.d_internal_contact_assigned_to_manager_c a142 
on (a15.manager_c_key = a142.row_key) 
union
select 'ldb.dh_user_group_level1 a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) join ldb.dh_user_group_hierarchy a17 
on (a16.row_dn_key = a17.lev_0_key) 
join ldb.dh_user_group_level1 a143 
on (a17.lev_1_key = a143.row_key) 
union
select 'ldb.d_internal_contact_group_manager_c a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
join ldb.d_internal_contact_group_manager_c a144 
on (a16.org_manager_c_key = a144.row_key) 
union
select 'ldb.d_internal_organization_group_parent_c a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
join ldb.d_internal_organization_group_parent_c a145 
on (a16.parent_c_key = a145.row_key) 
union
select 'ldb.d_business_service_criticality a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a18 
on (a11.business_service_key = a18.row_key) 
join ldb.d_business_service_criticality a146 
on (a18.criticality_key = a146.row_key) 
union
select 'ldb.d_business_service_used_for a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a18 
on (a11.business_service_key = a18.row_key) 
join ldb.d_business_service_used_for a147 
on (a18.used_for_src_key = a147.row_key) 
union
select 'ldb.d_lov_incident_dispatch_reason_c a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a113 
on (a11.incident_key = a113.row_key) 
join ldb.d_lov_incident_dispatch_reason_c a148 
on (a113.dispatch_reason_src_c_key = a148.row_key) 
union
select 'ldb.d_incident_category a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a113 
on (a11.incident_key = a113.row_key) 
join ldb.d_incident_category a149 
on (a113.category_src_key = a149.row_key) 
union
select 'ldb.d_incident_close_code a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a113 
on (a11.incident_key = a113.row_key) 
join ldb.d_incident_close_code a150 
on (a113.close_code_src_key = a150.row_key) 
union
select 'ldb.d_incident_severity a151 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a113 
on (a11.incident_key = a113.row_key) 
join ldb.d_incident_severity a151 
on (a113.severity_src_key = a151.row_key) 
union
select 'ldb.d_incident_state a152 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a113 
on (a11.incident_key = a113.row_key) 
join ldb.d_incident_state a152 
on (a113.state_src_key = a152.row_key) 
union
select 'ldb.d_incident_subcategory a153 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a113 
on (a11.incident_key = a113.row_key) 
join ldb.d_incident_subcategory a153 
on (a113.sub_category_src_key = a153.row_key) 
union
select 'ldb.d_parent_incident a154 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a113 
on (a11.incident_key = a113.row_key) 
join ldb.d_parent_incident a154 
on (a113.parent_incident_key = a154.row_key) 
union
select 'ldb.dh_user_resolver_group_level1_c a155 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_resolver_group_c a118 
on (a11.resolver_group_c_key = a118.row_key) join ldb.dh_resolver_group_hierarchy_c a119 
on (a118.row_dn_key = a119.lev_0_key) 
join ldb.dh_user_resolver_group_level1_c a155 
on (a119.lev_1_key = a155.row_key) 
union
select 'ldb.dh_user_group_level2 a156 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) join ldb.dh_user_group_hierarchy a17 
on (a16.row_dn_key = a17.lev_0_key) 
join ldb.dh_user_group_level2 a156 
on (a17.lev_2_key = a156.row_key) 
union
select 'ldb.d_calendar_month a157 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
join ldb.d_calendar_month a157 
on (a110.month_start_date_key = a157.row_key) 
union
select 'ldb.dh_user_resolver_group_level2_c a158 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_resolver_group_c a118 
on (a11.resolver_group_c_key = a118.row_key) join ldb.dh_resolver_group_hierarchy_c a119 
on (a118.row_dn_key = a119.lev_0_key) 
join ldb.dh_user_resolver_group_level2_c a158 
on (a119.lev_2_key = a158.row_key) 
union
select 'ldb.dh_user_group_level3 a159 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) join ldb.dh_user_group_hierarchy a17 
on (a16.row_dn_key = a17.lev_0_key) 
join ldb.dh_user_group_level3 a159 
on (a17.lev_3_key = a159.row_key) 
union
select 'ldb.dh_user_resolver_group_level3_c a160 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_resolver_group_c a118 
on (a11.resolver_group_c_key = a118.row_key) join ldb.dh_resolver_group_hierarchy_c a119 
on (a118.row_dn_key = a119.lev_0_key) 
join ldb.dh_user_resolver_group_level3_c a160 
on (a119.lev_3_key = a160.row_key) 
union
select 'ldb.dh_user_group_level4 a161 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) join ldb.dh_user_group_hierarchy a17 
on (a16.row_dn_key = a17.lev_0_key) 
join ldb.dh_user_group_level4 a161 
on (a17.lev_4_key = a161.row_key) 
union
select 'ldb.dh_user_resolver_group_level4_c a162 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_resolver_group_c a118 
on (a11.resolver_group_c_key = a118.row_key) join ldb.dh_resolver_group_hierarchy_c a119 
on (a118.row_dn_key = a119.lev_0_key) 
join ldb.dh_user_resolver_group_level4_c a162 
on (a119.lev_4_key = a162.row_key) 
union
select 'ldb.dh_user_group_level5 a163 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) join ldb.dh_user_group_hierarchy a17 
on (a16.row_dn_key = a17.lev_0_key) 
join ldb.dh_user_group_level5 a163 
on (a17.lev_5_key = a163.row_key) 
union
select 'ldb.dh_user_resolver_group_level5_c a164 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_resolver_group_c a118 
on (a11.resolver_group_c_key = a118.row_key) join ldb.dh_resolver_group_hierarchy_c a119 
on (a118.row_dn_key = a119.lev_0_key) 
join ldb.dh_user_resolver_group_level5_c a164 
on (a119.lev_5_key = a164.row_key) 

