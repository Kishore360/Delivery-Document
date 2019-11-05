select 'ldb.f_problem_task a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
union
select 'ldb.d_internal_contact_director_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_internal_contact_director_c a13
on (a12.support_director_c_key = a13.row_key)
union
select 'ldb.d_internal_contact_manager_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_internal_contact_manager_c a14
on (a12.managed_by_c_key = a14.row_key)
union
select 'ldb.d_internal_contact_vp_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_internal_contact_vp_c a15
on (a12.vp_c_key = a15.row_key)
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_internal_organization_group a16
on (a11.assignment_group_key = a16.row_key)
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key)
union
select 'ldb.d_calendar_quarter a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key)
join ldb.d_calendar_quarter a19
on (a18.quarter_start_date_key = a19.row_key)
union
select 'ldb.d_calendar_year a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key) join ldb.d_calendar_quarter a19
on (a18.quarter_start_date_key = a19.row_key)
join ldb.d_calendar_year a110
on (a19.year_start_date_key = a110.row_key)
union
select 'ldb.d_problem a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem a111
on (a11.problem_key = a111.row_key)
union
select 'ldb.d_problem_task a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task a112
on (a11.problem_task_key = a112.row_key)
union
select 'ldb.d_problem_task_state a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task_state a113
on (a11.state_src_key = a113.row_key)
union
select 'ldb.d_application_event_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_application_event_c a114
on (a11.problem_application_c_key = a114.row_key)
union
select 'ldb.d_internal_contact_assigned_to a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_internal_contact_assigned_to a115
on (a11.assigned_to_key = a115.row_key)
union
select 'ldb.d_problem_priority a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_priority a116
on (a11.problem_priority_src_key = a116.row_key)
union
select 'ldb.d_problem_task_priority a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task_priority a117
on (a11.priority_src_key = a117.row_key)
union
select 'ldb.d_problem_state a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_state a118
on (a11.problem_state_src_key = a118.row_key)
union
select 'ldb.backlog_flag = '' ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
