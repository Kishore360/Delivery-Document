/* 
Tables Accessed:
d_ag_manager_level_0_scd2
d_ag_manager_level_1_scd2
d_ag_manager_level_2_scd2
d_ag_manager_level_3_scd2
d_ag_manager_level_4_scd2
d_ag_manager_level_5_scd2
d_calendar_month
d_h_ag_manager_scd2
d_internal_organization_group
n_change_credit_score_monthly */

select 'dw."n_change_credit_score_monthly" "a11" ' as Table_name, count(a11.row_key) Row_Count
 from dw."n_change_credit_score_monthly" "a11" 
 union
select 'dw."d_h_ag_manager_scd2" "a12" ' as Table_name, count(a11.row_key) Row_Count
from dw."n_change_credit_score_monthly" "a11" 
join "dw"."d_h_ag_manager_scd2" "a12" on ("a11"."ag_manager_hierarchy_scd2_key" = "a12"."row_key")  
union
select 'dw."d_internal_organization_group" "a13" ' as Table_name, count(a11.row_key) Row_Count
from dw."n_change_credit_score_monthly" "a11" 
join "dw"."d_internal_organization_group" "a13" on ("a11"."assignment_group_key" = "a13"."row_key")  
union
select 'dw."d_ag_manager_level_0_scd2" "a14" ' as Table_name, count(a11.row_key) Row_Count
from dw."n_change_credit_score_monthly" "a11" 
join "dw"."d_h_ag_manager_scd2" "a12" on ("a11"."ag_manager_hierarchy_scd2_key" = "a12"."row_key") 
join "dw"."d_ag_manager_level_0_scd2" "a14" on ("a12"."employee_level_0_key" = "a14"."row_key")  
 union
select 'dw."d_ag_manager_level_1_scd2" "a15" ' as Table_name, count(a11.row_key) Row_Count
from dw."n_change_credit_score_monthly" "a11" 
join "dw"."d_h_ag_manager_scd2" "a12" on ("a11"."ag_manager_hierarchy_scd2_key" = "a12"."row_key") 
join "dw"."d_ag_manager_level_1_scd2" "a15" on ("a12"."employee_level_1_key" = "a15"."row_key")  
 union
select 'dw."d_ag_manager_level_2_scd2" "a16" ' as Table_name, count(a11.row_key) Row_Count
from dw."n_change_credit_score_monthly" "a11" 
join "dw"."d_h_ag_manager_scd2" "a12" on ("a11"."ag_manager_hierarchy_scd2_key" = "a12"."row_key") 
join "dw"."d_ag_manager_level_2_scd2" "a16" on ("a12"."employee_level_2_key" = "a16"."row_key")  
 union
select 'dw."d_ag_manager_level_3_scd2" "a17" ' as Table_name, count(a11.row_key) Row_Count
from dw."n_change_credit_score_monthly" "a11" 
join "dw"."d_h_ag_manager_scd2" "a12" on ("a11"."ag_manager_hierarchy_scd2_key" = "a12"."row_key") 
join "dw"."d_ag_manager_level_3_scd2" "a17" on ("a12"."employee_level_3_key" = "a17"."row_key")  
union
select 'dw."d_ag_manager_level_4_scd2" "a18" ' as Table_name, count(a11.row_key) Row_Count
from dw."n_change_credit_score_monthly" "a11" 
join "dw"."d_h_ag_manager_scd2" "a12" on ("a11"."ag_manager_hierarchy_scd2_key" = "a12"."row_key") 
join "dw"."d_ag_manager_level_4_scd2" "a18" on ("a12"."employee_level_4_key" = "a18"."row_key")  
 union
select 'dw."d_ag_manager_level_5_scd2" "a19" ' as Table_name, count(a11.row_key) Row_Count
from dw."n_change_credit_score_monthly" "a11" 
join "dw"."d_h_ag_manager_scd2" "a12" on ("a11"."ag_manager_hierarchy_scd2_key" = "a12"."row_key") 
join "dw"."d_ag_manager_level_5_scd2" "a19" on ("a12"."employee_level_5_key" = "a19"."row_key")  
 union
select 'dw."d_calendar_month" "a110" ' as Table_name, count(a11.row_key) Row_Count
from dw."n_change_credit_score_monthly" "a11" 
join "dw"."d_calendar_month" "a110" on ("a11"."aggr_month_key" = "a110"."row_key") 

