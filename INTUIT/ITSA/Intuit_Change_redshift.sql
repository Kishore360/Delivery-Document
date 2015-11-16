SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
select max(Row_Count) max_count,Min(Row_Count) min_count from (
select 'ldb.f_change_request' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_change_request             a11 
union
select 'ldb.dh_user_group_classification_hierarchy' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_change_request             a11 
join ldb.dh_user_group_classification_hierarchy         a16
on (a11.assignment_group_key = a16.user_group_key)
union
select 'ldb.dh_user_group_classification_hierarchy_level1' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_change_request             a11 
join ldb.dh_user_group_classification_hierarchy         a16
on (a11.assignment_group_key = a16.user_group_key)
join ldb.dh_user_group_classification_hierarchy_level1         a17
on (a16.user_group_classification_level1 = a17.user_group_level1_key)
union
select 'ldb.d_internal_contact_requested_by' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_change_request             a11 
join ldb.d_internal_contact_requested_by         a19
on (a11.requested_by_key = a19.row_key)
union
select 'ldb.d_task_approval' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_change_request             a11 
join ldb.d_task_approval         a111
on (a11.approval_state_src_key = a111.row_key)
union
select 'ldb.d_change_request_u_completion_code_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_change_request             a11 
join ldb.d_change_request_u_completion_code_c         a120
on (a11.completion_src_c_key = a120.row_key)
union
select 'ldb.d_internal_contact_client_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_change_request             a11 
join ldb.d_internal_contact_client_c         a122
on (a11.client_c_key = a122.row_key)
union
select 'ldb.d_internal_contact_qa_approver_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_change_request             a11 
join ldb.d_internal_contact_qa_approver_c         a123
on (a11.qa_approver_c_key = a123.row_key)
union
select 'ldb.d_change_request_u_sub_category_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_change_request             a11 
join ldb.d_change_request_u_sub_category_c         a124
on (a11.sub_category_src_c_key = a124.row_key)
union
select 'ldb.d_internal_organization_group_change_request_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_change_request             a11 
join ldb.d_configuration_item         a14
on (a11.configuration_item_key = a14.row_key)
join ldb.d_internal_organization_group_change_request_c         a130
on (a14.change_control_c_key = a130.row_key)
union
select 'ldb.d_internal_contact_manager_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_change_request             a11 
join ldb.d_internal_contact         a15
on (a11.assigned_to_key = a15.row_key)
join ldb.d_internal_contact_manager_c         a131
on (a15.manager_c_key = a131.row_key)
)a
)b



