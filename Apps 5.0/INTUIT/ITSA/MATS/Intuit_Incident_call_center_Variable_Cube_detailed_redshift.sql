select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_application a12 
on (a11.application_key = a12.row_key) 
union
select 'ldb.d_incident a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a13 
on (a11.incident_key = a13.row_key) 
union
select 'ldb.d_internal_contact a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a14 
on (a11.opened_by_key = a14.row_key) 
union
select 'ldb.d_calendar_time a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a15 
on (a11.opened_time_key = a15.row_key) 
union
select 'ldb.d_configuration_item a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a16 
on (a11.configuration_item_key = a16.row_key) 
union
select 'ldb.d_incident_variable_agent_down_check_box_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_agent_down_check_box_c a17 
on (a11.incident_key = a17.row_key) 
union
select 'ldb.d_incident_variable_what_are_you_attempting_to_do_that_you_cannot_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_what_are_you_attempting_to_do_that_you_cannot_c a18 
on (a11.incident_key = a18.row_key) 
union
select 'ldb.d_incident_variable_has_this_functionality_ever_worked_successfully_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_has_this_functionality_ever_worked_successfully_c a19 
on (a11.incident_key = a19.row_key) 
union
select 'ldb.d_incident_variable_impacted_agent_information_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_impacted_agent_information_c a110 
on (a11.incident_key = a110.row_key) 
union
select 'ldb.d_incident_variable_how_many_agents_are_impacted_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_how_many_agents_are_impacted_c a111 
on (a11.incident_key = a111.row_key) 
union
select 'ldb.d_incident_variable_other_info_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_other_info_c a112 
on (a11.incident_key = a112.row_key) 
union
select 'ldb.d_incident_variable_what_have_you_already_tried_to_resolve_this_issue_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_what_have_you_already_tried_to_resolve_this_issue_c a113 
on (a11.incident_key = a113.row_key) 
union
select 'ldb.d_calendar_date a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a114 
on (a11.opened_on_key = a114.row_key) 
union
select 'ldb.d_incident_variable_inin_credentials_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_inin_credentials_c a115 
on (a11.incident_key = a115.row_key) 
union
select 'ldb.d_incident_variable_inin_functionality_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_inin_functionality_c a116 
on (a11.incident_key = a116.row_key) 
union
select 'ldb.d_incident_variable_inin_location_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_inin_location_c a117 
on (a11.incident_key = a117.row_key) 
union
select 'ldb.d_incident_variable_inin_steps_reproduce_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_inin_steps_reproduce_c a118 
on (a11.incident_key = a118.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a119 
on (a11.assigned_to_key = a119.row_key) 
union
select 'ldb.d_internal_organization_group a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a120 
on (a11.assignment_group_key = a120.row_key) 
union
select 'ldb.d_configuration_item a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a121 
on (a11.business_service_c_key = a121.row_key) 
union
select 'ldb.d_variable_lov_c_environment_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_variable_lov_c_environment_c a122 
on (a11.environment_select_box = a122.row_key) 
union
select 'ldb.d_variable_lov_c_request_type_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_variable_lov_c_request_type_c a123 
on (a11.request_type = a123.row_key) 
union
select 'ldb.d_variable_lov_c_site_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_variable_lov_c_site_c a124 
on (a11.site = a124.row_key) 
union
select 'ldb.d_variable_lov_c_tool_name_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_variable_lov_c_tool_name_c a125 
on (a11.tool_name = a125.row_key) 
union
select 'ldb.d_internal_organization_legalentity a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_legalentity a126 
on (a11.company_key = a126.row_key) 
union
select 'ldb.d_internal_organization_department a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a14 
on (a11.opened_by_key = a14.row_key) 
join ldb.d_internal_organization_department a127 
on (a14.department_key = a127.row_key) 
union
select 'ldb.d_internal_contact_mdm a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a14 
on (a11.opened_by_key = a14.row_key) 
join ldb.d_internal_contact_mdm a128 
on (a14.row_current_key = a128.row_current_key) 
union
select 'ldb.d_calendar_time_hour a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a15 
on (a11.opened_time_key = a15.row_key) 
join ldb.d_calendar_time_hour a129 
on (a15.hour_24_format_num = a129.hour_24_format_num) 
union
select 'ldb.d_incident_contacttype a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_contacttype a130 
on (a11.reported_type_src_key = a130.row_key) 
union
select 'ldb.d_incident_impact a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_impact a131 
on (a11.impact_src_key = a131.row_key) 
union
select 'ldb.d_incident_urgency a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_urgency a132 
on (a11.urgency_src_key = a132.row_key) 
union
select 'ldb.d_lov_incident_infrastructure_category_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_incident_infrastructure_category_c a133 
on (a11.infrastructure_category_src_c_key = a133.row_key) 
union
select 'ldb.d_variable_lov_c_inin_error_occur_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_variable_lov_c_inin_error_occur_c a134 
on (a11.is_the_error_continuing_to_occur = a134.row_key) 
union
select 'ldb.d_variable_lov_c_inin_tool_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_variable_lov_c_inin_tool_c a135 
on (a11.which_inin_tool_is_having_an_issue = a135.row_key) 
union
select 'ldb.d_problem a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_problem a136 
on (a11.problem_key = a136.row_key) 
union
select 'ldb.d_incident_sub_type_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_sub_type_c a137 
on (a11.sub_type_c_key = a137.row_key) 
union
select 'ldb.d_lov_incident_symptom_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_incident_symptom_c a138 
on (a11.symptom_src_c_key = a138.row_key) 
union
select 'ldb.d_location a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location a139 
on (a11.location_key = a139.row_key) 
union
select 'ldb.d_calendar_month a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a114 
on (a11.opened_on_key = a114.row_key) 
join ldb.d_calendar_month a140 
on (a114.month_start_date_key = a140.row_key) 
union
select 'ldb.d_calendar_week a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a114 
on (a11.opened_on_key = a114.row_key) 
join ldb.d_calendar_week a141 
on (a114.week_start_date_key = a141.row_key) 
union
select 'ldb.d_incident_category a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a13 
on (a11.incident_key = a13.row_key) 
join ldb.d_incident_category a142 
on (a13.category_src_key = a142.row_key) 
union
select 'ldb.d_incident_close_code a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a13 
on (a11.incident_key = a13.row_key) 
join ldb.d_incident_close_code a143 
on (a13.close_code_src_key = a143.row_key) 
union
select 'ldb.d_incident_priority a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a13 
on (a11.incident_key = a13.row_key) 
join ldb.d_incident_priority a144 
on (a13.priority_src_key = a144.row_key) 
union
select 'ldb.d_incident_severity a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a13 
on (a11.incident_key = a13.row_key) 
join ldb.d_incident_severity a145 
on (a13.severity_src_key = a145.row_key) 
union
select 'ldb.d_incident_state a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a13 
on (a11.incident_key = a13.row_key) 
join ldb.d_incident_state a146 
on (a13.state_src_key = a146.row_key) 
union
select 'ldb.d_calendar_quarter a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a114 
on (a11.opened_on_key = a114.row_key) 
join ldb.d_calendar_quarter a147 
on (a114.quarter_start_date_key = a147.row_key) 
union
select 'ldb.d_calendar_year a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a114 
on (a11.opened_on_key = a114.row_key) 
join ldb.d_calendar_year a148 
on (a114.year_start_date_key = a148.row_key) 