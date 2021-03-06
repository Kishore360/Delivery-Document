 SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (

select  'd_internal_organization_department' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11

union

	select  'd_internal_organization_legalentity' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_internal_organization_legalentity	a12
	  on 	(a11.company_key = a12.row_key)union
	select  'd_internal_organization_department' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_internal_organization_department	a13
	  on 	(a11.opened_by_department_key = a13.row_key)union
	select  'd_internal_contact' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_internal_contact	a14
	  on 	(a11.opened_by_key = a14.row_key)union
	select  'd_calendar_time' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_calendar_time	a15
	  on 	(a11.opened_time_key = a15.row_key)union
	select  'dh_user_group_classification_hierarchy' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.dh_user_group_classification_hierarchy	a16
	  on 	(a11.assignment_group_key = a16.user_group_key)union
	select  'dh_user_group_classification_hierarchy_level1' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 

join	

ldb.dh_user_group_classification_hierarchy	a16
	  on 	(a11.assignment_group_key = a16.user_group_key) join
ldb.dh_user_group_classification_hierarchy_level1	a17
	  on 	(a16.user_group_classification_level1 = a17.user_group_level1_key)union
	select  'd_configuration_item' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_configuration_item	a18
	  on 	(a11.configuration_item_key = a18.row_key)union
	select  'd_incident_variable_agent_down_check_box' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_incident_variable_agent_down_check_box	a19
	  on 	(a11.incident_key = a19.row_key)union
	select  'd_incident_variable_what_are_you_attempting_to_do_that_you_cannot' as Table_Name,count(a11.row_key) Row_Count from 

ldb.f_incident a11 join	

ldb.d_incident_variable_what_are_you_attempting_to_do_that_you_cannot	a110
	  on 	(a11.incident_key = a110.row_key)union
	select  'd_incident_variable_has_this_functionality_ever_worked_successfully' as Table_Name,count(a11.row_key) Row_Count from 

ldb.f_incident a11 join	

ldb.d_incident_variable_has_this_functionality_ever_worked_successfully	a111
	  on 	(a11.incident_key = a111.row_key)union
	select  'd_incident_variable_impacted_agent_information' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 

join	

ldb.d_incident_variable_impacted_agent_information	a112
	  on 	(a11.incident_key = a112.row_key)union
	select  'd_incident_variable_how_many_agents_are_impacted' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 

join	

ldb.d_incident_variable_how_many_agents_are_impacted	a113
	  on 	(a11.incident_key = a113.row_key)union
	select  'd_incident_variable_other_info' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_incident_variable_other_info	a114
	  on 	(a11.incident_key = a114.row_key)union
	select  'd_incident_variable_what_have_you_already_tried_to_resolve_this_issue' as Table_Name,count(a11.row_key) Row_Count 

from ldb.f_incident a11 join	

ldb.d_incident_variable_what_have_you_already_tried_to_resolve_this_issue	a115
	  on 	(a11.incident_key = a115.row_key)union
	select  'd_calendar_date' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_calendar_date	a116
	  on 	(a11.opened_on_key = a116.row_key)union
	select  'd_incident' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_incident	a117
	  on 	(a11.incident_key = a117.row_key)union
	select  'd_incident_variable_inin_credentials' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_incident_variable_inin_credentials	a118
	  on 	(a11.incident_key = a118.row_key)union
	select  'd_incident_variable_inin_functionality' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_incident_variable_inin_functionality	a119
	  on 	(a11.incident_key = a119.row_key)union
	select  'd_incident_variable_inin_location' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_incident_variable_inin_location	a120
	  on 	(a11.incident_key = a120.row_key)union
	select  'd_incident_variable_inin_steps_reproduce' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_incident_variable_inin_steps_reproduce	a121
	  on 	(a11.incident_key = a121.row_key)union
	select  'd_internal_contact' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_internal_contact	a122
	  on 	(a11.assigned_to_key = a122.row_key)union
	select  'd_internal_organization_group' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_internal_organization_group	a123
	  on 	(a11.assignment_group_key = a123.row_key)union
	select  'd_configuration_item' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_configuration_item	a124
	  on 	(a11.business_service_c_key = a124.row_key)union
	select  'd_configuration_application_c' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_configuration_application_c	a125
	  on 	(a11.cmdb_ci_reference = a125.row_key)union
	select  'd_variable_lov_environment' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_variable_lov_c_environment	a126
	  on 	(a11.environment_select_box = a126.row_key)union
	select  'd_variable_lov_request_type' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_variable_lov_c_request_type	a127
	  on 	(a11.request_type = a127.row_key)union
	select  'd_variable_lov_site' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_variable_lov_c_site	a128
	  on 	(a11.site = a128.row_key)union
	select  'd_variable_lov_tool_name' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_variable_lov_c_tool_name	a129
	  on 	(a11.tool_name = a129.row_key)union
	select  'd_internal_contact_mdm' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_internal_contact	a14
	  on 	(a11.opened_by_key = a14.row_key) join	

ldb.d_internal_contact_mdm	a130
	  on 	(a14.row_current_key = a130.row_current_key)union
	select  'd_incident_category' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_incident_category	a131
	  on 	(a11.category_src_key = a131.row_key)union
	select  'd_incident_close_code' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_incident_close_code	a132
	  on 	(a11.close_code_src_key = a132.row_key)union
	select  'd_incident_severity' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_incident_severity	a133
	  on 	(a11.severity_src_key = a133.row_key)union
	select  'd_incident_state' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_incident_state	a134
	  on 	(a11.state_src_key = a134.row_key)union
	select  'd_incident_infrastructure_category_c' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_incident_infrastructure_category_c	a135
	  on 	(a11.infrastructure_category_src_c_key = a135.row_key)union
	select  'd_varaible_lov_inin_error_occur' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_variable_lov_c_inin_error_occur	a136
	  on 	(a11.is_the_error_continuing_to_occur = a136.row_key)union
	select  'd_varaible_lov_inin_tool' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_variable_lov_c_inin_tool	a137
	  on 	(a11.which_inin_tool_is_having_an_issue = a137.row_key)union
	select  'd_problem' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_problem	a138
	  on 	(a11.problem_key = a138.row_key)union
	select  'd_incident_symptom_c' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_incident_symptom_c	a139
	  on 	(a11.symptom_src_c_key = a139.row_key)union
	select  'd_task_impact' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_task_impact	a140
	  on 	(a11.impact_src_key = a140.row_key)union
	select  'd_location' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_location	a141
	  on 	(a11.location_key = a141.row_key)union
	select  'd_task_priority' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_task_priority	a142
	  on 	(a11.priority_src_key = a142.row_key)union
	select  'd_task_contacttype' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_task_contacttype	a143
	  on 	(a11.reported_type_src_key = a143.row_key)union
	select  'd_task_urgency' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_task_urgency	a144
	  on 	(a11.urgency_src_key = a144.row_key)union
	select  'd_calendar_month' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_calendar_date	a116
	  on 	(a11.opened_on_key = a116.row_key) join	

ldb.d_calendar_month	a145
	  on 	(a116.month_start_date_key = a145.row_key)union
	select  'd_incident_sub_type_c' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	

ldb.d_incident_sub_type_c	a146
	  on 	(a11.sub_type_c_key = a146.row_key)


)a
)b
