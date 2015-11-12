
SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
select max(Row_Count) max_count,Min(Row_Count) min_count from (
select 'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
union

select 'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_calendar_time         a15
on (a11.opened_time_key = a15.row_key)
join    ldb.d_calendar_time_hour    a115
 on     (a15.hour_24_format_num = a115.hour_24_format_num)
union
select 'ldb.dh_user_group_classification_hierarchy' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.dh_user_group_classification_hierarchy         a17
on (a11.assignment_group_key = a17.user_group_key)
union
select 'ldb.dh_user_group_classification_hierarchy_level1' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.dh_user_group_classification_hierarchy         a17
on (a11.assignment_group_key = a17.user_group_key)
join ldb.dh_user_group_classification_hierarchy_level1         a18
on (a17.user_group_classification_level1 = a18.user_group_level1_key)
union

 
select 'ldb.dh_user_group_classification_hierarchy_level2' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.dh_user_group_classification_hierarchy         a16
on (a11.assignment_group_key = a16.user_group_key)
join    ldb.dh_user_group_classification_hierarchy_level1    a17
 on     (a16.user_group_classification_level1 = a17.user_group_level1_key)
join ldb.dh_user_group_classification_hierarchy_level2         a18
on (a17.user_group_level2_key  = a18.user_group_level2_key)

union
select 'ldb.d_incident_infrastructure_category_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_incident_infrastructure_category_c         a119
on (a11.infrastructure_category_src_c_key = a119.row_key)
union
select 'ldb.d_internal_contact_opened_by_key_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_internal_contact_opened_by_key_c         a120
on (a11.opened_by_c_key = a120.row_key)
union
select 'ldb.d_problem' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_problem         a121
on (a11.problem_key = a121.row_key)
union
select 'ldb.d_incident_symptom_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_incident_symptom_c         a122
on (a11.symptom_src_c_key = a122.row_key)
union
select 'ldb.d_internal_contact_manager_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_internal_contact         a16
on (a11.assigned_to_key = a16.row_key)
join ldb.d_internal_contact_manager_c         a128
on (a16.manager_c_key = a128.row_key)
union
select 'ldb.d_incident_sub_type_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_incident_sub_type_c         a130
on (a11.sub_type_c_key = a130.row_key)
)a
)b



