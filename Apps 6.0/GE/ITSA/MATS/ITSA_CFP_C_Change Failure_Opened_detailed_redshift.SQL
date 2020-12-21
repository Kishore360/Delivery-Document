select 'ldb.f_change_failure_opened a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
union
select 'ldb.d_change_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
join ldb.d_change_date a12
on (a11.change_date_key = a12.row_key)
union
select 'ldb.d_change_failure a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
join ldb.d_change_failure a13
on (a11.change_failure_key = a13.row_key)
union
select 'ldb.d_change_request a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key)
union
select 'ldb.d_change_configuration_item a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key)
join ldb.d_change_configuration_item a15
on (a14.configuration_item_key = a15.row_key)
union
select 'ldb.d_change_configuration_item_mdm a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key) join ldb.d_change_configuration_item a15
on (a14.configuration_item_key = a15.row_key)
join ldb.d_change_configuration_item_mdm a16
on (a15.mdm_key = a16.row_key)
union
select 'ldb.d_change_calendar_month a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
join ldb.d_change_date a12
on (a11.change_date_key = a12.row_key)
join ldb.d_change_calendar_month a17
on (a12.month_start_date_key = a17.row_key)
union
select 'ldb.d_change_internal_contact_assigned_to a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key)
join ldb.d_change_internal_contact_assigned_to a18
on (a14.assigned_to_key = a18.row_key)
union
select 'ldb.d_change_request_assignment_group a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key)
join ldb.d_change_request_assignment_group a19
on (a14.assignment_group_key = a19.row_key)
union
select 'ldb.d_change_ci_company_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key) join ldb.d_change_configuration_item a15
on (a14.configuration_item_key = a15.row_key)
join ldb.d_change_ci_company_c a110
on (a15.ci_company_c_key = a110.row_key)
union
select 'ldb.d_change_request_close_code a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key)
join ldb.d_change_request_close_code a111
on (a14.close_code_src_key = a111.row_key)
union
select 'ldb.d_change_request_state a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
join ldb.d_change_request_state a112
on (a11.change_state_src_key = a112.row_key)
union
select 'ldb.d_change_failure_probability a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key)
join ldb.d_change_failure_probability a113
on (a14.change_request_key_fp = a113.change_request_key)