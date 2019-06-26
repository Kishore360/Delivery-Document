select 'ldb.n_request_task_io_snapshot_weekly_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_request_task_io_snapshot_weekly_c a11 
union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_request_task_io_snapshot_weekly_c a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) 
union
select 'ldb.d_calendar_week a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_request_task_io_snapshot_weekly_c a11 
join ldb.d_calendar_week a13 
on (a11.week_start_key = a13.row_key) 
union
select 'ldb.d_lov_request_task_variable_age_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_request_task_io_snapshot_weekly_c a11 
join ldb.d_lov_request_task_variable_age_c a14 
on (a11.age_key = a14.row_key) 
union
select 'ldb.d_sc_task_priority a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_request_task_io_snapshot_weekly_c a11 
join ldb.d_sc_task_priority a15 
on (a11.priority_src_key = a15.row_key) 
union
select 'ldb.d_sc_task_state a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_request_task_io_snapshot_weekly_c a11 
join ldb.d_sc_task_state a16 
on (a11.state_src_key = a16.row_key) 
union
select 'ldb.d_lov_request_task_security_task_type_src_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_request_task_io_snapshot_weekly_c a11 
join ldb.d_lov_request_task_security_task_type_src_c a17 
on (a11.security_task_type_src_c_key = a17.row_key) 
