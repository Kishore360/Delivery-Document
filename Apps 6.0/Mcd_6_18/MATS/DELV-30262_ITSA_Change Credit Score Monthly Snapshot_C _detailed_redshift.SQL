/* Tables Accessed:
D_BUSINESS_SERVICE
D_INTERNAL_ORGANIZATION_CCS_VENDOR_C
d_assignment_group_manager
d_calendar_month
d_internal_organization_department
d_internal_organization_group
n_change_credit_score_monthly */


select 'ldb."N_CHANGE_CREDIT_SCORE_MONTHLY" "a11" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."N_CHANGE_CREDIT_SCORE_MONTHLY" "a11" 
 union
select 'ldb."d_internal_organization_group" "a12" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."N_CHANGE_CREDIT_SCORE_MONTHLY" "a11" 

	join "ldb"."d_internal_organization_group" "a12" 
	on ("a11"."ASSIGNMENT_GROUP_KEY" = "a12"."ROW_KEY")  
 union
select 'ldb."D_BUSINESS_SERVICE" "a13" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."N_CHANGE_CREDIT_SCORE_MONTHLY" "a11" 

	join "ldb"."D_BUSINESS_SERVICE" "a13" 
	on ("a11"."BUSINESS_SERVICE_KEY" = "a13"."ROW_KEY")  
 union
select 'ldb."d_calendar_month" "a14" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."N_CHANGE_CREDIT_SCORE_MONTHLY" "a11" 

	join "ldb"."d_calendar_month" "a14" 
	on ("a11"."AGGR_MONTH_KEY" = "a14"."ROW_KEY")  
 union
select 'ldb."d_internal_organization_department" "a15" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."N_CHANGE_CREDIT_SCORE_MONTHLY" "a11" 

	join "ldb"."d_internal_organization_department" "a15" 
	on ("a11"."DEPARTMENT_KEY" = "a15"."ROW_KEY")  
 union
select 'ldb."d_assignment_group_manager" "a16" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."N_CHANGE_CREDIT_SCORE_MONTHLY" "a11" 
 join "ldb"."d_internal_organization_group" "a12" 
	on ("a11"."ASSIGNMENT_GROUP_KEY" = "a12"."ROW_KEY")
	join "ldb"."d_assignment_group_manager" "a16" 
	on ("a12"."assignment_group_manager_key" = "a16"."ROW_KEY")  
 union
select 'ldb."D_INTERNAL_ORGANIZATION_CCS_VENDOR_C" "a17" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."N_CHANGE_CREDIT_SCORE_MONTHLY" "a11" 
join "ldb"."d_internal_organization_group" "a12" 
	on ("a11"."ASSIGNMENT_GROUP_KEY" = "a12"."ROW_KEY")
	join "ldb"."D_INTERNAL_ORGANIZATION_CCS_VENDOR_C" "a17" 
	on ("a12"."CCS_VENDOR_C_KEY" = "a17"."ROW_KEY") 

