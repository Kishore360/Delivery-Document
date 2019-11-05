select 'ldb.f_change_request a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
union
select 'ldb.d_internal_organization_group a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_organization_group a13
on (a11.assignment_group_key = a13.row_key)
union
select 'ldb.d_calendar_month a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
join ldb.d_calendar_month a14
on (a12.month_start_date_key = a14.row_key)
union
select 'ldb.d_calendar_quarter a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key) join ldb.d_calendar_month a14
on (a12.month_start_date_key = a14.row_key)
join ldb.d_calendar_quarter a15
on (a14.quarter_start_date_key = a15.row_key)
union
select 'ldb.d_change_request a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
union
select 'ldb.d_change_request_priority a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_priority a17
on (a11.priority_src_key = a17.row_key)
union
select 'ldb.d_change_request_risk a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_risk a18
on (a11.risk_src_key = a18.row_key)
union
select 'ldb.d_configuration_item a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_configuration_item a19
on (a11.configuration_item_key = a19.row_key)
union
select 'ldb.d_internal_contact_assigned_to a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_contact_assigned_to a110
on (a11.assigned_to_key = a110.row_key)
union
select 'ldb.d_calendar_week a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
join ldb.d_calendar_week a111
on (a12.week_start_date_key = a111.row_key)
union
select 'ldb.d_change_request_category a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_category a112
on (a11.category_src_key = a112.row_key)
union
select 'ldb.d_change_request_scope a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_scope a113
on (a11.scope_src_key = a113.row_key)
union
select 'ldb.d_change_request_state a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_state a114
on (a11.state_src_key = a114.row_key)
union
select 'ldb.d_change_request_type a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_type a115
on (a11.type_src_key = a115.row_key)
union
select 'ldb.d_internal_organization_department a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_organization_department a116
on (a11.requested_by_department_key = a116.row_key)
union
select 'ldb.d_calendar_year a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key) join ldb.d_calendar_month a14
on (a12.month_start_date_key = a14.row_key) join ldb.d_calendar_quarter a15
on (a14.quarter_start_date_key = a15.row_key)
join ldb.d_calendar_year a117
on (a15.year_start_date_key = a117.row_key)
