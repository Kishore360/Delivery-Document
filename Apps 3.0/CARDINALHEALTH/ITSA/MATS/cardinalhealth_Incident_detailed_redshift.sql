select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_calendar_time a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a13 
on (a11.opened_time_key = a13.row_key) 
union
select 'ldb.d_incident a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a14 
on (a11.incident_key = a14.row_key) 
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
union
select 'ldb.d_internal_contact_emp_seniors_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
join ldb.d_internal_contact_emp_seniors_c a16 
on (a15.manager_c_key = a16.row_key) 
union
select 'ldb.d_assignment_group_level0_manager_c_relation a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_assignment_group_level0_manager_c_relation a17 
on (a11.assignment_group_key = a17.level0_assigment_group_key) 
union
select 'ldb.d_lov_configuration_item_install_status_c a1118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a18 
on (a11.configuration_item_key = a18.row_key) 
join  ldb.d_lov_configuration_item_install_status_c a1118
on a18.install_status_src_c_key=a1118.row_key
union
select 'ldb.d_configuration_item a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a18 
on (a11.configuration_item_key = a18.row_key)
union
select 'ldb.d_calendar_date a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
union
select 'ldb.d_internal_organization_causal_assignment_group_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_causal_assignment_group_c a110 
on (a11.causal_assignment_group_c_key = a110.row_key) 
union
select 'ldb.d_calendar_greg_fiscal_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_greg_fiscal_c a111 
on (a11.opened_on_key = a111.greogrian_calendar_key) 
union
select 'ldb.d_calendar_date_fiscal a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_greg_fiscal_c a111 
on (a11.opened_on_key = a111.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal a112 
on (a111.fiscal_key = a112.row_key) 
union
select 'ldb.d_calendar_month a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
join ldb.d_calendar_month a113 
on (a19.month_start_date_key = a113.row_key) 
union
select 'ldb.d_internal_contact_mdm a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_mdm a114 
on (a11.opened_by_c_key = a114.row_current_key) 
union
select 'ldb.d_internal_contact a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a115 
on (a11.opened_on_behalf_of_c_key = a115.row_key) 
union
select 'ldb.d_location a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location a116 
on (a11.location_key = a116.row_key) 
union
select 'ldb.d_internal_contact_mdm a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a117 
on (a12.row_current_key = a117.row_current_key) 
union
select 'ldb.d_internal_contact_assigned_to a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a118 
on (a11.assigned_to_key = a118.row_key) 
union
select 'ldb.d_internal_organization_legalentity a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_legalentity a119 
on (a11.company_key = a119.row_key) 
union
select 'ldb.d_incident_component_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_component_c a120 
on (a11.component_type_c_key = a120.row_key) 
union
select 'ldb.d_calendar_time_hour a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a13 
on (a11.opened_time_key = a13.row_key) 
join ldb.d_calendar_time_hour a121 
on (a13.hour_24_format_num = a121.hour_24_format_num) 
union
select 'ldb.d_location_assigned_to a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location_assigned_to a122 
on (a11.incident_location_c_key = a122.row_key) 
union
select 'ldb.d_incident_verb_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_verb_c a123 
on (a11.u_verb_src_c_key = a123.row_key) 
union
select 'ldb.d_location_incident_assigned_to_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location_incident_assigned_to_c a124 
on (a11.location_of_assigned_to_c_key = a124.row_key) 
union
select 'ldb.d_location_incident_opened_by_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location_incident_opened_by_c a125 
on (a11.location_of_opened_by_c_key = a125.row_key) 
union
select 'ldb.d_incident_major_incident_state_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_major_incident_state_c a126 
on (a11.u_major_incident_state_src_c_key = a126.row_key) 
union
select 'ldb.d_problem a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_problem a127 
on (a11.problem_key = a127.row_key) 
union
select 'ldb.d_internal_organization_srt_assignment_group_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_srt_assignment_group_c a128 
on (a11.srt_assignment_group_c_key = a128.row_key) 
union
select 'ldb.d_internal_contact_incident_srt_owner_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_incident_srt_owner_c a129 
on (a11.incident_srt_owner_c_key = a129.row_key) 
union
select 'ldb.d_incident_impact_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_impact_c a130 
on (a11.u_impact_src_c_key = a130.row_key) 
union
select 'ldb.d_configuration_item a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a131 
on (a11.u_system_name_c_key = a131.row_key) 
union
select 'ldb.d_internal_contact_task_closed_by a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_task_closed_by a132 
on (a11.closed_by_key = a132.row_key) 
union
select 'ldb.d_task_impact a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_impact a133 
on (a11.impact_src_key = a133.row_key) 
union
select 'ldb.d_task_priority a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_priority a134 
on (a11.priority_src_key = a134.row_key) 
union
select 'ldb.d_task_contacttype a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_contacttype a135 
on (a11.reported_type_src_key = a135.row_key) 
union
select 'ldb.d_task_urgency a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_urgency a136 
on (a11.urgency_src_key = a136.row_key) 
union
select 'ldb.d_assignment_group_level0_manager_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_assignment_group_level0_manager_c_relation a17 
on (a11.assignment_group_key = a17.level0_assigment_group_key) 
join ldb.d_assignment_group_level0_manager_c a137 
on (a17.level0_manager_c_key = a137.level0_manager_c_key) 
union
select 'ldb.d_config_item_cah_ci_type_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a18 
on (a11.configuration_item_key = a18.row_key) 
join ldb.d_config_item_cah_ci_type_c a138 
on (a18.cah_ci_type_src_code_c_key = a138.row_key) 
union
select 'ldb.d_config_item_cah_bus_criticl_c a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a18 
on (a11.configuration_item_key = a18.row_key) 
join ldb.d_config_item_cah_bus_criticl_c a139 
on (a18.cah_bus_criticl_src_code_c_key = a139.row_key) 
union
select 'ldb.d_config_item_cah_bus_segment_c a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a18 
on (a11.configuration_item_key = a18.row_key) 
join ldb.d_config_item_cah_bus_segment_c a140 
on (a18.cah_bus_segment_src_code_c_key = a140.row_key) 
union
select 'ldb.d_config_item_cah_bus_unit_c a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a18 
on (a11.configuration_item_key = a18.row_key) 
join ldb.d_config_item_cah_bus_unit_c a141 
on (a18.cah_bus_unit_src_code_c_key = a141.row_key) 
union
select 'ldb.d_internal_contact_causal_assignment_group_director_c a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_causal_assignment_group_c a110 
on (a11.causal_assignment_group_c_key = a110.row_key) 
join ldb.d_internal_contact_causal_assignment_group_director_c a142 
on (a110.director_c_key = a142.row_key) 
union
select 'ldb.d_internal_contact_assignment_grp_manager_c a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_causal_assignment_group_c a110 
on (a11.causal_assignment_group_c_key = a110.row_key) 
join ldb.d_internal_contact_assignment_grp_manager_c a143 
on (a110.manager_c_key = a143.row_key) 
union
select 'ldb.d_internal_contact_causal_assignment_group_vp_c a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_causal_assignment_group_c a110 
on (a11.causal_assignment_group_c_key = a110.row_key) 
join ldb.d_internal_contact_causal_assignment_group_vp_c a144 
on (a110.vp_c_key = a144.row_key) 
union
select 'ldb.d_internal_organization_ci_assignment_group_c a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a18 
on (a11.configuration_item_key = a18.row_key) 
join ldb.d_internal_organization_ci_assignment_group_c a145 
on (a18.assignment_group_c_key = a145.row_key) 
union
select 'ldb.d_internal_contact_ci_director_c a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a18 
on (a11.configuration_item_key = a18.row_key) 
join ldb.d_internal_contact_ci_director_c a146 
on (a18.director_c_key = a146.row_key) 
union
select 'ldb.d_internal_contact_ci_manager_c a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a18 
on (a11.configuration_item_key = a18.row_key) 
join ldb.d_internal_contact_ci_manager_c a147 
on (a18.manager_c_key = a147.row_key) 
union
select 'ldb.d_internal_contact_ci_vp_c a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a18 
on (a11.configuration_item_key = a18.row_key) 
join ldb.d_internal_contact_ci_vp_c a148 
on (a18.vp_c_key = a148.row_key) 
union
select 'ldb.d_internal_contact a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a18 
on (a11.configuration_item_key = a18.row_key) 
join ldb.d_internal_contact a149 
on (a18.eit_sup_leader_c_key = a149.row_key) 
union
select 'ldb.d_incident_category a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a14 
on (a11.incident_key = a14.row_key) 
join ldb.d_incident_category a150 
on (a14.category_src_key = a150.row_key) 
union
select 'ldb.d_incident_close_code a151 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a14 
on (a11.incident_key = a14.row_key) 
join ldb.d_incident_close_code a151 
on (a14.close_code_src_key = a151.row_key) 
union
select 'ldb.d_incident_severity a152 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a14 
on (a11.incident_key = a14.row_key) 
join ldb.d_incident_severity a152 
on (a14.severity_src_key = a152.row_key) 
union
select 'ldb.d_incident_state a153 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a14 
on (a11.incident_key = a14.row_key) 
join ldb.d_incident_state a153 
on (a14.state_src_key = a153.row_key) 
union
select 'ldb.d_incident_subcategory a154 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a14 
on (a11.incident_key = a14.row_key) 
join ldb.d_incident_subcategory a154 
on (a14.sub_category_src_key = a154.row_key) 
union
select 'ldb.d_lov_incident_opened_by_language_c a155 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_mdm a114 
on (a11.opened_by_c_key = a114.row_current_key) 
join ldb.d_lov_incident_opened_by_language_c a155 
on (a114.language_c_key = a155.row_key) 
union
select 'ldb.d_lov_incident_opened_on_behalf_of_language_c a156 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a115 
on (a11.opened_on_behalf_of_c_key = a115.row_key) 
join ldb.d_lov_incident_opened_on_behalf_of_language_c a156 
on (a115.language_c_key = a156.row_key) 
union
select 'ldb.d_config_item_cah_support_grp_c a157 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a18 
on (a11.configuration_item_key = a18.row_key) 
join ldb.d_config_item_cah_support_grp_c a157 
on (a18.cah_support_grp_src_code_c_key = a157.row_key) 
union
select 'ldb.d_internal_contact_director a158 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) join ldb.d_internal_contact_mdm a117 
on (a12.row_current_key = a117.row_current_key) 
join ldb.d_internal_contact_director a158 
on (a117.director_c_key = a158.row_key) 
union
select 'ldb.d_internal_contact_manager a159 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) join ldb.d_internal_contact_mdm a117 
on (a12.row_current_key = a117.row_current_key) 
join ldb.d_internal_contact_manager a159 
on (a117.manager_c_key = a159.row_key) 
union
select 'ldb.d_internal_contact_vp a160 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) join ldb.d_internal_contact_mdm a117 
on (a12.row_current_key = a117.row_current_key) 
join ldb.d_internal_contact_vp a160 
on (a117.vp_c_key = a160.row_key) 
union
select 'ldb.d_calendar_fiscal_period a161 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_greg_fiscal_c a111 
on (a11.opened_on_key = a111.greogrian_calendar_key) join ldb.d_calendar_date_fiscal a112 
on (a111.fiscal_key = a112.row_key) 
join ldb.d_calendar_fiscal_period a161 
on (a112.period_start_date_key = a161.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a162 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_greg_fiscal_c a111 
on (a11.opened_on_key = a111.greogrian_calendar_key) join ldb.d_calendar_date_fiscal a112 
on (a111.fiscal_key = a112.row_key) 
join ldb.d_calendar_fiscal_quarter a162 
on (a112.quarter_start_date_key = a162.row_key) 
union
select 'ldb.d_calendar_fiscal_year a163 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_greg_fiscal_c a111 
on (a11.opened_on_key = a111.greogrian_calendar_key) join ldb.d_calendar_date_fiscal a112 
on (a111.fiscal_key = a112.row_key) 
join ldb.d_calendar_fiscal_year a163 
on (a112.year_start_date_key = a163.row_key) 