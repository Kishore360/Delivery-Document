select 'ldb.f_problem	a11 ' as Table_name, count(1) Row_Count
from ldb.f_problem	a11 
union
select 'ldb.d_calendar_date	a12 ' as Table_name, count(1) Row_Count
from ldb.f_problem	a11 
join	ldb.d_calendar_date	a12 
on (a11.opened_on_key = a12.row_key) 
union
select 'ldb.f_pm_rca_duration_c	a133 ' as Table_name, count(1) Row_Count
from ldb.f_problem	a11 
join	ldb.f_pm_rca_duration_c	a133 
on (a11.problem_key = a133.problem_key) 
union
select 'ldb.d_problem	a144 ' as Table_name, count(1) Row_Count
from ldb.f_problem	a11 
join	ldb.d_problem	a144 
on (a11.problem_key = a144.row_key) 
union
select 'ldb.d_calendar_year	a154 ' as Table_name, count(1) Row_Count
from ldb.f_problem	a11 
join	ldb.d_calendar_date	a12 
on (a11.opened_on_key = a12.row_key) 
join	ldb.d_calendar_year	a154 
on (a12.year_start_date_key = a154.row_key) 
union
select 'ldb.d_problem_state	a164 ' as Table_name, count(1) Row_Count
from ldb.f_problem	a11 
join	ldb.d_problem	a144 
on (a11.problem_key = a144.row_key) 
join	ldb.d_problem_state	a164 
on (a144.state_src_key = a164.row_key) 
union
select 'ldb.d_lov_problem_substatus_c	a177 ' as Table_name, count(1) Row_Count
from ldb.f_problem	a11 
join	ldb.d_problem	a144 
on (a11.problem_key = a144.row_key) 
join	ldb.d_lov_problem_substatus_c	a177 
on (a144.substatus_src_c_key = a177.row_key) 
union
select 'ldb.d_configuration_item	a13 ' as Table_name, count(1) Row_Count
from ldb.f_problem	a11 
join	ldb.d_configuration_item	a13 
on (a11.configuration_item_key = a13.row_key) 
union
select 'ldb.d_internal_contact_director_c	a14 ' as Table_name, count(1) Row_Count
from ldb.f_problem	a11 
join	ldb.d_configuration_item	a13 
on (a11.configuration_item_key = a13.row_key) 
join	ldb.d_internal_contact_director_c	a14 
on (a13.support_director_c_key = a14.row_key) 
union
select 'ldb.d_internal_contact_manager_c	a15 ' as Table_name, count(1) Row_Count
from ldb.f_problem	a11 
join	ldb.d_configuration_item	a13 
on (a11.configuration_item_key = a13.row_key) 
join	ldb.d_internal_contact_manager_c	a15 
on (a13.managed_by_c_key = a15.row_key) 
union
select 'ldb.d_internal_contact_vp_c	a16 ' as Table_name, count(1) Row_Count
from ldb.f_problem	a11 
join	ldb.d_configuration_item	a13 
on (a11.configuration_item_key = a13.row_key) 
join	ldb.d_internal_contact_vp_c	a16 
on (a13.vp_c_key = a16.row_key) 
union
select 'ldb.d_calendar_date	a17 ' as Table_name, count(1) Row_Count
from ldb.f_problem	a11 
join	ldb.d_calendar_date	a12 
on (a11.opened_on_key = a12.row_key) 
join	ldb.d_calendar_date	a17 
on (a12.month_start_date_key = a17.month_start_date_key) 
union
select 'ldb.d_calendar_year	a18 ' as Table_name, count(1) Row_Count
from ldb.f_problem	a11 
join	ldb.d_calendar_date	a12 
on (a11.opened_on_key = a12.row_key) join	ldb.d_calendar_date	a17 
on (a12.month_start_date_key = a17.month_start_date_key) 
join	ldb.d_calendar_year	a18 
on (a17.year_start_date_key = a18.row_key) 
union
select 'ldb.d_application_event_c	a19 ' as Table_name, count(1) Row_Count
from ldb.f_problem	a11 
join	ldb.d_application_event_c	a19 
on (a11.application_key= a19.row_key) 
union
select 'ldb.d_calendar_month	a110 ' as Table_name, count(1) Row_Count
from ldb.f_problem	a11 
join	ldb.d_calendar_date	a12 
on (a11.opened_on_key = a12.row_key) 
join	ldb.d_calendar_month	a110 
on (a12.month_start_date_key = a110.row_key) 
union
select 'ldb.d_problem	a111 ' as Table_name, count(1) Row_Count
from ldb.f_problem	a11 
join	ldb.d_calendar_date	a12 
on (a11.opened_on_key = a12.row_key) 
join	ldb.d_problem	a111 
on (a11.problem_key = a111.row_key) 