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
select 'ldb.d_configuration_item a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a16 
on (a11.configuration_item_key = a16.row_key) 
union
select 'ldb.d_incident_variable_business_impact a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_business_impact a17 
on (a11.incident_key = a17.row_key) 
union
select 'ldb.d_calendar_date a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
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
select 'ldb.d_incident a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
union
select 'ldb.d_incident_variable_short_descrip a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_short_descrip a113 
on (a11.incident_key = a113.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a114 
on (a11.assigned_to_key = a114.row_key) 
union
select 'ldb.d_internal_organization_group a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a115 
on (a11.assignment_group_key = a115.row_key) 
union
select 'ldb.d_configuration_item a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a116 
on (a11.business_service_c_key = a116.row_key) 
union
select 'ldb.d_variable_lov_cmdb_ci a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_variable_lov_cmdb_ci a117 
on (a11.what_application_do_you_have_a_problem_with = a117.row_key) 
union
select 'ldb.d_internal_organization_legalentity a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_legalentity a118 
on (a11.company_key = a118.row_key) 
union
select 'ldb.d_internal_organization_department a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_department a119 
on (a11.opened_by_department_key = a119.row_key) 
union
select 'ldb.d_internal_contact_mdm a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a120 
on (a12.row_current_key = a120.row_current_key) 
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
select 'ldb.d_calendar_time_hour a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a13 
on (a11.opened_time_key = a13.row_key) 
join ldb.d_calendar_time_hour a123 
on (a13.hour_24_format_num = a123.hour_24_format_num) 
union
select 'ldb.d_incident_infrastructure_category_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_infrastructure_category_c a124 
on (a11.infrastructure_category_src_c_key = a124.row_key) 
union
select 'ldb.d_problem a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_problem a125 
on (a11.problem_key = a125.row_key) 
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
union
select 'ldb.d_location a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location a129 
on (a11.location_key = a129.row_key) 
union
select 'ldb.d_task_priority a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_priority a130 
on (a11.priority_src_key = a130.row_key) 
union
select 'ldb.d_task_contacttype a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_contacttype a131 
on (a11.reported_type_src_key = a131.row_key) 
union
select 'ldb.d_task_urgency a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_urgency a132 
on (a11.urgency_src_key = a132.row_key) 
union
select 'ldb.d_incident_category a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
join ldb.d_incident_category a133 
on (a112.category_src_key = a133.row_key) 
union
select 'ldb.d_incident_close_code a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
join ldb.d_incident_close_code a134 
on (a112.close_code_src_key = a134.row_key) 
union
select 'ldb.d_incident_severity a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
join ldb.d_incident_severity a135 
on (a112.severity_src_key = a135.row_key) 
union
select 'ldb.d_incident_state a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
join ldb.d_incident_state a136 
on (a112.state_src_key = a136.row_key) 
union
select 'ldb.d_calendar_month a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_month a137 
on (a18.month_start_date_key = a137.row_key) 
union
select 'ldb.dh_user_group_classification_hierarchy_level2 a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.dh_user_group_classification_hierarchy a14 
on (a11.assignment_group_key = a14.user_group_key) join ldb.dh_user_group_classification_hierarchy_level1 a15 
on (a14.user_group_classification_level1 = a15.user_group_level1_key) 
join ldb.dh_user_group_classification_hierarchy_level2 a138 
on (a15.user_group_level2_key = a138.user_group_level2_key)
