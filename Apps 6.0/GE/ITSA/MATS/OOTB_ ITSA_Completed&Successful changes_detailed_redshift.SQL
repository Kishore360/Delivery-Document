select 'ldb.f_change_request_closed a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
union
select 'ldb.d_three_month_rolling a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
join ldb.d_three_month_rolling a13
on (a12.month_start_date_key = a13.this_month_key)
union
select 'ldb.d_three_week_rolling a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
join ldb.d_three_week_rolling a14
on (a12.week_start_date_key = a14.this_week_key)
union
select 'ldb.d_change_request a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key)
union
select 'ldb.d_change_date a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_date a16
on (a11.change_date_key = a16.row_key)
union
select 'ldb.d_change_configuration_item a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key)
join ldb.d_change_configuration_item a17
on (a15.configuration_item_key = a17.row_key)
union
select 'ldb.d_change_request_assignment_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key)
join ldb.d_change_request_assignment_group a18
on (a15.assignment_group_key = a18.row_key)
union
select 'ldb.d_h_change_assignment_group a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key) join ldb.d_change_request_assignment_group a18
on (a15.assignment_group_key = a18.row_key)
join ldb.d_h_change_assignment_group a19
on (a18.group_hierarchy_key = a19.row_key)
union
select 'ldb.d_change_calendar_month a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_date a16
on (a11.change_date_key = a16.row_key)
join ldb.d_change_calendar_month a110
on (a16.month_start_date_key = a110.row_key)
union
select 'ldb.d_change_calendar_week a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_date a16
on (a11.change_date_key = a16.row_key)
join ldb.d_change_calendar_week a111
on (a16.week_start_date_key = a111.row_key)
union
select 'ldb.d_change_request_category a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_category a112
on (a11.category_src_key = a112.row_key)
union
select 'ldb.d_change_configuration_item_mdm a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key) join ldb.d_change_configuration_item a17
on (a15.configuration_item_key = a17.row_key)
join ldb.d_change_configuration_item_mdm a113
on (a17.mdm_key = a113.row_key)
union
select 'ldb.d_change_department a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_department a114
on (a11.change_department_key = a114.row_key)
union
select 'ldb.d_change_request_priority a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_priority a115
on (a11.priority_src_key = a115.row_key)
union
select 'ldb.d_change_request_risk a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_risk a116
on (a11.risk_src_key = a116.row_key)
union
select 'ldb.d_change_request_scope a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_scope a117
on (a11.scope_src_key = a117.row_key)
union
select 'ldb.d_change_request_type a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_type a118
on (a11.type_src_key = a118.row_key)
union
select 'ldb.d_calendar_month_three_rolling a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key) join ldb.d_three_month_rolling a13
on (a12.month_start_date_key = a13.this_month_key)
join ldb.d_calendar_month_three_rolling a119
on (a13.rolling_three_month_key = a119.row_key)
union
select 'ldb.d_calendar_week_three_rolling a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key) join ldb.d_three_week_rolling a14
on (a12.week_start_date_key = a14.this_week_key)
join ldb.d_calendar_week_three_rolling a120
on (a14.rolling_three_week_key = a120.row_key)
union
select 'ldb.d_change_assignment_group_level_1 a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key) join ldb.d_change_request_assignment_group a18
on (a15.assignment_group_key = a18.row_key) join ldb.d_h_change_assignment_group a19
on (a18.group_hierarchy_key = a19.row_key)
join ldb.d_change_assignment_group_level_1 a121
on (a19.group_level_1_key = a121.row_key)
union
select 'ldb.d_change_assignment_group_level_2 a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key) join ldb.d_change_request_assignment_group a18
on (a15.assignment_group_key = a18.row_key) join ldb.d_h_change_assignment_group a19
on (a18.group_hierarchy_key = a19.row_key)
join ldb.d_change_assignment_group_level_2 a122
on (a19.group_level_2_key = a122.row_key)
union
select 'ldb.d_change_assignment_group_level_3 a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key) join ldb.d_change_request_assignment_group a18
on (a15.assignment_group_key = a18.row_key) join ldb.d_h_change_assignment_group a19
on (a18.group_hierarchy_key = a19.row_key)
join ldb.d_change_assignment_group_level_3 a123
on (a19.group_level_3_key = a123.row_key)
union
select 'ldb.d_change_assignment_group_level_4 a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key) join ldb.d_change_request_assignment_group a18
on (a15.assignment_group_key = a18.row_key) join ldb.d_h_change_assignment_group a19
on (a18.group_hierarchy_key = a19.row_key)
join ldb.d_change_assignment_group_level_4 a124
on (a19.group_level_4_key = a124.row_key)