SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
select max(Row_Count) max_count,Min(Row_Count) min_count from (
select  			'd_internal_organization_legalentity_incident_c' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11 
join		ldb.d_internal_organization_legalentity_incident_c	a12
on 					(a11.incident_company_key = a12.row_key)

union

select  			'd_internal_organization_department_incident_c' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11 
join		ldb.d_internal_organization_department_incident_c	a14
on 					(a11.incident_opened_by_department_key = a14.row_key)
union

select  			'd_internal_contact_incident_c' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11 
join		ldb.d_internal_contact_incident_c	a16
on 					(a11.incident_opened_by_key = a16.row_key)

union

select  			'dh_user_group_classification_hierarchy ' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11 

join          ldb.dh_user_group_classification_hierarchy        a16
on          (a11.assignment_group_key = a16.user_group_key)
union

select  			'dh_user_group_classification_hierarchy_level1 ' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11 

join          ldb.dh_user_group_classification_hierarchy        a16
on          (a11.assignment_group_key = a16.user_group_key)
join          ldb.dh_user_group_classification_hierarchy_level1            a17
on          (a16.user_group_classification_level1 = a17.user_group_level1_key)
union
select  			'dh_user_group_classification_hierarchy_incident_c' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11 

join          ldb.dh_user_group_classification_hierarchy        a16
on          (a11.incident_assignment_group_key = a16.user_group_key)
union
select  			'dh_user_group_classification_hierarchy' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11 

join          ldb.dh_user_group_classification_hierarchy        a16
on          (a11.incident_assignment_group_key = a16.user_group_key)
union

select  			'dh_user_group_classification_hierarchy_incident_c' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11 

join          ldb.dh_user_group_classification_hierarchy        a16
on          (a11.incident_assignment_group_key = a16.user_group_key)
union
select  			'dh_user_group_classification_hierarchy_level1_incident_c' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11 
join          ldb.dh_user_group_classification_hierarchy_incident_c     a18
on          (a11.incident_assignment_group_key  = a18.user_group_key)
join          ldb.dh_user_group_classification_hierarchy_level1_incident_c         a19
on          (a18.user_group_classification_level1 = a19.user_group_level1_key)
union
select  			'd_incident_variable_agent_down_check_box' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11 
join          ldb.d_incident_variable_agent_down_check_box                a111
on          (a11.incident_key = a111.row_key)
union
select  			'd_incident_variable_what_are_you_attempting_to_do_that_you_cannot' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_incident_variable_what_are_you_attempting_to_do_that_you_cannot      a112
on          (a11.incident_key = a112.row_key)
union
select  			'd_incident_variable_has_this_functionality_ever_worked_successfully' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_incident_variable_has_this_functionality_ever_worked_successfully     a113
on          (a11.incident_key = a113.row_key)
union
select  			'd_incident_variable_impacted_agent_information' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_incident_variable_impacted_agent_information         a114
on          (a11.incident_key = a114.row_key)
union
select  			'd_incident_variable_how_many_agents_are_impacted' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_incident_variable_how_many_agents_are_impacted a115
on          (a11.incident_key = a115.row_key)
union
select  			'd_incident_variable_other_info' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_incident_variable_other_info       a116
on          (a11.incident_key = a116.row_key)
union
select  			'd_incident_variable_what_have_you_already_tried_to_resolve_this_issue' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_incident_variable_what_have_you_already_tried_to_resolve_this_issue                a117
on          (a11.incident_key = a117.row_key)
union
select  			'd_calendar_date_incident_c' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_calendar_date_incident_c            a119
on          (a11.incident_opened_on_key = a119.row_key)
union
select  			'd_incident' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_incident         a120
on          (a11.incident_key = a120.row_key)
union
select  			'd_incident_task_c' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_incident_task_c            a121
on          (a11.incident_task_key = a121.row_key)
union
select  			'd_incident_variable_inin_credentials' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_incident_variable_inin_credentials             a122
on          (a11.incident_key = a122.row_key)
union
select  			'd_incident_variable_inin_functionality' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_incident_variable_inin_functionality            a123
on          (a11.incident_key = a123.row_key)
union
select  			'd_incident_variable_inin_location' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_incident_variable_inin_location   a124
on          (a11.incident_key = a124.row_key)				
union
select  			'd_incident_variable_inin_steps_reproduce' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_incident_variable_inin_steps_reproduce    a125
on          (a11.incident_key = a125.row_key)				  
union
select  			'd_internal_contact' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_internal_contact            a126
on          (a11.assigned_to_key = a126.row_key)			
union
select  			'd_internal_contact_incident_assigned_c' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_internal_contact_incident_assigned_c        a127
on          (a11.incident_assigned_to_key = a127.row_key)				  
union
select  			'd_internal_organization_group' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_internal_organization_group        a128
on          (a11.assignment_group_key = a128.row_key)		
union
select  			'd_internal_organization_group_incident_c' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_internal_organization_group_incident_c     a129
on          (a11.incident_assignment_group_key = a129.row_key)				  
union
select  			'd_configuration_item_incident_c' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_configuration_item_incident_c     a130
on          (a11.incident_business_service_c_key = a130.row_key)				  
union
select  			'd_configuration_application_c' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_configuration_application_c         a131
on          (a11.cmdb_ci_reference = a131.row_key)				  
union
select  			'd_variable_lov_c_environment' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_variable_lov_c_environment       a132
on          (a11.environment_select_box = a132.row_key)				  
union
select  			'd_variable_lov_c_request_type' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_variable_lov_c_request_type      a133
on          (a11.request_type = a133.row_key)
union
select  			'd_variable_lov_c_site' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_variable_lov_c_site      a134
on          (a11.site = a134.row_key)			
union
select  			'd_variable_lov_c_tool_name' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_variable_lov_c_tool_name           a135
on          (a11.tool_name = a135.row_key)
union
select  			'd_incident_close_code' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_incident_close_code    a139
on          (a11.close_code_src_key = a139.row_key)
union
select  			'd_incident_task_state_c' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_incident_task_state_c  a140
on          (a11.state_src_key = a140.row_key)
union
select  			'd_variable_lov_c_inin_error_occur' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_variable_lov_c_inin_error_occur a141
on          (a11.is_the_error_continuing_to_occur = a141.row_key)
union
select  			'd_variable_lov_c_inin_tool' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_variable_lov_c_inin_tool              a142
on          (a11.which_inin_tool_is_having_an_issue = a142.row_key)
union
select  			'd_task_priority_incident_c' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_task_priority_incident_c              a143
on          (a11.incident_priority_src_key = a143.row_key)
union
select  			'd_incident_state' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_incident_state               a144
on          (a11.incident_state_src_key = a144.row_key)
union
select  			'd_incident_sub_type_c' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_incident_sub_type_c    a145
on          (a11.sub_type_c_key = a145.row_key)
union
select  			'd_incident_symptom_c' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_incident_symptom_c    a146
on          (a11.incident_symptom_src_c_key = a146.row_key)
union

select  			'd_task_priority' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_task_priority a147
on          (a11.priority_src_key = a147.row_key)				  
union

select  			'd_internal_contact_mdm' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_internal_contact            a14
on          (a11.opened_by_key = a14.row_key)
join          ldb.d_internal_contact_mdm  a137
on          (a14.row_current_key = a137.row_current_key)
union
select  			'd_internal_contact_mdm_incident_c' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_internal_contact_incident_c         a15
on          (a11.incident_opened_by_key = a15.row_key)
join          ldb.d_internal_contact_mdm_incident_c               a138
on          (a15.row_current_key = a138.row_current_key)		
union
select  			'd_calendar_month' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11				
join          ldb.d_calendar_date               a118
on          (a11.opened_on_key = a118.row_key)
join          ldb.d_calendar_month            a148
on          (a118.month_start_date_key = a148.row_key)
union
select  			'd_calendar_week' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11				  
join          ldb.d_calendar_date               a118
on          (a11.opened_on_key = a118.row_key)
join          ldb.d_calendar_week             a149
on          (a118.week_start_date_key = a149.row_key)
union

select  			'dh_user_group_classification_hierarchy_level2' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.dh_user_group_classification_hierarchy        a16
on          (a11.assignment_group_key = a16.user_group_key)
join          ldb.dh_user_group_classification_hierarchy_level1            a17
on          (a16.user_group_classification_level1 = a17.user_group_level1_key)
join          ldb.dh_user_group_classification_hierarchy_level2            a150
on          (a17.user_group_level2_key = a150.user_group_level2_key)
union
select  			'd_calendar_month_incident_c' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_calendar_date_incident_c            a119
on          (a11.incident_opened_on_key = a119.row_key)
join          ldb.d_calendar_month_incident_c         a151
on          (a119.month_start_date_key = a151.row_key)
union
select  			'd_calendar_quarter' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_calendar_date               a118
on          (a11.opened_on_key = a118.row_key)
join          ldb.d_calendar_quarter          a152
on          (a118.quarter_start_date_key = a152.row_key)
union
select  			'd_calendar_quarter_incident_c' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_calendar_date_incident_c            a119
on          (a11.incident_opened_on_key = a119.row_key)
join          ldb.d_calendar_quarter_incident_c       a153
on          (a119.quarter_start_date_key = a153.row_key)
union
select  			'd_calendar_year' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_calendar_date               a118
on          (a11.opened_on_key = a118.row_key)
join          ldb.d_calendar_year              a154
on          (a118.year_start_date_key = a154.row_key)
union
select  			'd_calendar_year_incident_c' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11
join          ldb.d_calendar_date_incident_c            a119
on          (a11.incident_opened_on_key = a119.row_key)
join          ldb.d_calendar_year_incident_c           a155
on          (a119.year_start_date_key = a155.row_key)


)a
)b