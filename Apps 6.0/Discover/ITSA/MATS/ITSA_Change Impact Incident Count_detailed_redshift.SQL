/* Tables Accessed:
d_application
d_calendar_date
d_calendar_month
d_incident
d_incident_application
f_change_request
f_incident */

select 'ldb."f_incident" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident" a11 
 union
select 'ldb."d_application" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident" a11 
 join "ldb"."d_application" a12 on (a11.application_key = a12.row_key)  
 union
select 'ldb."D_APPLICATION_MDM" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident" a11 
 join "ldb"."d_application" a12 on (a11.application_key = a12.row_key) 
 join ldb.D_APPLICATION_MDM a13 ON a12.mdm_key=a13.row_key 
union
select 'ldb."d_calendar_date" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11 
join "ldb"."d_calendar_date" a14 on (a11.date_key = a14.row_key)  
union
select 'ldb."d_incident" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11 
join "ldb"."d_incident" a15 on (a11.incident_key = a15.row_key) 
UNION 
select 'ldb."d_calendar_month" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11 
join "ldb"."d_calendar_date" a14 on (a11.date_key = a14.row_key) 
join "ldb"."d_calendar_month" a15 ON a14.month_start_date_key=a15.row_key 

