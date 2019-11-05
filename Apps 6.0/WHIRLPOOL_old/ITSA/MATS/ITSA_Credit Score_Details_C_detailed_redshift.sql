select 'ldb.f_task_assignment_group_details_c	a11' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_assignment_group_details_c	a11
union
select 'ldb.d_calendar_date	a12' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_assignment_group_details_c	a11
join ldb.d_calendar_date	a12
on (a11.day_key = a12.row_key)
union
select 'ldb.d_change_request	a13' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_assignment_group_details_c	a11
join ldb.d_change_request	a13
on (a11.change_request_key = a13.row_key)
union
select 'ldb.d_incident	a14' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_assignment_group_details_c	a11
join ldb.d_incident	a14
on (a11.incident_key = a14.row_key)
union
select 'ldb.d_calendar_week	a15' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_assignment_group_details_c	a11
join ldb.d_calendar_date	a12
on (a11.day_key = a12.row_key)
join ldb.d_calendar_week	a15
on (a12.week_start_date_key = a15.row_key)
union
select 'ldb.d_problem	a16' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_assignment_group_details_c	a11
join ldb.d_problem	a16
on (a11.problem_key = a16.row_key)
union
select 'ldb.d_internal_contact_assigned_to	a17' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_assignment_group_details_c	a11
join ldb.d_internal_contact_assigned_to	a17
on (a11.assigned_to_key = a17.row_key)
union
select 'ldb.d_internal_organization_group	a18' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_assignment_group_details_c	a11
join ldb.d_internal_organization_group	a18
on (a11.assignment_group_key = a18.row_key)
union
select 'ldb.d_change_request_caused_by	a19' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_assignment_group_details_c	a11
join ldb.d_change_request_caused_by	a19
on (a11.caused_by_change_key = a19.row_key)
union
select 'ldb.d_task_priority	a110' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_assignment_group_details_c	a11
join ldb.d_task_priority	a110
on (a11.priority_src_key = a110.row_key)
union
select 'ldb.d_calendar_month	a111' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_assignment_group_details_c	a11
join ldb.d_calendar_date	a12
on (a11.day_key = a12.row_key)
join ldb.d_calendar_month	a111
on (a12.month_start_date_key = a111.row_key)
