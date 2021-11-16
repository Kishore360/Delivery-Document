/* Tables Accessed:
N_CHANGE_CREDIT_SCORE_MONTHLY
d_ag_manager_level_0_scd2
d_ag_manager_level_1_scd2
d_ag_manager_level_2_scd2
d_ag_manager_level_3_scd2
d_ag_manager_level_4_scd2
d_ag_manager_level_5_scd2
d_calendar_month
d_h_ag_manager_scd2
d_internal_organization_group */

select 'dw."N_CHANGE_CREDIT_SCORE_MONTHLY" "a11" ' as Table_name, count(a11.row_key) Row_Count
from dw."N_CHANGE_CREDIT_SCORE_MONTHLY" "a11" 
union
select 'dw."d_h_ag_manager_scd2" "a12" ' as Table_name, count(a11.row_key) Row_Count
from dw."N_CHANGE_CREDIT_SCORE_MONTHLY" "a11" 
join "dw"."d_h_ag_manager_scd2" "a12" on ("a11"."AG_MANAGER_HIERARCHY_SCD2_KEY" = "a12"."ROW_KEY")  
union
select 'dw."d_internal_organization_group" "a13" ' as Table_name, count(a11.row_key) Row_Count
from dw."N_CHANGE_CREDIT_SCORE_MONTHLY" "a11" 
join "dw"."d_internal_organization_group" "a13" on ("a11"."ASSIGNMENT_GROUP_KEY" = "a13"."ROW_KEY")  
union
select 'dw."d_ag_manager_level_0_scd2" "a14" ' as Table_name, count(a11.row_key) Row_Count
from dw."N_CHANGE_CREDIT_SCORE_MONTHLY" "a11" 
join "dw"."d_h_ag_manager_scd2" "a12" on ("a11"."AG_MANAGER_HIERARCHY_SCD2_KEY" = "a12"."ROW_KEY") 
join "dw"."d_ag_manager_level_0_scd2" "a14" on ("a12"."employee_level_0_key" = "a14"."ROW_KEY")  
union
select 'dw."d_ag_manager_level_1_scd2" "a15" ' as Table_name, count(a11.row_key) Row_Count
from dw."N_CHANGE_CREDIT_SCORE_MONTHLY" "a11" 
join "dw"."d_h_ag_manager_scd2" "a12" on ("a11"."AG_MANAGER_HIERARCHY_SCD2_KEY" = "a12"."ROW_KEY") 
join "dw"."d_ag_manager_level_1_scd2" "a15" on ("a12"."employee_level_1_key" = "a15"."ROW_KEY")  
union
select 'dw."d_ag_manager_level_2_scd2" "a16" ' as Table_name, count(a11.row_key) Row_Count
from dw."N_CHANGE_CREDIT_SCORE_MONTHLY" "a11" 
join "dw"."d_h_ag_manager_scd2" "a12" on ("a11"."AG_MANAGER_HIERARCHY_SCD2_KEY" = "a12"."ROW_KEY") 
join "dw"."d_ag_manager_level_2_scd2" "a16" on ("a12"."employee_level_2_key" = "a16"."ROW_KEY")  
union
select 'dw."d_ag_manager_level_3_scd2" "a17" ' as Table_name, count(a11.row_key) Row_Count
from dw."N_CHANGE_CREDIT_SCORE_MONTHLY" "a11" 
join "dw"."d_h_ag_manager_scd2" "a12" on ("a11"."AG_MANAGER_HIERARCHY_SCD2_KEY" = "a12"."ROW_KEY") 
join "dw"."d_ag_manager_level_3_scd2" "a17" on ("a12"."employee_level_3_key" = "a17"."ROW_KEY")  
union
select 'dw."d_ag_manager_level_4_scd2" "a18" ' as Table_name, count(a11.row_key) Row_Count
from dw."N_CHANGE_CREDIT_SCORE_MONTHLY" "a11" 
join "dw"."d_h_ag_manager_scd2" "a12" on ("a11"."AG_MANAGER_HIERARCHY_SCD2_KEY" = "a12"."ROW_KEY") 
join "dw"."d_ag_manager_level_4_scd2" "a18" on ("a12"."employee_level_4_key" = "a18"."ROW_KEY")  
union
select 'dw."d_ag_manager_level_5_scd2" "a19" ' as Table_name, count(a11.row_key) Row_Count
from dw."N_CHANGE_CREDIT_SCORE_MONTHLY" "a11" 
join "dw"."d_h_ag_manager_scd2" "a12" on ("a11"."AG_MANAGER_HIERARCHY_SCD2_KEY" = "a12"."ROW_KEY") 
join "dw"."d_ag_manager_level_5_scd2" "a19" on ("a12"."employee_level_5_key" = "a19"."ROW_KEY")  
union
select 'dw."d_calendar_month" "a110" ' as Table_name, count(a11.row_key) Row_Count
from dw."N_CHANGE_CREDIT_SCORE_MONTHLY" "a11" 
join "dw"."d_calendar_month" "a110" on ("a11"."AGGR_MONTH_KEY" = "a110"."ROW_KEY") 

