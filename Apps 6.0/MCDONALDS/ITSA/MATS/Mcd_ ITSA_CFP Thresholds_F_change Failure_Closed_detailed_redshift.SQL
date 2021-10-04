/* Tables Accessed:
D_CALENDAR_DATE
D_CALENDAR_MONTH
D_CHANGE_FAILURE
F_CHANGE_FAILURE_CLOSED
F_CRP_THRESHOLDS
F_DQ_CHANGE_THRESHOLDS
 */
 
select 'ldb."F_CHANGE_FAILURE_CLOSED" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_FAILURE_CLOSED" a11 
 union
select 'ldb."D_CALENDAR_DATE" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_FAILURE_CLOSED" a11 
 join "ldb"."D_CALENDAR_DATE" a12 
 on (a11.DATE_KEY = a12.ROW_KEY)  
 union
select 'ldb."D_CHANGE_FAILURE" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_FAILURE_CLOSED" a11 
 join "ldb"."D_CHANGE_FAILURE" a13 
 on (a11.change_failure_key = a13.ROW_KEY)  
 union
select 'ldb."D_CALENDAR_MONTH" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_FAILURE_CLOSED" a11 
 join "ldb"."D_CALENDAR_DATE" a12 
 on (a11.DATE_KEY = a12.ROW_KEY) 
join "ldb"."D_CALENDAR_MONTH" a14 
 on (a12.month_start_date_key = a14.ROW_KEY) 

