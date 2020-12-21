select 'ldb.f_problem_task_credit_score_detail a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_credit_score_detail a11
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_credit_score_detail a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_credit_score_detail a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_credit_score_detail a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key)
union
select 'ldb.d_assignment_group_manager a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_credit_score_detail a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key)
join ldb.d_assignment_group_manager a15
on (a14.assignment_group_manager_key = a15.row_key)
union
select 'ldb.d_h_ag_manager a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_credit_score_detail a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key) join ldb.d_assignment_group_manager a15
on (a14.assignment_group_manager_key = a15.row_key)
join ldb.d_h_ag_manager a16
on (a15.assignment_group_manager_hierarchy_key = a16.row_key)
union
select 'ldb.d_configuration_item_mdm a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_credit_score_detail a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_configuration_item_mdm a17
on (a13.mdm_key = a17.row_key)
union
select 'ldb.d_problem_task a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_credit_score_detail a11
join ldb.d_problem_task a18
on (a11.problem_task_key = a18.row_key)
union
select 'ldb.d_application_mdm a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_credit_score_detail a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_mdm a19
on (a12.mdm_key = a19.row_key)
union
select 'ldb.d_internal_contact_assigned_to a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_credit_score_detail a11
join ldb.d_internal_contact_assigned_to a110
on (a11.assigned_to_key = a110.row_key)
union
select 'ldb.d_business_service a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_credit_score_detail a11
join ldb.d_business_service a111
on (a11.business_service_key = a111.row_key)
union
select 'ldb.d_internal_organization_department a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_credit_score_detail a11
join ldb.d_internal_organization_department a112
on (a11.department_key = a112.row_key)
union
select 'ldb.d_ag_manager_level_1 a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_credit_score_detail a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key) join ldb.d_assignment_group_manager a15
on (a14.assignment_group_manager_key = a15.row_key) join ldb.d_h_ag_manager a16
on (a15.assignment_group_manager_hierarchy_key = a16.row_key)
join ldb.d_ag_manager_level_1 a113
on (a16.assignment_group_manager_level_1_key = a113.row_key)
union
select 'ldb.d_ag_manager_level_2 a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_credit_score_detail a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key) join ldb.d_assignment_group_manager a15
on (a14.assignment_group_manager_key = a15.row_key) join ldb.d_h_ag_manager a16
on (a15.assignment_group_manager_hierarchy_key = a16.row_key)
join ldb.d_ag_manager_level_2 a114
on (a16.assignment_group_manager_level_2_key = a114.row_key)
union
select 'ldb.d_ag_manager_level_3 a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_credit_score_detail a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key) join ldb.d_assignment_group_manager a15
on (a14.assignment_group_manager_key = a15.row_key) join ldb.d_h_ag_manager a16
on (a15.assignment_group_manager_hierarchy_key = a16.row_key)
join ldb.d_ag_manager_level_3 a115
on (a16.assignment_group_manager_level_3_key = a115.row_key)
union
select 'ldb.d_ag_manager_level_4 a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_credit_score_detail a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key) join ldb.d_assignment_group_manager a15
on (a14.assignment_group_manager_key = a15.row_key) join ldb.d_h_ag_manager a16
on (a15.assignment_group_manager_hierarchy_key = a16.row_key)
join ldb.d_ag_manager_level_4 a116
on (a16.assignment_group_manager_level_4_key = a116.row_key)
union
select 'ldb.d_ag_manager_level_5 a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task_credit_score_detail a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key) join ldb.d_assignment_group_manager a15
on (a14.assignment_group_manager_key = a15.row_key) join ldb.d_h_ag_manager a16
on (a15.assignment_group_manager_hierarchy_key = a16.row_key)
join ldb.d_ag_manager_level_5 a117
on (a16.assignment_group_manager_level_5_key = a117.row_key)