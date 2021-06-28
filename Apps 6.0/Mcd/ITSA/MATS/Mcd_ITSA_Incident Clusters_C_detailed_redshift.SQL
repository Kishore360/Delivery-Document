select 'ldb."F_INCIDENT_CLUSTER" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT_CLUSTER" a11 
 union
select 'ldb."D_INCIDENT_DATE" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT_CLUSTER" a11 
 join "ldb"."D_INCIDENT_DATE" a12 
	on (a11.INCIDENT_DATE_KEY = a12.ROW_KEY)  
 union
select 'ldb."D_INCIDENT" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT_CLUSTER" a11 
 join "ldb"."D_INCIDENT" a13 
	on (a11.INCIDENT_KEY = a13.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_PROBLEM" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT_CLUSTER" a11 
 join "ldb"."D_INCIDENT" a13 
 on (a11.INCIDENT_KEY = a13.ROW_KEY) 
	join "ldb"."D_INCIDENT_PROBLEM" a14 
	on (a13.PROBLEM_KEY = a14.ROW_KEY)  
 union
select 'ldb."D_CLUSTER" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT_CLUSTER" a11 
 join "ldb"."D_CLUSTER" a15 
	on (a11.cluster_key = a15.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_CALENDAR_MONTH" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT_CLUSTER" a11 
 join "ldb"."D_INCIDENT_DATE" a12 
 on (a11.INCIDENT_DATE_KEY = a12.ROW_KEY) 
	join "ldb"."D_INCIDENT_CALENDAR_MONTH" a16 
	on (a12.month_start_date_key = a16.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_CAUSED_BY_CHANGE" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT_CLUSTER" a11 
 join "ldb"."D_INCIDENT_CAUSED_BY_CHANGE" a17 
	on (a11.INCIDENT_CAUSED_BY_CHANGE_KEY = a17.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_PRIORITY" a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT_CLUSTER" a11 
 join "ldb"."D_INCIDENT" a13 
 on (a11.INCIDENT_KEY = a13.ROW_KEY) 
	join "ldb"."D_INCIDENT_PRIORITY" a18 
	on (a13.PRIORITY_SRC_KEY = a18.ROW_KEY)  

