select 'ldb."f_affected_ci" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_affected_ci" a11
union
select 'ldb."d_calendar_date" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_affected_ci" a11
join "ldb"."d_calendar_date" a12
on (a11.task_opened_on_key = a12.ROW_KEY)
union
select 'ldb."d_affected_ci" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_affected_ci" a11
join "ldb"."d_affected_ci" a13
on (a11.affected_ci_key = a13.ROW_KEY)
union
select 'ldb."d_affected_application_c" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_affected_ci" a11
join "ldb"."d_affected_ci" a13
on (a11.affected_ci_key = a13.ROW_KEY)
join "ldb"."d_affected_application_c" a14
on (a13.APPLICATION_C_KEY = a14.ROW_KEY)
union
select 'ldb."d_task_ci" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_affected_ci" a11
join "ldb"."d_task_ci" a15
on (a11.task_affecting_ci_key = a15.ROW_KEY)
union
select 'ldb."d_calendar_month" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_affected_ci" a11
join "ldb"."d_calendar_date" a12
on (a11.task_opened_on_key = a12.ROW_KEY)
join "ldb"."d_calendar_month" a16
on (a12.month_start_date_key = a16.ROW_KEY)
union
select 'ldb."d_task_task_type_ci" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_affected_ci" a11
join "ldb"."d_task_task_type_ci" a17
on (a11.task_task_type_ci_key = a17.ROW_KEY)