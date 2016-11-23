select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
union
select 'ldb.dh_user_group_classification_hierarchy a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.dh_user_group_classification_hierarchy a14 
on (a11.assignment_group_key = a14.user_group_key) 
union
select 'ldb.dh_user_group_classification_hierarchy_level1 a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.dh_user_group_classification_hierarchy a14 
on (a11.assignment_group_key = a14.user_group_key) 
join ldb.dh_user_group_classification_hierarchy_level1 a15 
on (a14.user_group_classification_level1 = a15.user_group_level1_key) 
union
select 'ldb.d_incident_variable_business_impact a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_business_impact a17 
on (a11.incident_key = a17.row_key) 
union
select 'ldb.d_incident_variable_details a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_details a19 
on (a11.incident_key = a19.row_key) 
union
select 'ldb.d_incident_variable_environment_other a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_environment_other a110 
on (a11.incident_key = a110.row_key) 
union
select 'ldb.d_incident_variable_global_entity_other a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_global_entity_other a111 
on (a11.incident_key = a111.row_key) 
union
select 'ldb.d_incident_variable_short_descrip a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_short_descrip a113 
on (a11.incident_key = a113.row_key) 
union
select 'ldb.d_variable_lov_cmdb_ci a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_variable_lov_cmdb_ci a117 
on (a11.what_application_do_you_have_a_problem_with = a117.row_key) 
union
select 'ldb.d_variable_lov_c_environments a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_variable_lov_c_environments a121 
on (a11.which_environment_do_you_have_a_problem_with = a121.row_key) 
union
select 'ldb.d_variable_lov_c_global_entity a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_variable_lov_c_global_entity a122 
on (a11.which_global_entity_are_you_having_a_problem_with = a122.row_key) 
union
select 'ldb.d_incident_infrastructure_category_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_infrastructure_category_c a124 
on (a11.infrastructure_category_src_c_key = a124.row_key) 
union
select 'ldb.d_incident_sub_type_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_sub_type_c a126 
on (a11.sub_type_c_key = a126.row_key) 
union
select 'ldb.d_incident_symptom_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_symptom_c a127 
on (a11.symptom_src_c_key = a127.row_key) 
union
select 'ldb.d_task_impact a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_impact a128 
on (a11.impact_src_key = a128.row_key) 
