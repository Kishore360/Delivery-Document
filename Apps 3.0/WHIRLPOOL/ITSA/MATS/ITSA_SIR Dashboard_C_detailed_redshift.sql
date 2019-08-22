select 'ldb.f_sir_dashboard_c a11' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sir_dashboard_c a11
union 
select 'ldb.d_change_request a12' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sir_dashboard_c a11
join ldb.d_change_request a12
on (a11.change_request_key = a12.row_key)
union
select 'ldb.d_calendar_date	a13' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sir_dashboard_c a11
join ldb.d_calendar_date	a13
on (a11.planned_start_on_key = a13.row_key)
union
select 'ldb.d_calendar_quarter	a14' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sir_dashboard_c a11
 join ldb.d_calendar_date	a13
on (a11.planned_start_on_key = a13.row_key)
join ldb.d_calendar_quarter	a14
on (a13.quarter_start_date_key = a14.row_key)
union
select 'ldb.d_calendar_week	a15' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sir_dashboard_c a11
join ldb.d_calendar_date	a13
on (a11.planned_start_on_key = a13.row_key)
join ldb.d_calendar_week	a15
on (a13.week_start_date_key = a15.row_key)
union
select 'ldb.d_problem	a16' as Table_name,count(a11.row_key) Row_Count
from ldb.f_sir_dashboard_c a11
join ldb.d_problem	a16
on (a11.problem_key = a16.row_key)
union
select 'ldb.d_change_request_approval	a17' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sir_dashboard_c a11
join ldb.d_change_request_approval	a17
on (a11.approval_state_src_key = a17.row_key)
union
select 'ldb.d_configuration_item	a18' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sir_dashboard_c a11
join ldb.d_configuration_item	a18
on (a11.configuration_item_key = a18.row_key)
union
select 'ldb.d_implementation_result_c	a19' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sir_dashboard_c a11
join ldb.d_implementation_result_c	a19
on (a11.implementation_result_src_c_key = a19.row_key)
union
select 'ldb.d_calendar_month	a110' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sir_dashboard_c a11
join ldb.d_calendar_date	a13
on (a11.planned_start_on_key = a13.row_key)
join ldb.d_calendar_month	a110
on (a13.month_start_date_key = a110.row_key)

