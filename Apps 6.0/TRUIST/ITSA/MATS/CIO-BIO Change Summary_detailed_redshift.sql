select 'ldb.f_change_request a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
union
select 'ldb.d_archer_application_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_archer_application_c a13
on (a11.application_archer_c_key = a13.row_key)
union
select 'ldb.d_calendar_month a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
join ldb.d_calendar_month a14
on (a12.month_start_date_key = a14.row_key)
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key)
union
select 'ldb.d_change_request a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
union
select 'ldb.d_change_request_state a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_state a17
on (a11.state_src_key = a17.row_key)
union
select 'ldb.d_change_request_type a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_type a18
on (a11.type_src_key = a18.row_key)