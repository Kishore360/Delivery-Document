/* Tables Accessed:
D_CALENDAR_SNAPSHOT_RUNDATE_C
D_CALENDAR_WEEK
D_INTERNAL_ORGANIZATION_CCS_VENDOR_C
F_N_CHANGE_CREDIT_SCORE_WEEKLY_FACT_C
d_assignment_group_manager
d_internal_organization_department
d_internal_organization_group */


select 'ldb."F_N_CHANGE_CREDIT_SCORE_WEEKLY_FACT_C" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_N_CHANGE_CREDIT_SCORE_WEEKLY_FACT_C" a11 
 union
select 'ldb."D_CALENDAR_SNAPSHOT_RUNDATE_C" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_N_CHANGE_CREDIT_SCORE_WEEKLY_FACT_C" a11 
 join "ldb"."D_CALENDAR_SNAPSHOT_RUNDATE_C" a12 
	on (a11.SNAPSHOT_RUN_C_KEY = a12.row_key)  
 union
select 'ldb."d_internal_organization_group" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_N_CHANGE_CREDIT_SCORE_WEEKLY_FACT_C" a11 
 join "ldb"."d_internal_organization_group" a13 
	on (a11.assignment_group_key = a13.row_key)  
 union
select 'ldb."D_CALENDAR_WEEK" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_N_CHANGE_CREDIT_SCORE_WEEKLY_FACT_C" a11 
 join "ldb"."D_CALENDAR_WEEK" a14 
	on (a11.AGGR_WEEK_C_KEY = a14.row_key)  
 union
select 'ldb."d_internal_organization_department" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_N_CHANGE_CREDIT_SCORE_WEEKLY_FACT_C" a11 
 join "ldb"."d_internal_organization_department" a15 
	on (a11.department_key = a15.row_key)  
 union
select 'ldb."d_assignment_group_manager" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_N_CHANGE_CREDIT_SCORE_WEEKLY_FACT_C" a11 
 join "ldb"."d_internal_organization_group" a13 
 on (a11.assignment_group_key = a13.row_key) 
	join "ldb"."d_assignment_group_manager" a16 
	on (a13.assignment_group_manager_key = a16.row_key)  
 union
select 'ldb."D_INTERNAL_ORGANIZATION_CCS_VENDOR_C" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_N_CHANGE_CREDIT_SCORE_WEEKLY_FACT_C" a11 
 join "ldb"."d_internal_organization_group" a13 
 on (a11.assignment_group_key = a13.row_key) 
	join "ldb"."D_INTERNAL_ORGANIZATION_CCS_VENDOR_C" a17 
	on (a13.CCS_VENDOR_C_KEY = a17.row_key) 

