select 'ldb."f_affected_ci_application_c" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_affected_ci_application_c" a11
union
select 'ldb."d_affected_ci_application_c" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_affected_ci_application_c" a11
join "ldb"."d_affected_ci_application_c" a12
on (a11.affected_ci_application_c_key = a12.ROW_KEY)
union
select 'ldb."d_calendar_date" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_affected_ci_application_c" a11
join "ldb"."d_calendar_date" a13
on (a11.task_opened_on_key = a13.ROW_KEY)
union
select 'ldb."D_INCIDENT" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_affected_ci_application_c" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_affected_ci_app_c_key = a14.ROW_KEY)
union
select 'ldb."d_calendar_month" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_affected_ci_application_c" a11
join "ldb"."d_calendar_date" a13
on (a11.task_opened_on_key = a13.ROW_KEY)
join "ldb"."d_calendar_month" a15
on (a13.month_start_date_key = a15.ROW_KEY)
union
select 'ldb."d_lov_incident_environment_c" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_affected_ci_application_c" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_affected_ci_app_c_key = a14.ROW_KEY)
join "ldb"."d_lov_incident_environment_c" a16
on (a14.ENVIRONMENT_SRC_C_KEY = a16.ROW_KEY)