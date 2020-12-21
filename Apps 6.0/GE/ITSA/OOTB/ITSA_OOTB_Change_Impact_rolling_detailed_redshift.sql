select 'ldb.f_caused_by_change a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
union
select 'ldb.d_calendar_rolling_days a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_calendar_rolling_days a12
on (a11.date_key = a12.current_date_key)
union
select 'ldb.d_application a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_application a13
on (a11.application_key = a13.row_key)
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key)
union
select 'ldb.d_change_failure a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_change_failure a15
on (a11.change_failure_key = a15.row_key)
union
select 'ldb.d_configuration_item a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_configuration_item a16
on (a11.configuration_item_key = a16.row_key)
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
union
select 'ldb.d_change_request a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_change_request a18
on (a11.change_request_key = a18.row_key)
union
select 'ldb.d_configuration_item_mdm a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_configuration_item a16
on (a11.configuration_item_key = a16.row_key)
join ldb.d_configuration_item_mdm a19
on (a16.mdm_key = a19.row_key)
union
select 'ldb.d_application_mdm a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_application a13
on (a11.application_key = a13.row_key)
join ldb.d_application_mdm a110
on (a13.mdm_key = a110.row_key)
union
select 'ldb.d_assignment_group_leader a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key)
join ldb.d_assignment_group_leader a111
on (a14.assignment_group_leader_key = a111.row_key)
union
select 'ldb.d_internal_organization_department a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_internal_organization_department a112
on (a11.requested_by_department_key = a112.row_key)
union
select 'ldb.d_calendar_date_rolling a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_calendar_rolling_days a12
on (a11.date_key = a12.current_date_key)
join ldb.d_calendar_date_rolling a113
on (a12.rolling_date_key = a113.row_key)
union
select 'ldb.d_calendar_month a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
join ldb.d_calendar_month a114
on (a17.month_start_date_key = a114.row_key)