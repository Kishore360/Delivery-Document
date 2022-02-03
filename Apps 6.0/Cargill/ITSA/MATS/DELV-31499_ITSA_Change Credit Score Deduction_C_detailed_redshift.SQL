/* Tables Accessed:
d_ag_manager_level_1
d_ag_manager_level_2
d_ag_manager_level_3
d_ag_manager_level_4
d_ag_manager_level_5
d_assignment_group_manager
d_change_request
d_change_request_state
d_h_ag_manager
d_internal_contact_assigned_to
d_internal_organization_group
f_change_credit_score_detail
 */
 
 
select 'dw."f_change_credit_score_detail" "a11" ' as Table_name, count(1) Row_Count
from dw."f_change_credit_score_detail" "a11" 
 union
select 'dw."d_internal_organization_group" "a12" ' as Table_name, count(1) Row_Count
from dw."f_change_credit_score_detail" "a11" 
join "dw"."d_internal_organization_group" "a12" on ("a11"."assignment_group_key" = "a12"."row_key")  
 union
select 'dw."d_assignment_group_manager" "a13" ' as Table_name, count(1) Row_Count
from dw."f_change_credit_score_detail" "a11" 
join "dw"."d_internal_organization_group" "a12" on ("a11"."assignment_group_key" = "a12"."row_key") 
join "dw"."d_assignment_group_manager" "a13" on ("a12"."assignment_group_manager_key" = "a13"."row_key")  
 union
select 'dw."d_h_ag_manager" "a14" ' as Table_name, count(1) Row_Count
from dw."f_change_credit_score_detail" "a11" 
join "dw"."d_internal_organization_group" "a12" on ("a11"."assignment_group_key" = "a12"."row_key") 
join "dw"."d_assignment_group_manager" "a13" on ("a12"."assignment_group_manager_key" = "a13"."row_key")
join "dw"."d_h_ag_manager" "a14" on ("a13"."assignment_group_manager_hierarchy_key" = "a14"."row_key")  
union
select 'dw."d_change_request" "a15" ' as Table_name, count(1) Row_Count
from dw."f_change_credit_score_detail" "a11" 
join "dw"."d_change_request" "a15" on ("a11"."change_request_key" = "a15"."row_key")  
 union
select 'dw."d_internal_contact_assigned_to" "a16" ' as Table_name, count(1) Row_Count
from dw."f_change_credit_score_detail" "a11" 
join "dw"."d_internal_contact_assigned_to" "a16" on ("a11"."assigned_to_key" = "a16"."row_key")  
 union
select 'dw."d_change_request_state" "a17" ' as Table_name, count(1) Row_Count
from dw."f_change_credit_score_detail" "a11" 
join "dw"."d_change_request_state" "a17" on ("a11"."state_src_key" = "a17"."row_key")  
 union
select 'dw."d_ag_manager_level_1" "a18" ' as Table_name, count(1) Row_Count
from dw."f_change_credit_score_detail" "a11" 
join "dw"."d_internal_organization_group" "a12" on ("a11"."assignment_group_key" = "a12"."row_key") 
join "dw"."d_assignment_group_manager" "a13" on ("a12"."assignment_group_manager_key" = "a13"."row_key")
join "dw"."d_h_ag_manager" "a14" on ("a13"."assignment_group_manager_hierarchy_key" = "a14"."row_key")
join "dw"."d_ag_manager_level_1" "a18" on ("a14"."assignment_group_manager_level_1_key" = "a18"."row_key")  
 union
select 'dw."d_ag_manager_level_2" "a19" ' as Table_name, count(1) Row_Count
from dw."f_change_credit_score_detail" "a11" 
join "dw"."d_internal_organization_group" "a12" on ("a11"."assignment_group_key" = "a12"."row_key") 
join "dw"."d_assignment_group_manager" "a13" on ("a12"."assignment_group_manager_key" = "a13"."row_key")
join "dw"."d_h_ag_manager" "a14" on ("a13"."assignment_group_manager_hierarchy_key" = "a14"."row_key")
join "dw"."d_ag_manager_level_2" "a19" on ("a14"."assignment_group_manager_level_2_key" = "a19"."row_key")  
 union
select 'dw."d_ag_manager_level_3" "a110" ' as Table_name, count(1) Row_Count
from dw."f_change_credit_score_detail" "a11" 
join "dw"."d_internal_organization_group" "a12" on ("a11"."assignment_group_key" = "a12"."row_key") 
join "dw"."d_assignment_group_manager" "a13" on ("a12"."assignment_group_manager_key" = "a13"."row_key")
join "dw"."d_h_ag_manager" "a14" on ("a13"."assignment_group_manager_hierarchy_key" = "a14"."row_key")
join "dw"."d_ag_manager_level_3" "a110" on ("a14"."assignment_group_manager_level_3_key" = "a110"."row_key")  
 union
select 'dw."d_ag_manager_level_4" "a111" ' as Table_name, count(1) Row_Count
from dw."f_change_credit_score_detail" "a11" 
join "dw"."d_internal_organization_group" "a12" on ("a11"."assignment_group_key" = "a12"."row_key") 
join "dw"."d_assignment_group_manager" "a13" on ("a12"."assignment_group_manager_key" = "a13"."row_key")
join "dw"."d_h_ag_manager" "a14" on ("a13"."assignment_group_manager_hierarchy_key" = "a14"."row_key")
join "dw"."d_ag_manager_level_4" "a111" on ("a14"."assignment_group_manager_level_4_key" = "a111"."row_key")  
 union
select 'dw."d_ag_manager_level_5" "a112" ' as Table_name, count(1) Row_Count
from dw."f_change_credit_score_detail" "a11" 
join "dw"."d_internal_organization_group" "a12" on ("a11"."assignment_group_key" = "a12"."row_key") 
join "dw"."d_assignment_group_manager" "a13" on ("a12"."assignment_group_manager_key" = "a13"."row_key")
join "dw"."d_h_ag_manager" "a14" on ("a13"."assignment_group_manager_hierarchy_key" = "a14"."row_key")
join "dw"."d_ag_manager_level_5" "a112" on ("a14"."assignment_group_manager_level_5_key" = "a112"."row_key") 

