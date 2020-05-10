select 'ldb.f_time_card a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_internal_contact a12
on (a11.employee_key = a12.row_key)
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_calendar_date a13
on (a11.timecard_on_key = a13.row_key)
union
select 'ldb.dh_employee_hierarchy a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_internal_contact a12
on (a11.employee_key = a12.row_key)
join ldb.dh_employee_hierarchy a14
on (a12.row_current_key = a14.lev_0_key)
union
select 'ldb.d_project a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_project a15
on (a11.project_key = a15.row_key)
union
select 'ldb.d_task a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_task a16
on (a11.task_key = a16.row_key)
union
select 'ldb.d_cost_center a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_cost_center a17
on (a11.cost_center_key = a17.row_key)
union
select 'ldb.d_internal_organization_department a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_internal_organization_department a18
on (a11.department_key = a18.row_key)
union
select 'ldb.d_internal_contact_mdm a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_internal_contact a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_contact_mdm a19
on (a12.row_current_key = a19.row_current_key)
union
select 'ldb.d_location a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_location a110
on (a11.location_key = a110.row_key)
union
select 'ldb.d_time_card_category a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_time_card_category a111
on (a11.category_src_key = a111.row_key)
union
select 'ldb.d_time_card_state a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_time_card_state a112
on (a11.state_src_key = a112.row_key)
union
select 'ldb.d_calendar_month a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_calendar_date a13
on (a11.timecard_on_key = a13.row_key)
join ldb.d_calendar_month a113
on (a13.month_start_date_key = a113.row_key)
union
select 'ldb.d_calendar_week a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_calendar_date a13
on (a11.timecard_on_key = a13.row_key)
join ldb.d_calendar_week a114
on (a13.week_start_date_key = a114.row_key)
union
select 'ldb.dh_employee_level1 a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_internal_contact a12
on (a11.employee_key = a12.row_key) join ldb.dh_employee_hierarchy a14
on (a12.row_current_key = a14.lev_0_key)
join ldb.dh_employee_level1 a115
on (a14.lev_1_key = a115.row_key)
union
select 'ldb.d_task_state a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_task a16
on (a11.task_key = a16.row_key)
join ldb.d_task_state a116
on (a16.state_src_key = a116.row_key)
union
select 'ldb.d_task_type a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_task a16
on (a11.task_key = a16.row_key)
join ldb.d_task_type a117
on (a16.task_type_src_key = a117.row_key)
union
select 'ldb.d_calendar_quarter a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_calendar_date a13
on (a11.timecard_on_key = a13.row_key)
join ldb.d_calendar_quarter a118
on (a13.quarter_start_date_key = a118.row_key)
union
select 'ldb.dh_employee_level2 a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_internal_contact a12
on (a11.employee_key = a12.row_key) join ldb.dh_employee_hierarchy a14
on (a12.row_current_key = a14.lev_0_key)
join ldb.dh_employee_level2 a119
on (a14.lev_2_key = a119.row_key)
union
select 'ldb.d_calendar_year a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_calendar_date a13
on (a11.timecard_on_key = a13.row_key)
join ldb.d_calendar_year a120
on (a13.year_start_date_key = a120.row_key)
union
select 'ldb.dh_employee_level3 a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_internal_contact a12
on (a11.employee_key = a12.row_key) join ldb.dh_employee_hierarchy a14
on (a12.row_current_key = a14.lev_0_key)
join ldb.dh_employee_level3 a121
on (a14.lev_3_key = a121.row_key)
union
select 'ldb.dh_employee_level4 a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_internal_contact a12
on (a11.employee_key = a12.row_key) join ldb.dh_employee_hierarchy a14
on (a12.row_current_key = a14.lev_0_key)
join ldb.dh_employee_level4 a122
on (a14.lev_4_key = a122.row_key)
union
select 'ldb.dh_employee_level5 a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_internal_contact a12
on (a11.employee_key = a12.row_key) join ldb.dh_employee_hierarchy a14
on (a12.row_current_key = a14.lev_0_key)
join ldb.dh_employee_level5 a123
on (a14.lev_5_key = a123.row_key)