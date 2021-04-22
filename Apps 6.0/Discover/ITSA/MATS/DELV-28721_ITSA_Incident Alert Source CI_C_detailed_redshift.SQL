select 'ldb."F_INCIDENT_ALERT_CI_C" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_ALERT_CI_C" a11
union
select 'ldb."d_calendar_date" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_ALERT_CI_C" a11
join "ldb"."d_calendar_date" a12
on (a11.DATE_KEY = a12.ROW_KEY)
union
select 'ldb."D_INCIDENT_ALERT_C" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_ALERT_CI_C" a11
join "ldb"."D_INCIDENT_ALERT_C" a13
on (a11.INCIDENT_ALERT_C_KEY = a13.ROW_KEY)
union
select 'ldb."d_calendar_month" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_ALERT_CI_C" a11
join "ldb"."d_calendar_date" a12
on (a11.DATE_KEY = a12.ROW_KEY)
join "ldb"."d_calendar_month" a14
on (a12.month_start_date_key = a14.ROW_KEY)
union
select 'ldb."D_CONFIGURATION_ITEM_INCIDENT_ALERT_C" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_ALERT_CI_C" a11
join "ldb"."D_CONFIGURATION_ITEM_INCIDENT_ALERT_C" a15
on (a11.INCIDENT_ALERT_CI_C_KEY = a15.ROW_KEY)
union
select 'ldb."D_LOV_INCIDENT_ALERT_STATE_C" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_ALERT_CI_C" a11
join "ldb"."D_INCIDENT_ALERT_C" a13
on (a11.INCIDENT_ALERT_C_KEY = a13.ROW_KEY)
join "ldb"."D_LOV_INCIDENT_ALERT_STATE_C" a16
on (a13.INCIDENT_ALERT_STATE_C_KEY = a16.ROW_KEY)