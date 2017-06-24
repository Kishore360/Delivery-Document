select 'ldb.f_problem_task' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_problem_task             a11 
union
select 'ldb.d_configuration_item_problem_incident_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_problem_task             a11 
join ldb.d_configuration_item_problem_incident_c         a16
on (a11.incident_configuration_item_key = a16.row_key)
union
select 'ldb.d_incident_infrastructure_category_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_problem_task             a11 
join ldb.d_incident_infrastructure_category_c         a112
on (a11.infrastructure_category_src_c_key = a112.row_key)
union
select 'ldb.d_internal_organization_problem_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_problem_task             a11 
join ldb.d_internal_organization_problem_c         a113
on (a11.problem_assignment_group_key = a113.row_key)
union
select 'ldb.d_configuration_item_problem_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_problem_task             a11 
join ldb.d_configuration_item_problem_c         a114
on (a11.problem_configuration_item_key = a114.row_key)
union
select 'ldb.d_task_priority_problem_incident_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_problem_task             a11 
join ldb.d_task_priority_problem_incident_c         a115
on (a11.incident_priority_src_key = a115.row_key)
union
select 'ldb.d_task_priority_problem_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_problem_task             a11 
join ldb.d_task_priority_problem_c         a116
on (a11.problem_priority_src_key = a116.row_key)
union
select 'ldb.d_task_contacttype_problem_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_problem_task             a11 
join ldb.d_task_contacttype_problem_c         a117
on (a11.problem_reported_type_src_key = a117.row_key)
union
select 'ldb.d_task_urgency_problem_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_problem_task             a11 
join ldb.d_task_urgency_problem_c         a119
on (a11.problem_urgency_src_key = a119.row_key)
