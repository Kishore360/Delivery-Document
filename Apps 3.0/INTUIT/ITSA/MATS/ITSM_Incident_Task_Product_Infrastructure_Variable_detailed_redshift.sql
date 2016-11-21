
select 'ldb.f_incident_task_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
union
select 'ldb.d_internal_organization_legalentity_incident_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_organization_legalentity_incident_c a12 
on (a11.incident_company_key = a12.row_key) 
union
select 'ldb.d_internal_organization_department_incident_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_organization_department_incident_c a13 
on (a11.incident_opened_by_department_key = a13.row_key) 
union
select 'ldb.d_internal_contact a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_contact a14 
on (a11.opened_by_key = a14.row_key) 
union
select 'ldb.d_internal_contact_incident_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_contact_incident_c a15 
on (a11.incident_opened_by_key = a15.row_key) 
union
select 'ldb.d_incident_variable_asset_tag a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_variable_asset_tag a16 
on (a11.incident_key = a16.row_key) 
union
select 'ldb.dh_user_group_classification_hierarchy a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.dh_user_group_classification_hierarchy a17 
on (a11.assignment_group_key = a17.user_group_key) 
union
select 'ldb.dh_user_group_classification_hierarchy_level1 a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.dh_user_group_classification_hierarchy a17 
on (a11.assignment_group_key = a17.user_group_key) 
join ldb.dh_user_group_classification_hierarchy_level1 a18 
on (a17.user_group_classification_level1 = a18.user_group_level1_key) 
union
select 'ldb.dh_user_group_classification_hierarchy_incident_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.dh_user_group_classification_hierarchy_incident_c a19 
on (a11.incident_assignment_group_key = a19.user_group_key) 
union
select 'ldb.dh_user_group_classification_hierarchy_level1_incident_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.dh_user_group_classification_hierarchy_incident_c a19 
on (a11.incident_assignment_group_key = a19.user_group_key) 
join ldb.dh_user_group_classification_hierarchy_level1_incident_c a110 
on (a19.user_group_classification_level1 = a110.user_group_level1_key) 
union
select 'ldb.d_configuration_item a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_configuration_item a111 
on (a11.incident_configuration_item_key = a111.row_key) 
union
select 'ldb.d_incident_variable_date_time a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_variable_date_time a112 
on (a11.incident_key = a112.row_key) 
union
select 'ldb.d_calendar_date a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_calendar_date a113 
on (a11.opened_on_key = a113.row_key) 
union
select 'ldb.d_calendar_date_incident_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_calendar_date_incident_c a114 
on (a11.incident_opened_on_key = a114.row_key) 
union
select 'ldb.d_incident a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident a115 
on (a11.incident_key = a115.row_key) 
union
select 'ldb.d_incident_task_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_task_c a116 
on (a11.incident_task_key = a116.row_key) 
union
select 'ldb.d_incident_variable_scope_of_work a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_variable_scope_of_work a117 
on (a11.incident_key = a117.row_key) 
union
select 'ldb.d_incident_variable_work_window a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_variable_work_window a118 
on (a11.incident_key = a118.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_contact_assigned_to a119 
on (a11.assigned_to_key = a119.row_key) 
union
select 'ldb.d_internal_contact_incident_assigned_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_contact_incident_assigned_c a120 
on (a11.incident_assigned_to_key = a120.row_key) 
union
select 'ldb.d_internal_organization_group a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_organization_group a121 
on (a11.assignment_group_key = a121.row_key) 
union
select 'ldb.d_internal_organization_group_incident_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_organization_group_incident_c a122 
on (a11.incident_assignment_group_key = a122.row_key) 
union
select 'ldb.d_configuration_item_incident_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_configuration_item_incident_c a123 
on (a11.incident_business_service_c_key = a123.row_key) 
union
select 'ldb.d_variable_lov_c_data_center a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_variable_lov_c_data_center a124 
on (a11.data_center = a124.row_key) 
union
select 'ldb.d_internal_organization_department a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_organization_department a125 
on (a11.opened_by_department_key = a125.row_key) 
union
select 'ldb.d_internal_contact_mdm a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_contact a14 
on (a11.opened_by_key = a14.row_key) 
join ldb.d_internal_contact_mdm a126 
on (a14.row_current_key = a126.row_current_key) 
union
select 'ldb.d_internal_contact_mdm_incident_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_contact_incident_c a15 
on (a11.incident_opened_by_key = a15.row_key) 
join ldb.d_internal_contact_mdm_incident_c a127 
on (a15.row_current_key = a127.row_current_key) 
union
select 'ldb.d_incident_close_code a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_close_code_incident_task_c a128 
on (a11.close_code_src_key = a128.row_key ) 
union
select 'ldb.d_incident_task_state_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_task_state_c a129 
on (a11.state_src_key = a129.row_key) 
union
select 'ldb.d_party a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_party a130 
on (a11.primary_contact = a130.row_key) 
union
select 'ldb.d_task_priority_incident_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_task_priority_incident_c a131 
on (a11.incident_priority_src_key = a131.row_key) 
union
select 'ldb.d_incident_state a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_state a132 
on (a11.incident_state_src_key = a132.row_key) 
union
select 'ldb.d_incident_sub_type_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_sub_type_c a133 
on (a11.sub_type_c_key = a133.row_key) 
union
select 'ldb.d_incident_symptom_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_symptom_c a134 
on (a11.incident_symptom_src_c_key = a134.row_key) 
union
select 'ldb.d_task_priority a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_task_priority_incident_task_c a135 
on (a11.priority_src_key = a135.row_key)

