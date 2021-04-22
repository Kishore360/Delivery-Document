select 'ldb."F_INCIDENT_ALERT_C" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_ALERT_C" a11
union
select 'ldb."d_calendar_date" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_ALERT_C" a11
join "ldb"."d_calendar_date" a12
on (a11.DATE_KEY = a12.ROW_KEY)
union
select 'ldb."D_INCIDENT_ALERT_C" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_ALERT_C" a11
join "ldb"."D_INCIDENT_ALERT_C" a13
on (a11.INCIDENT_ALERT_C_KEY = a13.ROW_KEY)
union
select 'ldb."d_calendar_month" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_ALERT_C" a11
join "ldb"."d_calendar_date" a12
on (a11.DATE_KEY = a12.ROW_KEY)
join "ldb"."d_calendar_month" a14
on (a12.month_start_date_key = a14.ROW_KEY)
union
select 'ldb."D_INTERNAL_CONTACT_INCIDENT_ALERT_CLOSED_BY_C" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_ALERT_C" a11
join "ldb"."D_INCIDENT_ALERT_C" a13
on (a11.INCIDENT_ALERT_C_KEY = a13.ROW_KEY)
join "ldb"."D_INTERNAL_CONTACT_INCIDENT_ALERT_CLOSED_BY_C" a15
on (a13.INCIDENT_ALERT_CLOSED_BY_C_KEY = a15.ROW_KEY)
union
select 'ldb."D_INTERNAL_CONTACT_INCIDENT_ALERT_CREATED_BY_C" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_ALERT_C" a11
join "ldb"."D_INCIDENT_ALERT_C" a13
on (a11.INCIDENT_ALERT_C_KEY = a13.ROW_KEY)
join "ldb"."D_INTERNAL_CONTACT_INCIDENT_ALERT_CREATED_BY_C" a16
on (a13.INCIDENT_ALERT_CREATED_BY_C_KEY = a16.ROW_KEY)
union
select 'ldb."D_LOV_INCIDENT_ALERT_DETECTION_C" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_ALERT_C" a11
join "ldb"."D_INCIDENT_ALERT_C" a13
on (a11.INCIDENT_ALERT_C_KEY = a13.ROW_KEY)
join "ldb"."D_LOV_INCIDENT_ALERT_DETECTION_C" a17
on (a13.INCIDENT_ALERT_DETECTION_C_KEY = a17.ROW_KEY)
union
select 'ldb."D_LOV_INCIDENT_ALERT_DETECTION_TYPE_C" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_ALERT_C" a11
join "ldb"."D_INCIDENT_ALERT_C" a13
on (a11.INCIDENT_ALERT_C_KEY = a13.ROW_KEY)
join "ldb"."D_LOV_INCIDENT_ALERT_DETECTION_TYPE_C" a18
on (a13.INCIDENT_ALERT_DETECTION_TYPE_C_KEY = a18.ROW_KEY)
union
select 'ldb."D_PROBLEM_INCIDENT_ALERT_C" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_ALERT_C" a11
join "ldb"."D_INCIDENT_ALERT_C" a13
on (a11.INCIDENT_ALERT_C_KEY = a13.ROW_KEY)
join "ldb"."D_PROBLEM_INCIDENT_ALERT_C" a19
on (a13.INCIDENT_ALERT_PROBLEM_C_KEY = a19.ROW_KEY)
union
select 'ldb."D_LOV_INCIDENT_ALERT_SEVERITY_C" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_ALERT_C" a11
join "ldb"."D_INCIDENT_ALERT_C" a13
on (a11.INCIDENT_ALERT_C_KEY = a13.ROW_KEY)
join "ldb"."D_LOV_INCIDENT_ALERT_SEVERITY_C" a110
on (a13.INCIDENT_ALERT_SEVERITY_C_KEY = a110.ROW_KEY)
union
select 'ldb."D_INCIDENT_ALERT_SOURCE_INCIDENT_C" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_ALERT_C" a11
join "ldb"."D_INCIDENT_ALERT_C" a13
on (a11.INCIDENT_ALERT_C_KEY = a13.ROW_KEY)
join "ldb"."D_INCIDENT_ALERT_SOURCE_INCIDENT_C" a111
on (a13.INCIDENT_ALERT_SOURCE_INCIDENT_C_KEY = a111.ROW_KEY)
union
select 'ldb."D_LOV_INCIDENT_ALERT_STATE_C" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_ALERT_C" a11
join "ldb"."D_INCIDENT_ALERT_C" a13
on (a11.INCIDENT_ALERT_C_KEY = a13.ROW_KEY)
join "ldb"."D_LOV_INCIDENT_ALERT_STATE_C" a112
on (a13.INCIDENT_ALERT_STATE_C_KEY = a112.ROW_KEY)


 