/* Tables Accessed:
d_ag_manager_level_1
d_ag_manager_level_2
d_ag_manager_level_3
d_ag_manager_level_4
d_ag_manager_level_5
d_assignment_group_manager
d_h_ag_manager
d_internal_contact_assigned_to
d_internal_organization_group
d_problem_task
f_problem_task_credit_score_detail */

select 'dw."f_problem_task_credit_score_detail" "a11" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_problem_task_credit_score_detail" "a11" 
union
select 'dw."d_internal_organization_group" "a12" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_problem_task_credit_score_detail" "a11" 
join "dw"."d_internal_organization_group" "a12" on ("a11"."ASSIGNMENT_GROUP_KEY" = "a12"."ROW_KEY")  
union
select 'dw."d_assignment_group_manager" "a13" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_problem_task_credit_score_detail" "a11" 
join "dw"."d_internal_organization_group" "a12" on ("a11"."ASSIGNMENT_GROUP_KEY" = "a12"."ROW_KEY") 
join "dw"."d_assignment_group_manager" "a13" on ("a12"."assignment_group_manager_key" = "a13"."ROW_KEY")  
union
select 'dw."d_h_ag_manager" "a14" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_problem_task_credit_score_detail" "a11" 
join "dw"."d_internal_organization_group" "a12" on ("a11"."ASSIGNMENT_GROUP_KEY" = "a12"."ROW_KEY") 
join "dw"."d_assignment_group_manager" "a13" on ("a12"."assignment_group_manager_key" = "a13"."ROW_KEY") 
join "dw"."d_h_ag_manager" "a14" on ("a13"."assignment_group_manager_hierarchy_key" = "a14"."ROW_KEY")  
union
select 'dw."d_problem_task" "a15" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_problem_task_credit_score_detail" "a11" 
join "dw"."d_problem_task" "a15" on ("a11"."PROBLEM_TASK_KEY" = "a15"."ROW_KEY")  
union
select 'dw."d_internal_contact_assigned_to" "a16" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_problem_task_credit_score_detail" "a11" 
join "dw"."d_internal_contact_assigned_to" "a16" on ("a11"."ASSIGNED_TO_KEY" = "a16"."ROW_KEY")  
union
select 'dw."d_ag_manager_level_1" "a17" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_problem_task_credit_score_detail" "a11" 
join "dw"."d_internal_organization_group" "a12" on ("a11"."ASSIGNMENT_GROUP_KEY" = "a12"."ROW_KEY") 
join "dw"."d_assignment_group_manager" "a13" on ("a12"."assignment_group_manager_key" = "a13"."ROW_KEY") 
join "dw"."d_h_ag_manager" "a14" on ("a13"."assignment_group_manager_hierarchy_key" = "a14"."ROW_KEY") 
join "dw"."d_ag_manager_level_1" "a17" on ("a14"."assignment_group_manager_level_1_key" = "a17"."ROW_KEY")  
union
select 'dw."d_ag_manager_level_2" "a18" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_problem_task_credit_score_detail" "a11" 
join "dw"."d_internal_organization_group" "a12" on ("a11"."ASSIGNMENT_GROUP_KEY" = "a12"."ROW_KEY") 
join "dw"."d_assignment_group_manager" "a13" on ("a12"."assignment_group_manager_key" = "a13"."ROW_KEY") 
join "dw"."d_h_ag_manager" "a14" on ("a13"."assignment_group_manager_hierarchy_key" = "a14"."ROW_KEY") 
join "dw"."d_ag_manager_level_2" "a18" on ("a14"."assignment_group_manager_level_2_key" = "a18"."ROW_KEY")  
union
select 'dw."d_ag_manager_level_3" "a19" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_problem_task_credit_score_detail" "a11" 
join "dw"."d_internal_organization_group" "a12" on ("a11"."ASSIGNMENT_GROUP_KEY" = "a12"."ROW_KEY") 
join "dw"."d_assignment_group_manager" "a13" on ("a12"."assignment_group_manager_key" = "a13"."ROW_KEY") 
join "dw"."d_h_ag_manager" "a14" on ("a13"."assignment_group_manager_hierarchy_key" = "a14"."ROW_KEY") 
join "dw"."d_ag_manager_level_3" "a19" on ("a14"."assignment_group_manager_level_3_key" = "a19"."ROW_KEY")  
union
select 'dw."d_ag_manager_level_4" "a110" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_problem_task_credit_score_detail" "a11" 
join "dw"."d_internal_organization_group" "a12" on ("a11"."ASSIGNMENT_GROUP_KEY" = "a12"."ROW_KEY") 
join "dw"."d_assignment_group_manager" "a13" on ("a12"."assignment_group_manager_key" = "a13"."ROW_KEY") 
join "dw"."d_h_ag_manager" "a14" on ("a13"."assignment_group_manager_hierarchy_key" = "a14"."ROW_KEY") 
join "dw"."d_ag_manager_level_4" "a110" on ("a14"."assignment_group_manager_level_4_key" = "a110"."ROW_KEY")  
union
select 'dw."d_ag_manager_level_5" "a111" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_problem_task_credit_score_detail" "a11" 
join "dw"."d_internal_organization_group" "a12" on ("a11"."ASSIGNMENT_GROUP_KEY" = "a12"."ROW_KEY") 
join "dw"."d_assignment_group_manager" "a13" on ("a12"."assignment_group_manager_key" = "a13"."ROW_KEY") 
join "dw"."d_h_ag_manager" "a14" on ("a13"."assignment_group_manager_hierarchy_key" = "a14"."ROW_KEY") 
join "dw"."d_ag_manager_level_5" "a111" on ("a14"."assignment_group_manager_level_5_key" = "a111"."ROW_KEY") 

