/* Tables Accessed:
D_INCIDENT
D_INCIDENT_CALENDAR_MONTH
D_INCIDENT_CALENDAR_WEEK
D_INCIDENT_DATE
F_INCIDENT_KEYWORD
 */
 
 
select 'ldb."F_INCIDENT_KEYWORD" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_KEYWORD" a11 
UNION 
select 'ldb."D_INCIDENT" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_KEYWORD" a11 
join "ldb"."D_INCIDENT" a12 on (a11.incident_key = a12.ROW_KEY)
union
select 'ldb."D_INCIDENT_DATE" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_KEYWORD" a11 
join "ldb"."D_INCIDENT_DATE" a12 on (a11.incident_date_key = a12.ROW_KEY) 
union
select 'ldb."D_INCIDENT_CALENDAR_MONTH" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_KEYWORD" a11 
join "ldb"."D_INCIDENT_DATE" a12 on (a11.incident_date_key = a12.ROW_KEY) 
join "ldb"."D_INCIDENT_CALENDAR_MONTH" a13 on (a12.month_start_date_key = a13.ROW_KEY) 
UNION 
select 'ldb."D_INCIDENT_CALENDAR_WEEK" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_KEYWORD" a11 
join "ldb"."D_INCIDENT_DATE" a12 on (a11.incident_date_key = a12.ROW_KEY) 
join "ldb"."D_INCIDENT_CALENDAR_MONTH" a13 on (a12.month_start_date_key = a13.ROW_KEY) 
join "ldb"."D_INCIDENT_CALENDAR_WEEK" a14 on (a12.week_start_date_key = a14.ROW_KEY) 

