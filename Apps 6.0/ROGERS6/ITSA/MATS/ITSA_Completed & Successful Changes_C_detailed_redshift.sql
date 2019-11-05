select 'ldb.f_change_request_closed a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
union
select 'ldb.d_three_week_rolling a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
join ldb.d_three_week_rolling a13
on (a12.week_start_date_key = a13.this_week_key)
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key)
union
select 'ldb.d_three_month_rolling a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
join ldb.d_three_month_rolling a15
on (a12.month_start_date_key = a15.this_month_key)
union
select 'ldb.d_calendar_month a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
join ldb.d_calendar_month a16
on (a12.month_start_date_key = a16.row_key)
union
select 'ldb.d_calendar_week a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
join ldb.d_calendar_week a17
on (a12.week_start_date_key = a17.row_key)
union
select 'ldb.d_change_request_category a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_category a18
on (a11.category_src_key = a18.row_key)
union
select 'ldb.d_change_request_priority a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_priority a19
on (a11.priority_src_key = a19.row_key)
union
select 'ldb.d_change_request_risk a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_risk a110
on (a11.risk_src_key = a110.row_key)
union
select 'ldb.d_change_request_scope a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_scope a111
on (a11.scope_src_key = a111.row_key)
union
select 'ldb.d_change_request_type a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_type a112
on (a11.type_src_key = a112.row_key)
union
select 'ldb.d_configuration_item a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_configuration_item a113
on (a11.configuration_item_key = a113.row_key)
union
select 'ldb.d_internal_organization_department a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_organization_department a114
on (a11.requested_by_department_key = a114.row_key)
union
select 'ldb.d_calendar_week_three_rolling a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key) join ldb.d_three_week_rolling a13
on (a12.week_start_date_key = a13.this_week_key)
join ldb.d_calendar_week_three_rolling a115
on (a13.rolling_three_week_key = a115.row_key)
union
select 'ldb.d_calendar_month_three_rolling a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key) join ldb.d_three_month_rolling a15
on (a12.month_start_date_key = a15.this_month_key)
join ldb.d_calendar_month_three_rolling a116
on (a15.rolling_three_month_key = a116.row_key)
