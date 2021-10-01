
/* Tables Accessed:
D_INCIDENT_PROBLEM
d_cluster
d_incident
d_incident_calendar_month
d_incident_caused_by_change
d_incident_date
d_incident_priority
f_incident_cluster
f_incident_cluster_resolved */

select 'ldb."f_incident_cluster_resolved" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_cluster_resolved" a11 
 union
select 'ldb."d_incident_date" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_cluster_resolved" a11 
 join "ldb"."d_incident_date" a12 
	on (a11.incident_date_key = a12.row_key)  
 union
select 'ldb."d_incident_calendar_month" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_cluster_resolved" a11 
 join "ldb"."d_incident_date" a12 
 on (a11.incident_date_key = a12.row_key) 
	join "ldb"."d_incident_calendar_month" a13 
	on (a12.month_start_date_key = a13.previous_month_key) 
UNION 
 select 'ldb."d_incident" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_cluster_resolved" a11 
 JOIN ldb.d_incident b ON a11.INCIDENT_KEY=b.row_key 
 UNION 
  select 'ldb."d_incident_priority" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_cluster_resolved" a11 
 JOIN ldb.d_incident b ON a11.INCIDENT_KEY=b.row_key 
 JOIN ldb.d_incident_priority c ON b.priority_src_key=c.row_key
UNION 
select 'ldb."d_incident_caused_by_change" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_cluster_resolved" a11 
 JOIN ldb.d_incident_caused_by_change b ON a11.INCIDENT_CAUSED_BY_CHANGE_KEY=b.row_key 
 UNION 
   select 'ldb."D_INCIDENT_PROBLEM" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_cluster_resolved" a11 
 JOIN ldb.d_incident b ON a11.INCIDENT_KEY=b.row_key 
 JOIN ldb.D_INCIDENT_PROBLEM c ON b.problem_key=c.row_key 
UNION 
    select 'ldb."d_cluster" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_cluster_resolved" a11 
 JOIN ldb.d_cluster b ON a11.cluster2_key=b.row_key
