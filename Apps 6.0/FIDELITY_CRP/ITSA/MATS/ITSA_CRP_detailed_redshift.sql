select 'ldb.f_change_failure a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
union
select 'ldb.d_change_failure a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
join ldb.d_change_failure a13
on (a11.change_failure_key = a13.row_key)
union
select 'ldb.d_configuration_item a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
join ldb.d_configuration_item a14
on (a11.ci_key = a14.row_key)
union
select 'ldb.d_configuration_item_mdm a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
join ldb.d_configuration_item a14
on (a11.ci_key = a14.row_key)
join ldb.d_configuration_item_mdm a15
on (a14.mdm_key = a15.row_key)
union
select 'ldb.d_change_request a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
union
select 'ldb.d_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
join ldb.d_internal_contact_assigned_to a17
on (a11.assigned_to_key = a17.row_key)
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
join ldb.d_internal_organization_group a18
on (a11.assignment_group_key = a18.row_key)
union
select 'ldb.d_calendar_month a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
join ldb.d_calendar_month a19
on (a12.month_start_date_key = a19.row_key)
union
select 'ldb.d_change_request_state a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
join ldb.d_change_request_state a110
on (a11.change_state_src_key = a110.row_key)
union
select 'ldb.d_change_request_close_code a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
join ldb.d_change_request_close_code a111
on (a16.close_code_src_key = a111.row_key)