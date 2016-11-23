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
select 'ldb.d_internal_contact_requested_for_incident_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_requested_for_incident_c a113 
on (a11.requested_for_key = a113.row_key) 
union
select 'ldb.d_incident a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 

join ldb.d_incident a114 
on (1 = 1 and a11.incident_key = a114.row_key) 
union
select 'ldb.d_location_requested_for a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_requested_for_incident_c a113 
on (a11.requested_for_key = a113.row_key) 
join ldb.d_location_requested_for a115 
on (a113.location_key = a115.row_key) 
union
select 'ldb.d_internal_organization_resolver_group_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_resolver_group_c a116 
on (a11.resolver_group_c_key = a116.row_key) 
union
select 'ldb.dh_resolver_group_hierarchy_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_resolver_group_c a116 
on (a11.resolver_group_c_key = a116.row_key) 
join ldb.dh_resolver_group_hierarchy_c a117 
on (a116.row_dn_key = a117.lev_0_key) 
union
select 'ldb.d_task_priority a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_priority a118 
on (a11.priority_src_key = a118.row_key) 
union
select 'ldb.d_lov_area_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_area_c a119 
on (a11.area_c_key = a119.row_key) 
union
select 'ldb.d_lov_category_selector_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_category_selector_c a120 
on (a11.category_selector_c_key = a120.row_key) 
union
select 'ldb.d_internal_organization_legalentity a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_legalentity a121 
on (a11.company_key = a121.row_key) 
union
select 'ldb.d_incident_contact_type_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_contact_type_c a122 
on (a11.contact_type_src_c_key = a122.row_key) 
union
select 'ldb.d_customer_mdm a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a12 
on (a11.customer_key = a12.row_key) 
join ldb.d_customer_mdm a123 
on (a12.row_current_key = a123.row_current_key) 
union
select 'ldb.d_lov_data_center_ops_locations_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_data_center_ops_locations_c a124 
on (a11.data_center_ops_locations_c_key = a124.row_key) 
union
select 'ldb.d_internal_organization_department a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_department a125 
on (a11.opened_by_department_key = a125.row_key) 
union
select 'ldb.d_domain a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_domain a126 
on (a11.domain_key = a126.row_key) 
union
select 'ldb.d_internal_contact_mdm a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_contact_mdm a127 
on (a13.row_current_key = a127.row_current_key) 
union
select 'ldb.d_lov_tier_4_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_tier_4_c a128 
on (a11.tier_4_c_key = a128.row_key) 
union
select 'ldb.d_calendar_time_hour a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
join ldb.d_calendar_time_hour a129 
on (a14.hour_24_format_num = a129.hour_24_format_num) 
union
select 'ldb.d_lov_problem_category_incident_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_problem_category_incident_c a130 
on (a11.problem_category_c_key = a130.row_key) 
union
select 'ldb.d_lov_region_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_region_c a131 
on (a11.region_c_key = a131.row_key) 
union
select 'ldb.d_lov_resolved_via_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_resolved_via_c a132 
on (a11.resolved_via_c_key = a132.row_key) 
union
select 'ldb.d_lov_root_cause_category_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_root_cause_category_c a133 
on (a11.root_cause_category_src_c_key = a133.row_key) 
union
select 'ldb.d_lov_u_reason_for_l1_resolveable_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_u_reason_for_l1_resolveable_c a134 
on (a11.reason_for_l1_resolveable_c_reason_for_l1_resolveable_key = a134.row_key) 
union
select 'ldb.d_lov_source_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_source_c a135 
on (a11.source_src_c_key = a135.row_key) 
union
select 'ldb.d_task_impact a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_impact a136 
on (a11.impact_src_key = a136.row_key) 
union
select 'ldb.d_location a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location a137 
on (a11.location_key = a137.row_key) 
union
select 'ldb.d_task_urgency a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_urgency a138 
on (a11.urgency_src_key = a138.row_key) 
union
select 'ldb.d_internal_contact_assigned_to_manager_c a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
join ldb.d_internal_contact_assigned_to_manager_c a139 
on (a15.manager_c_key = a139.row_key) 
union
select 'ldb.dh_user_group_level1 a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) join ldb.dh_user_group_hierarchy a17 
on (a16.row_dn_key = a17.lev_0_key) 
join ldb.dh_user_group_level1 a140 
on (a17.lev_1_key = a140.row_key) 
union
select 'ldb.d_internal_contact_group_manager_c a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
join ldb.d_internal_contact_group_manager_c a141 
on (a16.org_manager_c_key = a141.row_key) 
union
select 'ldb.d_internal_organization_group_parent_c a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
join ldb.d_internal_organization_group_parent_c a142 
on (a16.parent_c_key = a142.row_key) 
union
select 'ldb.d_business_service_criticality a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a18 
on (a11.business_service_key = a18.row_key) 
join ldb.d_business_service_criticality a143 
on (a18.criticality_key = a143.row_key) 
union
select 'ldb.d_business_service_used_for a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a18 
on (a11.business_service_key = a18.row_key) 
join ldb.d_business_service_used_for a144 
on (a18.used_for_src_key = a144.row_key) 
union
select 'ldb.d_incident_category a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a114 
on (1 = 1 and a11.incident_key = a114.row_key) 
join ldb.d_incident_category a145 
on (a114.category_src_key = a145.row_key) 
union
select 'ldb.d_incident_close_code a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a114 
on (1 = 1 and a11.incident_key = a114.row_key) 
join ldb.d_incident_close_code a146 
on (a114.close_code_src_key = a146.row_key) 
union
select 'ldb.d_incident_severity a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a114 
on (1 = 1 and a11.incident_key = a114.row_key) 
join ldb.d_incident_severity a147 
on (a114.severity_src_key = a147.row_key) 
union
select 'ldb.d_incident_state a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a114 
on (1 = 1 and a11.incident_key = a114.row_key) 
join ldb.d_incident_state a148 
on (a114.state_src_key = a148.row_key) 
union
select 'ldb.d_incident_subcategory a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a114 
on (1 = 1 and a11.incident_key = a114.row_key) 
join ldb.d_incident_subcategory a149 
on (a114.sub_category_src_key = a149.row_key) 
union
select 'ldb.dh_user_resolver_group_level1_c a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_resolver_group_c a116 
on (a11.resolver_group_c_key = a116.row_key) join ldb.dh_resolver_group_hierarchy_c a117 
on (a116.row_dn_key = a117.lev_0_key) 
join ldb.dh_user_resolver_group_level1_c a150 
on (a117.lev_1_key = a150.row_key) 
union
select 'ldb.dh_user_group_level2 a151 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) join ldb.dh_user_group_hierarchy a17 
on (a16.row_dn_key = a17.lev_0_key) 
join ldb.dh_user_group_level2 a151 
on (a17.lev_2_key = a151.row_key) 
union
select 'ldb.d_calendar_month a152 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
join ldb.d_calendar_month a152 
on (a110.month_start_date_key = a152.row_key) 
union
select 'ldb.dh_user_resolver_group_level2_c a153 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_resolver_group_c a116 
on (a11.resolver_group_c_key = a116.row_key) join ldb.dh_resolver_group_hierarchy_c a117 
on (a116.row_dn_key = a117.lev_0_key) 
join ldb.dh_user_resolver_group_level2_c a153 
on (a117.lev_2_key = a153.row_key) 
union
select 'ldb.dh_user_group_level3 a154 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) join ldb.dh_user_group_hierarchy a17 
on (a16.row_dn_key = a17.lev_0_key) 
join ldb.dh_user_group_level3 a154 
on (a17.lev_3_key = a154.row_key) 
union
select 'ldb.dh_user_resolver_group_level3_c a155 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_resolver_group_c a116 
on (a11.resolver_group_c_key = a116.row_key) join ldb.dh_resolver_group_hierarchy_c a117 
on (a116.row_dn_key = a117.lev_0_key) 
join ldb.dh_user_resolver_group_level3_c a155 
on (a117.lev_3_key = a155.row_key) 
union
select 'ldb.dh_user_group_level4 a156 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) join ldb.dh_user_group_hierarchy a17 
on (a16.row_dn_key = a17.lev_0_key) 
join ldb.dh_user_group_level4 a156 
on (a17.lev_4_key = a156.row_key) 
union
select 'ldb.dh_user_resolver_group_level4_c a157 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_resolver_group_c a116 
on (a11.resolver_group_c_key = a116.row_key) join ldb.dh_resolver_group_hierarchy_c a117 
on (a116.row_dn_key = a117.lev_0_key) 
join ldb.dh_user_resolver_group_level4_c a157 
on (a117.lev_4_key = a157.row_key) 
union
select 'ldb.dh_user_group_level5 a158 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) join ldb.dh_user_group_hierarchy a17 
on (a16.row_dn_key = a17.lev_0_key) 
join ldb.dh_user_group_level5 a158 
on (a17.lev_5_key = a158.row_key) 
union
select 'ldb.dh_user_resolver_group_level5_c a159 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_resolver_group_c a116 
on (a11.resolver_group_c_key = a116.row_key) join ldb.dh_resolver_group_hierarchy_c a117 
on (a116.row_dn_key = a117.lev_0_key) 
join ldb.dh_user_resolver_group_level5_c a159 
on (a117.lev_5_key = a159.row_key)
union
select 'ldb.d_task_ra_c a160 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_ra_c a160
on (a11.parent_task_c_key = a160.row_key)
union
select 'ldb.d_task_ra_c a161 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_ra_c a160
on (a11.parent_task_c_key = a160.row_key)
join ldb.d_task_parent_c a161
on (a160.parent_task_key = a161.row_key)