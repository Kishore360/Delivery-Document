/* Tables Accessed:
d_calendar_date
d_calendar_month
d_change_request_caused_by
d_cluster
d_incident
d_incident_priority
d_problem
f_incident_cluster */

select 'ldb."f_incident_cluster" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_cluster" a11 
 union
select 'ldb."d_calendar_date" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_cluster" a11 
 join "ldb"."d_calendar_date" a12 
	on (a11.date_key = a12.row_key)  
 union
select 'ldb."d_problem" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_cluster" a11 
 join "ldb"."d_problem" a13 
	on (a11.problem_key = a13.row_key)  
 union
select 'ldb."d_incident" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_cluster" a11 
 join "ldb"."d_incident" a14 
	on (a11.incident_key = a14.row_key)  
 union
select 'ldb."d_cluster" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_cluster" a11 
 join "ldb"."d_cluster" a15 
	on (a11.cluster_key = a15.row_key)  
 union
select 'ldb."d_calendar_month" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_cluster" a11 
 join "ldb"."d_calendar_date" a12 
 on (a11.date_key = a12.row_key) 
	join "ldb"."d_calendar_month" a16 
	on (a12.month_start_date_key = a16.row_key)  
 union
select 'ldb."d_change_request_caused_by" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_cluster" a11 
 join "ldb"."d_change_request_caused_by" a17 
	on (a11.caused_by_change_key = a17.row_key)  
 union
select 'ldb."d_incident_priority" a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_cluster" a11 
 join "ldb"."d_incident" a14 
 on (a11.incident_key = a14.row_key) 
	join "ldb"."d_incident_priority" a18 
	on (a14.priority_src_key = a18.row_key) 

