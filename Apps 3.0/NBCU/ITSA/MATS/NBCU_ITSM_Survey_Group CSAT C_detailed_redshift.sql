
select 'ldb.f_task_response_assign_group_csat_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_response_assign_group_csat_c a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_response_assign_group_csat_c a11 
join ldb.d_calendar_date a12 
on (a11.requested_on_key = a12.row_key) 
union
select 'ldb.d_internal_organization_group a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_response_assign_group_csat_c a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) 
union
select 'ldb.d_calendar_month a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_response_assign_group_csat_c a11 
join ldb.d_calendar_date a12 
on (a11.requested_on_key = a12.row_key) 
join ldb.d_calendar_month a14 
on (a12.month_start_date_key = a14.row_key) 
