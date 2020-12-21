select 'ldb.f_affected_ci a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_affected_ci a11
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_affected_ci a11
join ldb.d_calendar_date a12
on (a11.task_opened_on_key = a12.row_key)
union
select 'ldb.d_calendar_month a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_affected_ci a11
join ldb.d_calendar_date a12
on (a11.task_opened_on_key = a12.row_key)
join ldb.d_calendar_month a13
on (a12.month_start_date_key = a13.row_key)
union
select 'ldb.d_affected_ci a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_affected_ci a11
join ldb.d_affected_ci a14
on (a11.affected_ci_key = a14.row_key)
union
select 'ldb.d_task_ci a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_affected_ci a11
join ldb.d_task_ci a15
on (a11.task_affecting_ci_key = a15.row_key)
union
select 'ldb.d_task_task_type_ci a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_affected_ci a11
join ldb.d_task_task_type_ci a16
on (a11.task_task_type_ci_key = a16.row_key)
union
select 'ldb.d_affected_ci_company_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_affected_ci a11
join ldb.d_affected_ci a14
on (a11.affected_ci_key = a14.row_key)
join ldb.d_affected_ci_company_c a17
on (a14.affected_ci_company_c_key = a17.row_key)




