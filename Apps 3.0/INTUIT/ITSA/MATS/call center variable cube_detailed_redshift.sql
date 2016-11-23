select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 

union
select 'ldb.d_incident_variable_agent_down_check_box a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_agent_down_check_box a15 
on (a11.incident_key = a15.row_key) 
union
select 'ldb.d_incident_variable_what_are_you_attempting_to_do_that_you_cannot a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_what_are_you_attempting_to_do_that_you_cannot a16 
on (a11.incident_key = a16.row_key) 
union
select 'ldb.d_incident_variable_has_this_functionality_ever_worked_successfully a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_has_this_functionality_ever_worked_successfully a17 
on (a11.incident_key = a17.row_key) 
union
select 'ldb.d_incident_variable_impacted_agent_information a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_impacted_agent_information a18 
on (a11.incident_key = a18.row_key) 
union
select 'ldb.d_incident_variable_how_many_agents_are_impacted a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_how_many_agents_are_impacted a19 
on (a11.incident_key = a19.row_key) 
union
select 'ldb.d_incident_variable_other_info a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_other_info a110 
on (a11.incident_key = a110.row_key) 
union
select 'ldb.d_incident_variable_what_have_you_already_tried_to_resolve_this_issue a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_what_have_you_already_tried_to_resolve_this_issue a111 
on (a11.incident_key = a111.row_key) 
union
select 'ldb.d_incident_variable_inin_credentials a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_inin_credentials a114 
on (a11.incident_key = a114.row_key) 
union
select 'ldb.d_incident_variable_inin_functionality a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_inin_functionality a115 
on (a11.incident_key = a115.row_key) 
union
select 'ldb.d_incident_variable_inin_location a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_inin_location a116 
on (a11.incident_key = a116.row_key) 
union
select 'ldb.d_incident_variable_inin_steps_reproduce a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_inin_steps_reproduce a117 
on (a11.incident_key = a117.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a118 
on (a11.assigned_to_key = a118.row_key) 
union
select 'ldb.d_configuration_application_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_application_c a121 
on (a11.cmdb_ci_reference = a121.row_key) 
union
select 'ldb.d_variable_lov_c_environment a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_variable_lov_c_environment a122 
on (a11.environment_select_box = a122.row_key) 
union
select 'ldb.d_variable_lov_c_request_type a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_variable_lov_c_request_type a123 
on (a11.request_type = a123.row_key) 
union
select 'ldb.d_variable_lov_c_site a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_variable_lov_c_site a124 
on (a11.site = a124.row_key) 
union
select 'ldb.d_variable_lov_c_tool_name a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_variable_lov_c_tool_name a125 
on (a11.tool_name = a125.row_key) 
union
select 'ldb.d_incident_infrastructure_category_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_infrastructure_category_c a130 
on (a11.infrastructure_category_src_c_key = a130.row_key) 
union
select 'ldb.d_variable_lov_c_inin_error_occur a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_variable_lov_c_inin_error_occur a131 
on (a11.is_the_error_continuing_to_occur = a131.row_key) 
union
select 'ldb.d_variable_lov_c_inin_tool a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_variable_lov_c_inin_tool a132 
on (a11.which_inin_tool_is_having_an_issue = a132.row_key) 
union
select 'ldb.d_incident_sub_type_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_sub_type_c a134 
on (a11.sub_type_c_key = a134.row_key) 
union
select 'ldb.d_incident_symptom_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_symptom_c a135 
on (a11.symptom_src_c_key = a135.row_key) 
union
select 'ldb.d_task_impact a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_impact a136 
on (a11.impact_src_key = a136.row_key) 
