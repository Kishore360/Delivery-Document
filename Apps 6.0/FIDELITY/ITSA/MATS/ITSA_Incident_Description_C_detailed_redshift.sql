select 'ldb."f_incident_resolved" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_resolved" a11
union
select 'ldb."d_calendar_date" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_resolved" a11
join "ldb"."d_calendar_date" a12
on (a11.DATE_KEY = a12.ROW_KEY)
union
select 'ldb."D_INCIDENT" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_resolved" a11
join "ldb"."D_INCIDENT" a13
on (a11.INCIDENT_KEY = a13.ROW_KEY)
union
select 'ldb."d_calendar_month" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_resolved" a11
join "ldb"."d_calendar_date" a12
on (a11.DATE_KEY = a12.ROW_KEY)
join "ldb"."d_calendar_month" a14
on (a12.month_start_date_key = a14.ROW_KEY)
union
select 'ldb."d_lov_incident_environment_c" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_resolved" a11
join "ldb"."D_INCIDENT" a13
on (a11.INCIDENT_KEY = a13.ROW_KEY)
join "ldb"."d_lov_incident_environment_c" a15
on (a13.ENVIRONMENT_SRC_C_KEY = a15.ROW_KEY)