	

select 'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident	   a11 

union

		select  'dh_user_group_classification_hierarchy' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.dh_user_group_classification_hierarchy	a16
	  on 	(a11.assignment_group_key = a16.user_group_key)union
		select  'dh_user_group_classification_hierarchy_level1' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.dh_user_group_classification_hierarchy	a16
	  on 	(a11.assignment_group_key = a16.user_group_key)
join	ldb.dh_user_group_classification_hierarchy_level1	a17
	  on 	(a16.user_group_classification_level1 = a17.user_group_level1_key)union
		select  'd_incident_variable_business_impact' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_incident_variable_business_impact	a19
	  on 	(a11.incident_key = a19.row_key)union
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
		select  'd_incident_infrastructure_category_c' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_incident_infrastructure_category_c	a127
	  on 	(a11.infrastructure_category_src_c_key = a127.row_key)union
		select  'd_problem' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 
join	ldb.d_problem	a128
	  on 	(a11.problem_key = a128.row_key)union
		select  'd_incident_symptom_c' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_incident_symptom_c	a129
	  on 	(a11.symptom_src_c_key = a129.row_key)union
		select  'd_incident_sub_type_c' as Table_Name,count(a11.row_key) Row_Count from ldb.f_incident a11 join	ldb.d_incident_sub_type_c	a136
	  on 	(a11.sub_type_c_key = a136.row_key)
