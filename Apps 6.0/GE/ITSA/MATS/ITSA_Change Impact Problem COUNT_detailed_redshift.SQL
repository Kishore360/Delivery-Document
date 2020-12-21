select 'ldb.f_problem a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
union
select 'ldb.d_problem a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a12
on (a11.problem_key = a12.row_key)
union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a15
on (a11.date_key = a15.row_key)
union
select 'ldb.d_problem_configuration_item a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a12
on (a11.problem_key = a12.row_key)
join ldb.d_problem_configuration_item a16
on (a12.configuration_item_key = a16.row_key)
union
select 'ldb.d_calendar_month a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a15
on (a11.date_key = a15.row_key)
join ldb.d_calendar_month a17
on (a15.month_start_date_key = a17.row_key)

union
select 'ldb.d_problem_configuration_item_mdm a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a12
on (a11.problem_key = a12.row_key) join ldb.d_problem_configuration_item a16
on (a12.configuration_item_key = a16.row_key)
join ldb.d_problem_configuration_item_mdm a19
on (a16.mdm_key = a19.row_key)