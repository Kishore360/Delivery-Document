select'f_incident_response' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response a11 
UNION
select'd_internal_contact_assigned_to_incident_task_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response a11 
join	ldb.d_internal_contact_assigned_to_incident_task_c	a117
on (incident_task_assigned_to_key = a117.row_key)
UNION
select'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response a11 
join	ldb.d_internal_contact a15
on (a11.sent_to_key = a15.row_key)
UNION
select'd_internal_contact_caller_incident_task_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response a11
join	ldb.d_internal_contact_caller_incident_task_c a14
on (a11.incident_task_opened_by_key = a14.row_key)
UNION
select'd_internal_contact_manager_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response a11
join	ldb.d_internal_contact a15
on (a11.sent_to_key = a15.row_key)
join	ldb.d_internal_contact_manager_c a124
on (a15.manager_c_key = a124.row_key)
UNION
select'd_internal_contact_caller_incident_task_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response a11
join	ldb.d_internal_contact_caller_incident_task_c	a18
	  on 	( a11.survey_instance_key= a18.row_current_key)
UNION
select'd_internal_contact_mdm_incident_task_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response a11
join	ldb.d_internal_contact_caller_incident_task_c	a18
	  on 	( a11.survey_instance_key= a18.row_current_key)
join	ldb.d_internal_contact_mdm_incident_task_c	a120
	  on 	(a18.row_key = a120.row_key)	
UNION
select'd_internal_contact_mdm_incident_task_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response a11
join	ldb.d_internal_contact_caller_incident_task_c	a188
	  on 	( a11.incident_task_assignment_group_key= a188.row_current_key)
UNION
select'd_internal_organization_group_incident_task_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response a11	  
join	ldb.d_internal_organization_group_incident_task_c	a118
	  on 	(a11.incident_task_assignment_group_key = a118.row_key)
UNION
select'd_internal_organization_department_incident_task_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response a11	
join	ldb.d_internal_organization_department_incident_task_c	a13
	  on 	(a11.incident_task_department_key = a13.row_key)	
UNION
select'd_incident_task_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response a11
	 join	ldb.d_incident_task_c	a116
	  on 	(a11.incident_task_business_service_key = a116.row_key)	 
UNION
select'd_incident_task_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response a11
join	ldb.d_incident_task_c	a117
on 	(a11.incident_task_key = a117.row_key)	  
UNION
select'd_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response a11
left outer join	ldb.d_task_contacttype	a123
	  on 	(a11.reported_type_src_key  = a123.row_key)
	  union
	  select'dh_user_group_classification_hierarchy' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response a11
join	ldb.dh_user_group_classification_hierarchy	a112
on 	(a11.assignment_group_key = a112.user_group_key)
union
	    select'dh_user_group_classification_hierarchy_level1' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response a11
join	ldb.dh_user_group_classification_hierarchy	a112
on 	(a11.assignment_group_key = a112.user_group_key)
	  	left outer join	ldb.dh_user_group_classification_hierarchy_level1	a17
	  on 	(a112.user_group_classification_level1 = a17.user_group_level1_key)
