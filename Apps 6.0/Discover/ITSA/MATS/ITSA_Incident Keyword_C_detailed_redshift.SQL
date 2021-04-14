/* Tables Accessed:
d_calendar_date
d_calendar_month
d_calendar_quarter
d_calendar_week
d_calendar_year
d_incident
f_incident_keyword */

select 'ldb."f_incident_keyword" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_keyword" a11 
 union
select 'ldb."d_calendar_date" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_keyword" a11 
 join "ldb"."d_calendar_date" a12 
	on (a11.date_key = a12.row_key)  
 union
select 'ldb."d_calendar_week" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_keyword" a11 
 join "ldb"."d_calendar_date" a12 
 on (a11.date_key = a12.row_key) 
	join "ldb"."d_calendar_week" a13 
	on (a12.week_start_date_key = a13.row_key)  
 union
select 'ldb."d_incident" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_keyword" a11 
 join "ldb"."d_incident" a14 
	on (a11.table_row_key = a14.row_key)  
 union
select 'ldb."d_calendar_month" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_keyword" a11 
 join "ldb"."d_calendar_date" a12 
 on (a11.date_key = a12.row_key) 
	join "ldb"."d_calendar_month" a15 
	on (a12.month_start_date_key = a15.row_key)  
 union
select 'ldb."d_calendar_quarter" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_keyword" a11 
 join "ldb"."d_calendar_date" a12 
 on (a11.date_key = a12.row_key) join "ldb"."d_calendar_month" a15 
 on (a12.month_start_date_key = a15.row_key) 
	join "ldb"."d_calendar_quarter" a16 
	on (a15.quarter_start_date_key = a16.row_key)  
 union
select 'ldb."d_calendar_year" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_keyword" a11 
 join "ldb"."d_calendar_date" a12 
 on (a11.date_key = a12.row_key) join "ldb"."d_calendar_month" a15 
 on (a12.month_start_date_key = a15.row_key) join "ldb"."d_calendar_quarter" a16 
 on (a15.quarter_start_date_key = a16.row_key) 
	join "ldb"."d_calendar_year" a17 
	on (a16.year_start_date_key = a17.row_key) 

