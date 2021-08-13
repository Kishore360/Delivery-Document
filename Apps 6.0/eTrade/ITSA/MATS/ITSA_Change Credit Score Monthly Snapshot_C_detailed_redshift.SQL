select 'ldb."N_CHANGE_CREDIT_SCORE_MONTHLY" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."N_CHANGE_CREDIT_SCORE_MONTHLY" a11 
 union
select 'ldb."d_internal_organization_group" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."N_CHANGE_CREDIT_SCORE_MONTHLY" a11 
 join "ldb"."d_internal_organization_group" a12 
	on (a11.ASSIGNMENT_GROUP_KEY = a12.ROW_KEY)  
 union
select 'ldb."D_CHANGE_CREDIT_SCORE_PROJECT_C" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."N_CHANGE_CREDIT_SCORE_MONTHLY" a11 
 join "ldb"."D_CHANGE_CREDIT_SCORE_PROJECT_C" a13 
	on (a11.CHANGE_CREDIT_SCORE_PROJECT_C_KEY = a13.ROW_KEY)  
 union
select 'ldb."d_assignment_group_manager" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."N_CHANGE_CREDIT_SCORE_MONTHLY" a11 
 join "ldb"."d_internal_organization_group" a12 
 on (a11.ASSIGNMENT_GROUP_KEY = a12.ROW_KEY) 
	join "ldb"."d_assignment_group_manager" a14 
	on (a12.assignment_group_manager_key = a14.ROW_KEY)  
 union
select 'ldb."d_h_ag_manager" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."N_CHANGE_CREDIT_SCORE_MONTHLY" a11 
 join "ldb"."d_internal_organization_group" a12 
 on (a11.ASSIGNMENT_GROUP_KEY = a12.ROW_KEY) join "ldb"."d_assignment_group_manager" a14 
 on (a12.assignment_group_manager_key = a14.ROW_KEY) 
	join "ldb"."d_h_ag_manager" a15 
	on (a14.assignment_group_manager_hierarchy_key = a15.ROW_KEY)  
 union
select 'ldb."d_calendar_month" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."N_CHANGE_CREDIT_SCORE_MONTHLY" a11 
 join "ldb"."d_calendar_month" a16 
	on (a11.AGGR_MONTH_KEY = a16.ROW_KEY)  
 union
select 'ldb."D_CHANGE_CREDIT_SCORE_TYPE_C" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."N_CHANGE_CREDIT_SCORE_MONTHLY" a11 
 join "ldb"."D_CHANGE_CREDIT_SCORE_TYPE_C" a17 
	on (a11.CHANGE_CREDIT_SCORE_TYPE_C_KEY = a17.ROW_KEY)  
 union
select 'ldb."D_CREDIT_SCORE_ASSIGNMENT_GROUP_SNAPSHOT_C" a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."N_CHANGE_CREDIT_SCORE_MONTHLY" a11 
 join "ldb"."D_CREDIT_SCORE_ASSIGNMENT_GROUP_SNAPSHOT_C" a18 
	on (a11.CREDIT_SCORE_ASSIGNMENT_GROUP_C_KEY = a18.ROW_KEY)  
 union
select 'ldb."d_internal_organization_department" a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."N_CHANGE_CREDIT_SCORE_MONTHLY" a11 
 join "ldb"."d_internal_organization_department" a19 
	on (a11.DEPARTMENT_KEY = a19.ROW_KEY)  
 union
select 'ldb."d_ag_manager_level_1" a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."N_CHANGE_CREDIT_SCORE_MONTHLY" a11 
 join "ldb"."d_internal_organization_group" a12 
 on (a11.ASSIGNMENT_GROUP_KEY = a12.ROW_KEY) join "ldb"."d_assignment_group_manager" a14 
 on (a12.assignment_group_manager_key = a14.ROW_KEY) join "ldb"."d_h_ag_manager" a15 
 on (a14.assignment_group_manager_hierarchy_key = a15.ROW_KEY) 
	join "ldb"."d_ag_manager_level_1" a110 
	on (a15.assignment_group_manager_level_1_key = a110.ROW_KEY)  
 union
select 'ldb."d_ag_manager_level_2" a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."N_CHANGE_CREDIT_SCORE_MONTHLY" a11 
 join "ldb"."d_internal_organization_group" a12 
 on (a11.ASSIGNMENT_GROUP_KEY = a12.ROW_KEY) join "ldb"."d_assignment_group_manager" a14 
 on (a12.assignment_group_manager_key = a14.ROW_KEY) join "ldb"."d_h_ag_manager" a15 
 on (a14.assignment_group_manager_hierarchy_key = a15.ROW_KEY) 
	join "ldb"."d_ag_manager_level_2" a111 
	on (a15.assignment_group_manager_level_2_key = a111.ROW_KEY)  
 union
select 'ldb."d_ag_manager_level_3" a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."N_CHANGE_CREDIT_SCORE_MONTHLY" a11 
 join "ldb"."d_internal_organization_group" a12 
 on (a11.ASSIGNMENT_GROUP_KEY = a12.ROW_KEY) join "ldb"."d_assignment_group_manager" a14 
 on (a12.assignment_group_manager_key = a14.ROW_KEY) join "ldb"."d_h_ag_manager" a15 
 on (a14.assignment_group_manager_hierarchy_key = a15.ROW_KEY) 
	join "ldb"."d_ag_manager_level_3" a112 
	on (a15.assignment_group_manager_level_3_key = a112.ROW_KEY)  
 union
select 'ldb."d_ag_manager_level_4" a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."N_CHANGE_CREDIT_SCORE_MONTHLY" a11 
 join "ldb"."d_internal_organization_group" a12 
 on (a11.ASSIGNMENT_GROUP_KEY = a12.ROW_KEY) join "ldb"."d_assignment_group_manager" a14 
 on (a12.assignment_group_manager_key = a14.ROW_KEY) join "ldb"."d_h_ag_manager" a15 
 on (a14.assignment_group_manager_hierarchy_key = a15.ROW_KEY) 
	join "ldb"."d_ag_manager_level_4" a113 
	on (a15.assignment_group_manager_level_4_key = a113.ROW_KEY)  
 union
select 'ldb."d_ag_manager_level_5" a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."N_CHANGE_CREDIT_SCORE_MONTHLY" a11 
 join "ldb"."d_internal_organization_group" a12 
 on (a11.ASSIGNMENT_GROUP_KEY = a12.ROW_KEY) join "ldb"."d_assignment_group_manager" a14 
 on (a12.assignment_group_manager_key = a14.ROW_KEY) join "ldb"."d_h_ag_manager" a15 
 on (a14.assignment_group_manager_hierarchy_key = a15.ROW_KEY) 
	join "ldb"."d_ag_manager_level_5" a114 
	on (a15.assignment_group_manager_level_5_key = a114.ROW_KEY) 

