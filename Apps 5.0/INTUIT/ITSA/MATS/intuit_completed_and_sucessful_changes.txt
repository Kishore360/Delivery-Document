select 'ldb.f_change_request_closed a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date a12 
on (a11.closed_on_key = a12.row_key) 
union
select 'ldb.d_three_month_rolling a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date a12 
on (a11.closed_on_key = a12.row_key) 
join ldb.d_three_month_rolling a13 
on (a12.month_start_date_key = a13.this_month_key) 
union
select 'ldb.d_change_request a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request a14 
on (a11.change_request_key = a14.row_key) 
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
union
select 'ldb.dh_user_group_hierarchy a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
union
select 'ldb.d_three_week_rolling a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date a12 
on (a11.closed_on_key = a12.row_key) 
join ldb.d_three_week_rolling a17 
on (a12.week_start_date_key = a17.this_week_key) 
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date a12 
on (a11.closed_on_key = a12.row_key) 
join ldb.d_calendar_month a18 
on (a12.month_start_date_key = a18.row_key) 
union
select 'ldb.d_calendar_week a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date a12 
on (a11.closed_on_key = a12.row_key) 
join ldb.d_calendar_week a19 
on (a12.week_start_date_key = a19.row_key) 
union
select 'ldb.d_change_request_category a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_category a110 
on (a11.category_src_key = a110.row_key) 
union
select 'ldb.d_change_request_priority a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_priority a111 
on (a11.priority_src_key = a111.row_key) 
union
select 'ldb.d_change_request_risk a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_risk a112 
on (a11.risk_src_key = a112.row_key) 
union
select 'ldb.d_change_request_scope a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_scope a113 
on (a11.scope_src_key = a113.row_key) 
union
select 'ldb.d_change_request_type a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_type a114 
on (a11.type_src_key = a114.row_key) 
union
select 'ldb.d_configuration_item a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_configuration_item a115 
on (a11.configuration_item_key = a115.row_key) 
union
select 'ldb.d_internal_organization_department a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_organization_department a116 
on (a11.requested_by_department_key = a116.row_key) 
union
select 'ldb.d_calendar_month_three_rolling a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date a12 
on (a11.closed_on_key = a12.row_key) join ldb.d_three_month_rolling a13 
on (a12.month_start_date_key = a13.this_month_key) 
join ldb.d_calendar_month_three_rolling a117 
on (a13.rolling_three_month_key = a117.row_key) 
union
select 'ldb.dh_user_group_level1 a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level1 a118 
on (a16.lev_1_key = a118.row_key) 
union
select 'ldb.d_calendar_week_three_rolling a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date a12 
on (a11.closed_on_key = a12.row_key) join ldb.d_three_week_rolling a17 
on (a12.week_start_date_key = a17.this_week_key) 
join ldb.d_calendar_week_three_rolling a119 
on (a17.rolling_three_week_key = a119.row_key) 
union
select 'ldb.dh_user_group_level2 a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level2 a120 
on (a16.lev_2_key = a120.row_key) 
union
select 'ldb.dh_user_group_level3 a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level3 a121 
on (a16.lev_3_key = a121.row_key) 
union
select 'ldb.dh_user_group_level4 a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level4 a122 
on (a16.lev_4_key = a122.row_key) 