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
select 'ldb."D_INTERNAL_ORGANIZATION_GROUP" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_N_CHANGE_CREDIT_SCORE_WEEKLY_FACT_C" a11 
 join "ldb"."D_INTERNAL_ORGANIZATION_GROUP" a12 
	on (a11.ASSIGNMENT_GROUP_KEY = a12.ROW_KEY)  
 union
select 'ldb."D_CALENDAR_WEEK" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_N_CHANGE_CREDIT_SCORE_WEEKLY_FACT_C" a11 
 join "ldb"."D_CALENDAR_WEEK" a13 
	on (a11.AGGR_WEEK_C_KEY = a13.ROW_KEY)  
 union
select 'ldb."D_INTERNAL_ORGANIZATION_DEPARTMENT" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_N_CHANGE_CREDIT_SCORE_WEEKLY_FACT_C" a11 
 join "ldb"."D_INTERNAL_ORGANIZATION_DEPARTMENT" a14 
	on (a11.DEPARTMENT_KEY = a14.ROW_KEY)  
 union
select 'ldb."D_ASSIGNMENT_GROUP_MANAGER" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_N_CHANGE_CREDIT_SCORE_WEEKLY_FACT_C" a11 
 join "ldb"."D_INTERNAL_ORGANIZATION_GROUP" a12 
 on (a11.ASSIGNMENT_GROUP_KEY = a12.ROW_KEY) 
	join "ldb"."D_ASSIGNMENT_GROUP_MANAGER" a15 
	on (a12.ASSIGNMENT_GROUP_MANAGER_KEY = a15.ROW_KEY)  
 union
select 'ldb."D_INTERNAL_ORGANIZATION_CCS_VENDOR_C" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_N_CHANGE_CREDIT_SCORE_WEEKLY_FACT_C" a11 
 join "ldb"."D_INTERNAL_ORGANIZATION_GROUP" a12 
 on (a11.ASSIGNMENT_GROUP_KEY = a12.ROW_KEY) 
	join "ldb"."D_INTERNAL_ORGANIZATION_CCS_VENDOR_C" a16 
	on (a12.CCS_VENDOR_C_KEY = a16.ROW_KEY)  

