/* Tables Accessed:
D_BUSINESS_SERVICE
D_INTERNAL_ORGANIZATION_CCS_VENDOR_C
d_assignment_group_manager
d_calendar_month
d_internal_organization_department
d_internal_organization_group
n_change_credit_score_monthly */


select 'ldb."n_change_credit_score_monthly" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."n_change_credit_score_monthly" a11 
 union
select 'ldb."d_internal_organization_group" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."n_change_credit_score_monthly" a11 
 join "ldb"."d_internal_organization_group" a12 
	on (a11.assignment_group_key = a12.row_key)  
 union
select 'ldb."D_BUSINESS_SERVICE" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."n_change_credit_score_monthly" a11 
 join "ldb"."D_BUSINESS_SERVICE" a13 
	on (a11.business_service_key = a13.row_key)  
 union
select 'ldb."d_calendar_month" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."n_change_credit_score_monthly" a11 
 join "ldb"."d_calendar_month" a14 
	on (a11.aggr_month_key = a14.row_key)  
 union
select 'ldb."d_internal_organization_department" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."n_change_credit_score_monthly" a11 
 join "ldb"."d_internal_organization_department" a15 
	on (a11.department_key = a15.row_key)  
 union
select 'ldb."d_assignment_group_manager" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."n_change_credit_score_monthly" a11 
 join "ldb"."d_internal_organization_group" a12 
 on (a11.assignment_group_key = a12.row_key) 
	join "ldb"."d_assignment_group_manager" a16 
	on (a12.assignment_group_manager_key = a16.row_key)  
 union
select 'ldb."D_INTERNAL_ORGANIZATION_CCS_VENDOR_C" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."n_change_credit_score_monthly" a11 
 join "ldb"."d_internal_organization_group" a12 
 on (a11.assignment_group_key = a12.row_key) 
	join "ldb"."D_INTERNAL_ORGANIZATION_CCS_VENDOR_C" a17 
	on (a12.CCS_VENDOR_C_KEY = a17.row_key) 

