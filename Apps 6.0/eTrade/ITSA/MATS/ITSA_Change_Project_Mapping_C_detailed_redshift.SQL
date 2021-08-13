/* Tables Accessed:
D_CHANGE_JIRA_LINKAGE_C
D_JIRA_CHANGE_REQUEST_C
D_JIRA_WORK_ITEM_C
D_JIRA_WORK_ITEM_PROJECT_C
F_CHANGE_JIRA_LINKAGE_C
d_change_calendar_month
d_change_date */


select 'ldb."F_CHANGE_JIRA_LINKAGE_C" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_JIRA_LINKAGE_C" a11 
 union
select 'ldb."D_CHANGE_JIRA_LINKAGE_C" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_JIRA_LINKAGE_C" a11 
 join "ldb"."D_CHANGE_JIRA_LINKAGE_C" a12 
	on (a11.CHANGE_JIRA_LINKAGE_C_KEY = a12.ROW_KEY)  
 union
select 'ldb."D_JIRA_WORK_ITEM_C" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_JIRA_LINKAGE_C" a11 
 join "ldb"."D_CHANGE_JIRA_LINKAGE_C" a12 
 on (a11.CHANGE_JIRA_LINKAGE_C_KEY = a12.ROW_KEY) 
	join "ldb"."D_JIRA_WORK_ITEM_C" a13 
	on (a12.WORK_ITEM_KEY = a13.ROW_KEY)  
 union
select 'ldb."D_JIRA_WORK_ITEM_PROJECT_C" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_JIRA_LINKAGE_C" a11 
 join "ldb"."D_CHANGE_JIRA_LINKAGE_C" a12 
 on (a11.CHANGE_JIRA_LINKAGE_C_KEY = a12.ROW_KEY) join "ldb"."D_JIRA_WORK_ITEM_C" a13 
 on (a12.WORK_ITEM_KEY = a13.ROW_KEY) 
	join "ldb"."D_JIRA_WORK_ITEM_PROJECT_C" a14 
	on (a13.PROJECT_KEY = a14.ROW_KEY)  
 union
select 'ldb."d_change_date" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_JIRA_LINKAGE_C" a11 
 join "ldb"."d_change_date" a15 
	on (a11.CHANGE_JIRA_DATE_C_KEY = a15.ROW_KEY)  
 union
select 'ldb."d_change_calendar_month" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_JIRA_LINKAGE_C" a11 
 join "ldb"."d_change_date" a15 
 on (a11.CHANGE_JIRA_DATE_C_KEY = a15.ROW_KEY) 
	join "ldb"."d_change_calendar_month" a16 
	on (a15.month_start_date_key = a16.ROW_KEY)  
 union
select 'ldb."D_JIRA_CHANGE_REQUEST_C" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_JIRA_LINKAGE_C" a11 
 join "ldb"."D_CHANGE_JIRA_LINKAGE_C" a12 
 on (a11.CHANGE_JIRA_LINKAGE_C_KEY = a12.ROW_KEY) 
	join "ldb"."D_JIRA_CHANGE_REQUEST_C" a17 
	on (a12.CHANGE_REQUEST_KEY = a17.ROW_KEY) 

