 SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (

select  'ldb.d_internal_organization_legalentity' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_internal_organization_legalentity	a12
on 		(a11.company_key = a12.row_key)
union

select  'ldb.d_internal_organization_department' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_internal_organization_department	a13
on	 	(a11.opened_by_department_key = a13.row_key)
union

select  'ldb.d_internal_contact' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_internal_contact	a14
on	 	(a11.opened_by_key = a14.row_key)
union

select  'ldb.d_calendar_time' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_calendar_time	a15
on 	(a11.opened_time_key = a15.row_key)
union

select  'ldb.d_calendar_time' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_incident_variable_asset_tag	a16
	  on 	(a11.incident_key = a16.row_key)
union

select  'ldb.dh_user_group_classification_hierarchy' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.dh_user_group_classification_hierarchy	a17
	  on 	(a11.assignment_group_key = a17.user_group_key)
union

select  'ldb.dh_user_group_classification_hierarchy_level1' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.dh_user_group_classification_hierarchy	a17
	  on 	(a11.assignment_group_key = a17.user_group_key)
join	ldb.dh_user_group_classification_hierarchy_level1	a18
	  on 	(a17.user_group_classification_level1 = a18.user_group_level1_key)
union

select  'ldb.d_configuration_item' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_configuration_item	a19
	  on 	(a11.configuration_item_key = a19.row_key)
union

select  'ldb.d_incident_variable_date_time' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_incident_variable_date_time	a110
	  on 	(a11.incident_key = a110.row_key)
union

select  'ldb.d_calendar_date' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_calendar_date	a111
	  on 	(a11.opened_on_key = a111.row_key)
union

select  'ldb.d_incident' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_incident	a112
	  on 	(a11.incident_key = a112.row_key)
union

select  'ldb.d_incident_variable_scope_of_work' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_incident_variable_scope_of_work	a113
	  on 	(a11.incident_key = a113.row_key)
union

select  'ldb.d_incident_variable_work_window' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_incident_variable_work_window	a114
	  on 	(a11.incident_key = a114.row_key)
union

select  'ldb.d_internal_contact' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_internal_contact	a115
	  on 	(a11.assigned_to_key = a115.row_key)
union

select  'ldb.d_internal_organization_group' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_internal_organization_group	a116
	  on 	(a11.assignment_group_key = a116.row_key)
union

select  'ldb.d_configuration_item' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_configuration_item	a117
	  on 	(a11.business_service_key_c = a117.row_key)
union

select  'ldb.d_varaible_lov_data_center' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_varaible_lov_data_center	a118
	  on 	(a11.data_center = a118.row_key)
union

select  'ldb.d_internal_contact_mdm' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_internal_contact	a14
on	 	(a11.opened_by_key = a14.row_key)
join	ldb.d_internal_contact_mdm	a119
	  on 	(a14.row_current_key = a119.row_current_key)
union

select  'ldb.d_incident_category' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_incident_category	a120
	  on 	(a11.category_src_key = a120.row_key)
union

select  'ldb.d_incident_close_code' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_incident_close_code	a121
	  on 	(a11.close_code_src_key = a121.row_key)
union

select  'ldb.d_incident_severity' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_incident_severity	a122
	  on 	(a11.severity_src_key = a122.row_key)
union

select  'ldb.d_incident_state' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_incident_state	a123
	  on 	(a11.state_src_key = a123.row_key)
union

select  'ldb.d_incident_infrastructure_category_c' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_incident_infrastructure_category_c	a124
	  on 	(a11.infrastructure_category_src_key_c = a124.row_key)
union

select  'ldb.d_party' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_party	a125
	  on 	(a11.primary_contact = a125.row_key)
union

select  'ldb.d_problem' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_problem	a126
	  on 	(a11.problem_key = a126.row_key)
union

select  'ldb.d_incident_symptom_c' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_incident_symptom_c	a127
	  on 	(a11.symptom_src_key_c = a127.row_key)
union

select  'ldb.d_task_impact' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_task_impact	a128
	  on 	(a11.impact_src_key = a128.row_key)
union

select  'ldb.d_location' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_location	a129
	  on 	(a11.location_key = a129.row_key)
union

select  'ldb.d_task_priority' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_task_priority	a130
	  on 	(a11.priority_src_key = a130.row_key)
union

select  'ldb.d_task_contacttype' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_task_contacttype	a131
	  on 	(a11.reported_type_src_key = a131.row_key)
union

select  'ldb.d_task_urgency' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_task_urgency	a132
	  on 	(a11.urgency_src_key = a132.row_key)
union

select  'ldb.d_calendar_month' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_calendar_month	a133
	  on 	(a111.month_start_date_key = a133.row_key)
union

select  'ldb.d_incident_sub_type_c' as Table_Name,count(a11.row_key) Row_Count 
from	ldb.f_incident	a11
join	ldb.d_incident_sub_type_c	a134
	  on 	(a11.sub_type_key_c = a134.row_key)
)a
)b