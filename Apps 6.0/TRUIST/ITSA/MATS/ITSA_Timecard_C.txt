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
on (a11.date_key = a13.row_key)
union
select 'ldb.d_calendar_month a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key)
join ldb.d_calendar_month a14
on (a13.month_start_date_key = a14.row_key)
union
select 'ldb.d_calendar_quarter a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key) join ldb.d_calendar_month a14
on (a13.month_start_date_key = a14.row_key)
join ldb.d_calendar_quarter a15
on (a14.quarter_start_date_key = a15.row_key)
union
select 'ldb.d_internal_contact_mdm a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_internal_contact a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_contact_mdm a16
on (a12.employee_mdm_key = a16.row_key)
union
select 'ldb.d_project a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_project a17
on (a11.project_key = a17.row_key)
union
select 'ldb.d_task a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_task a18
on (a11.task_key = a18.row_key)
union
select 'ldb.d_cost_center a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_cost_center a19
on (a11.cost_center_key = a19.row_key)
union
select 'ldb.d_internal_organization_department a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_internal_organization_department a110
on (a11.department_key = a110.row_key)
union
select 'ldb.d_location a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_location a111
on (a11.location_key = a111.row_key)
union
select 'ldb.d_time_card_category a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_time_card_category a112
on (a11.category_src_key = a112.row_key)
union
select 'ldb.d_time_card_state a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_time_card_state a113
on (a11.state_src_key = a113.row_key)
union
select 'ldb.d_calendar_week a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key)
join ldb.d_calendar_week a114
on (a13.week_start_date_key = a114.row_key)
union
select 'ldb.d_task_state a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_task a18
on (a11.task_key = a18.row_key)
join ldb.d_task_state a115
on (a18.state_src_key = a115.row_key)
union
select 'ldb.d_task_type a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_task a18
on (a11.task_key = a18.row_key)
join ldb.d_task_type a116
on (a18.task_type_src_key = a116.row_key)
union
select 'ldb.d_calendar_year a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key) join ldb.d_calendar_month a14
on (a13.month_start_date_key = a14.row_key) join ldb.d_calendar_quarter a15
on (a14.quarter_start_date_key = a15.row_key)
join ldb.d_calendar_year a117
on (a15.year_start_date_key = a117.row_key)