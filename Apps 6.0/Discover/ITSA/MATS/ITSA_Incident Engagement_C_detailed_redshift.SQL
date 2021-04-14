/* Tables Accessed:
d_calendar_date
d_calendar_month
d_calendar_quarter
d_calendar_week
d_calendar_year
d_incident
f_inc_engagement_c */

select 'ldb."f_inc_engagement_c" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_inc_engagement_c" a11 
 union
select 'ldb."d_calendar_date" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."d_calendar_date" a11 
 join "ldb"."f_inc_engagement_c" a12 
	on (a11.row_key = a12.calendar_date_key)  
 union
select 'ldb."d_incident" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."d_calendar_date" a11 
 join "ldb"."f_inc_engagement_c" a12 
 on (a11.row_key = a12.calendar_date_key) 
	join "ldb"."d_incident" a13 
	on (a12.incident_key = a13.row_key)  
 union
select 'ldb."d_calendar_month" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."d_calendar_date" a11 
 join "ldb"."d_calendar_month" a14 
	on (a11.month_start_date_key = a14.row_key)  
 union
select 'ldb."d_calendar_quarter" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."d_calendar_date" a11 
 join "ldb"."d_calendar_month" a14 
 on (a11.month_start_date_key = a14.row_key) 
	join "ldb"."d_calendar_quarter" a15 
	on (a14.quarter_start_date_key = a15.row_key)  
 union
select 'ldb."d_calendar_week" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."d_calendar_date" a11 
 join "ldb"."d_calendar_week" a16 
	on (a11.week_start_date_key = a16.row_key)  
 union
select 'ldb."d_calendar_year" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."d_calendar_date" a11 
 join "ldb"."d_calendar_month" a14 
 on (a11.month_start_date_key = a14.row_key) join "ldb"."d_calendar_quarter" a15 
 on (a14.quarter_start_date_key = a15.row_key) 
	join "ldb"."d_calendar_year" a17 
	on (a15.year_start_date_key = a17.row_key) 

