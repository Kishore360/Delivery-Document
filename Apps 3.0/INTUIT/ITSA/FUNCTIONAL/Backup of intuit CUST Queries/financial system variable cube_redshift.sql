SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (	

select 'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident	   a11 

union

select  'd_internal_organization_legalentity' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_internal_organization_legalentity	a12
	  on 	(a11.company_key = a12.row_key)union
		select  'd_internal_organization_department' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_internal_organization_department	a13
	  on 	(a11.opened_by_department_key = a13.row_key)union
		select  'd_internal_contact' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_internal_contact	a14
	  on 	(a11.opened_by_key = a14.row_key)union
		select  'd_calendar_time' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_calendar_time	a15
	  on 	(a11.opened_time_key = a15.row_key)union
		select  'dh_user_group_classification_hierarchy' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.dh_user_group_classification_hierarchy	a16
	  on 	(a11.assignment_group_key = a16.user_group_key)union
		select  'dh_user_group_classification_hierarchy_level1' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.dh_user_group_classification_hierarchy	a16
	  on 	(a11.assignment_group_key = a16.user_group_key)
join	ldb.dh_user_group_classification_hierarchy_level1	a17
	  on 	(a16.user_group_classification_level1 = a17.user_group_level1_key)union
		select  'd_configuration_item' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_configuration_item	a18
	  on 	(a11.configuration_item_key = a18.row_key)union
		select  'd_incident_variable_business_impact' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_incident_variable_business_impact	a19
	  on 	(a11.incident_key = a19.row_key)union
		select  'd_calendar_date' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_calendar_date	a110
	  on 	(a11.opened_on_key = a110.row_key)union
		select  'd_incident_variable_details' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_incident_variable_details	a111
	  on 	(a11.incident_key = a111.row_key)union
		select  'd_incident_variable_environment_other' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_incident_variable_environment_other	a112
	  on 	(a11.incident_key = a112.row_key)union
		select  'd_incident_variable_global_entity_other' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_incident_variable_global_entity_other	a113
	  on 	(a11.incident_key = a113.row_key)union
		select  'd_incident' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join
	ldb.d_incident	a114
	  on 	(a11.incident_key = a114.row_key)union
		select  'd_incident_variable_short_descrip' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_incident_variable_short_descrip	a115
	  on 	(a11.incident_key = a115.row_key)union
		select  'd_internal_contact' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_internal_contact	a116
	  on 	(a11.assigned_to_key = a116.row_key)union
		select  'd_internal_organization_group' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_internal_organization_group	a117
	  on 	(a11.assignment_group_key = a117.row_key)union
		select  'd_configuration_item' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_configuration_item	a118
	  on 	(a11.business_service_c_key= a118.row_key)union
		select  'd_varaible_lov_cmdb_ci' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	
		ldb.d_variable_lov_cmdb_ci	a119
	  on 	(a11.what_application_do_you_have_a_problem_with = a119.row_key)union
		select  'd_internal_contact_mdm' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_internal_contact	a14
	  on 	(a11.opened_by_key = a14.row_key) join	ldb.d_internal_contact_mdm	a120
	  on 	(a14.row_current_key = a120.row_current_key)union
		select  'd_varaible_lov_environments' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join
		ldb.d_variable_lov_c_environments	a121
	  on 	(a11.which_environment_do_you_have_a_problem_with = a121.row_key)union
		select  'd_varaible_lov_global_entity' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join
		ldb.d_variable_lov_c_global_entity	a122
	  on 	(a11.which_global_entity_are_you_having_a_problem_with = a122.row_key)union
		select  'd_incident_category' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_incident_category	a123
	  on 	(a11.category_src_key = a123.row_key)union
		select  'd_incident_close_code' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_incident_close_code	a124
	  on 	(a11.close_code_src_key = a124.row_key)union
		select  'd_incident_severity' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_incident_severity	a125
	  on 	(a11.severity_src_key = a125.row_key)union
		select  'd_incident_state' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_incident_state	a126
	  on 	(a11.state_src_key = a126.row_key)union
		select  'd_incident_infrastructure_category_c' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_incident_infrastructure_category_c	a127
	  on 	(a11.infrastructure_category_src_c_key = a127.row_key)union
		select  'd_problem' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 
join	ldb.d_problem	a128
	  on 	(a11.problem_key = a128.row_key)union
		select  'd_incident_symptom_c' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_incident_symptom_c	a129
	  on 	(a11.symptom_src_c_key = a129.row_key)union
		select  'd_task_impact' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_task_impact	a130
	  on 	(a11.impact_src_key = a130.row_key)union
		select  'd_location' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join
	ldb.d_location	a131
	  on 	(a11.location_key = a131.row_key)union
		select  'd_task_priority' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_task_priority	a132
	  on 	(a11.priority_src_key = a132.row_key)union
		select  'd_task_contacttype' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_task_contacttype	a133
	  on 	(a11.reported_type_src_key = a133.row_key)union
		select  'd_task_urgency' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_task_urgency	a134
	  on 	(a11.urgency_src_key = a134.row_key)union
		select  'd_calendar_month' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_calendar_date	a110
	  on 	(a11.opened_on_key = a110.row_key) join	ldb.d_calendar_month	a135
	  on 	(a110.month_start_date_key = a135.row_key)union
		select  'd_incident_sub_type_c' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_incident_sub_type_c	a136
	  on 	(a11.sub_type_c_key = a136.row_key)

)a
)b