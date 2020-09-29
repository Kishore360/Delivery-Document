select 'ldb."f_change_task" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
union
select 'ldb."D_CHANGE_REQUEST" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
union
select 'ldb."d_calendar_date" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_calendar_date" a13
on (a11.DATE_KEY = a13.ROW_KEY)
union
select 'ldb."d_change_task" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a14
on (a11.change_task_key = a14.ROW_KEY)
union
select 'ldb."d_lov_change_environment_c" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_lov_change_environment_c" a15
on (a12.CHANGE_ENVIRONMENT_SRC_C_KEY = a15.ROW_KEY)
union
select 'ldb."d_calendar_month" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_calendar_date" a13
on (a11.DATE_KEY = a13.ROW_KEY)
join "ldb"."d_calendar_month" a16
on (a13.month_start_date_key = a16.ROW_KEY)