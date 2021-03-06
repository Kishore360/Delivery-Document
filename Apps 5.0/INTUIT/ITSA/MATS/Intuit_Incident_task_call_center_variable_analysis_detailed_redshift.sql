select 'ldb.f_incident_task_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
union
select 'ldb.d_internal_organization_legalentity_incident_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_organization_legalentity_incident_c a12 
on (a11.incident_company_key = a12.row_key) 
union
select 'ldb.d_internal_organization_department_incident_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_organization_department_incident_c a13 
on (a11.incident_opened_by_department_key = a13.row_key) 
union
select 'ldb.d_internal_contact a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_contact a14 
on (a11.opened_by_key = a14.row_key) 
union
select 'ldb.d_internal_contact_incident_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_contact_incident_c a15 
on (a11.incident_closed_by_key = a15.row_key) 
union
select 'ldb.dh_user_group_classification_hierarchy a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.dh_user_group_classification_hierarchy a16 
on (a11.assignment_group_key = a16.user_group_key) 
union
select 'ldb.dh_user_group_classification_hierarchy_level1 a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.dh_user_group_classification_hierarchy a16 
on (a11.assignment_group_key = a16.user_group_key) 
join ldb.dh_user_group_classification_hierarchy_level1 a17 
on (a16.user_group_classification_level1 = a17.user_group_level1_key) 
union
select 'ldb.dh_user_group_classification_hierarchy_incident_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.dh_user_group_classification_hierarchy_incident_c a18 
on (a11.incident_assignment_group_key = a18.user_group_key) 
union
select 'ldb.dh_user_group_classification_hierarchy_level1_incident_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.dh_user_group_classification_hierarchy_incident_c a18 
on (a11.incident_assignment_group_key = a18.user_group_key) 
join ldb.dh_user_group_classification_hierarchy_level1_incident_c a19 
on (a18.user_group_classification_level1 = a19.user_group_level1_key) 
union
select 'ldb.d_configuration_item a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_configuration_item a110 
on (a11.incident_configuration_item_key = a110.row_key) 
union
select 'ldb.d_incident_variable_agent_down_check_box_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_variable_agent_down_check_box_c a111 
on (a11.incident_key = a111.row_key) 
union
select 'ldb.d_incident_variable_what_are_you_attempting_to_do_that_you_cannot_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_variable_what_are_you_attempting_to_do_that_you_cannot_c a112 
on (a11.incident_key = a112.row_key) 
union
select 'ldb.d_incident_variable_has_this_functionality_ever_worked_successfully_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_variable_has_this_functionality_ever_worked_successfully_c a113 
on (a11.incident_key = a113.row_key) 
union
select 'ldb.d_incident_variable_impacted_agent_information_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_variable_impacted_agent_information_c a114 
on (a11.incident_key = a114.row_key) 
union
select 'ldb.d_incident_variable_how_many_agents_are_impacted_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_variable_how_many_agents_are_impacted_c a115 
on (a11.incident_key = a115.row_key) 
union
select 'ldb.d_incident_variable_other_info_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_variable_other_info_c a116 
on (a11.incident_key = a116.row_key) 
union
select 'ldb.d_incident_variable_what_have_you_already_tried_to_resolve_this_issue_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_variable_what_have_you_already_tried_to_resolve_this_issue_c a117 
on (a11.incident_key = a117.row_key) 
union
select 'ldb.d_calendar_date a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_calendar_date a118 
on (a11.opened_on_key = a118.row_key) 
union
select 'ldb.d_calendar_date_incident a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_calendar_date_incident a119 
on (a11.incident_opened_on_key = a119.row_key) 
union
select 'ldb.d_incident a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident a120 
on (a11.incident_key = a120.row_key) 
union
select 'ldb.d_incident_task_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_task_c a121 
on (a11.incident_task_key = a121.row_key) 
union
select 'ldb.d_incident_variable_inin_credentials_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_variable_inin_credentials_c a122 
on (a11.incident_key = a122.row_key) 
union
select 'ldb.d_incident_variable_inin_functionality_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_variable_inin_functionality_c a123 
on (a11.incident_key = a123.row_key) 
union
select 'ldb.d_incident_variable_inin_location_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_variable_inin_location_c a124 
on (a11.incident_key = a124.row_key) 
union
select 'ldb.d_incident_variable_inin_steps_reproduce_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_variable_inin_steps_reproduce_c a125 
on (a11.incident_key = a125.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_contact_assigned_to a126 
on (a11.assigned_to_key = a126.row_key) 
union
select 'ldb.d_internal_contact_incident_assigned_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_contact_incident_assigned_c a127 
on (a11.incident_assigned_to_key = a127.row_key) 
union
select 'ldb.d_internal_organization_group a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_organization_group a128 
on (a11.assignment_group_key = a128.row_key) 
union
select 'ldb.d_internal_organization_group_incident_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_organization_group_incident_c a129 
on (a11.incident_assignment_group_key = a129.row_key) 
union
select 'ldb.d_configuration_item_incident_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_configuration_item_incident_c a130 
on (a11.incident_business_service_c_key = a130.row_key) 
union
select 'ldb.d_application a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_application a131 
on (a11.cmdb_ci_reference = a131.row_key) 
union
select 'ldb.d_variable_lov_c_environment_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_variable_lov_c_environment_c a132 
on (a11.environment_select_box = a132.row_key) 
union
select 'ldb.d_variable_lov_c_request_type_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_variable_lov_c_request_type_c a133 
on (a11.request_type = a133.row_key) 
union
select 'ldb.d_variable_lov_c_site_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_variable_lov_c_site_c a134 
on (a11.site = a134.row_key) 
union
select 'ldb.d_variable_lov_c_tool_name_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_variable_lov_c_tool_name_c a135 
on (a11.tool_name = a135.row_key) 
union
select 'ldb.d_internal_organization_department a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_organization_department a136 
on (a11.opened_by_department_key = a136.row_key) 
union
select 'ldb.d_internal_contact_mdm a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_contact a14 
on (a11.opened_by_key = a14.row_key) 
join ldb.d_internal_contact_mdm a137 
on (a14.row_current_key = a137.row_current_key) 
union
select 'ldb.d_internal_contact_mdm_incident_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_contact_incident_c a15 
on (a11.incident_closed_by_key = a15.row_key) 
join ldb.d_internal_contact_mdm_incident_c a138 
on (a15.row_current_key = a138.row_current_key) 
union
select 'ldb.d_lov_incident_task_state_c a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_lov_incident_task_state_c a139 
on (a11.state_src_key = a139.row_key) 
union
select 'ldb.d_variable_lov_c_inin_error_occur_c a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_variable_lov_c_inin_error_occur_c a140 
on (a11.is_the_error_continuing_to_occur = a140.row_key) 
union
select 'ldb.d_variable_lov_c_inin_tool_c a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_variable_lov_c_inin_tool_c a141 
on (a11.which_inin_tool_is_having_an_issue = a141.row_key) 
union
select 'ldb.d_task_priority_incident_c a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_task_priority_incident_c a142 
on (a11.incident_priority_src_key = a142.row_key) 
union
select 'ldb.d_incident_sub_type_c a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_sub_type_c a143 
on (a11.sub_type_c_key = a143.row_key) 
union
select 'ldb.d_lov_incident_symptom_c a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_lov_incident_symptom_c a144 
on (a11.incident_symptom_src_c_key = a144.row_key) 
union
select 'ldb.d_calendar_month a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_calendar_date a118 
on (a11.opened_on_key = a118.row_key) 
join ldb.d_calendar_month a145 
on (a118.month_start_date_key = a145.row_key) 
union
select 'ldb.d_calendar_week a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_calendar_date a118 
on (a11.opened_on_key = a118.row_key) 
join ldb.d_calendar_week a146 
on (a118.week_start_date_key = a146.row_key) 
union
select 'ldb.d_incident_priority a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident a120 
on (a11.incident_key = a120.row_key) 
join ldb.d_incident_priority a147 
on (a120.priority_src_key = a147.row_key) 
union
select 'ldb.d_incident_state a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident a120 
on (a11.incident_key = a120.row_key) 
join ldb.d_incident_state a148 
on (a120.state_src_key = a148.row_key) 
union
select 'ldb.d_incident_task_close_code_c a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_task_close_code_c a149 
on (a11.close_code_src_key = a149.row_key) 
union
select 'ldb.d_calendar_quarter a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_calendar_date a118 
on (a11.opened_on_key = a118.row_key) 
join ldb.d_calendar_quarter a150 
on (a118.quarter_start_date_key = a150.row_key) 
union
select 'ldb.d_calendar_year a151 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_calendar_date a118 
on (a11.opened_on_key = a118.row_key) 
join ldb.d_calendar_year a151 
on (a118.year_start_date_key = a151.row_key) 