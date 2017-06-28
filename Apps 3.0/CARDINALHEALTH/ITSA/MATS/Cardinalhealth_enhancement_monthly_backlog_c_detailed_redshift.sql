select 'ldb.f_enhancement_monthly_backlog_c a11 ' as Table_name, count(1) Row_Count
from ldb.f_enhancement_monthly_backlog_c a11 
union
select 'ldb.d_lov_rm_enhancement_state_c a12 ' as Table_name, count(1) Row_Count
from ldb.f_enhancement_monthly_backlog_c a11 
join ldb.d_lov_rm_enhancement_state_c a12 
on (a11.state_src_key = a12.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a13 ' as Table_name, count(1) Row_Count
from ldb.f_enhancement_monthly_backlog_c a11 
join ldb.d_internal_contact_assigned_to a13 
on (a11.assigned_to_key = a13.row_key) 
union
select 'ldb.d_calendar_month a14 ' as Table_name, count(1) Row_Count
from ldb.f_enhancement_monthly_backlog_c a11 
join ldb.d_calendar_month a14 
on (a11.calendar_month_start_date_key = a14.row_key) 
union
select 'ldb.d_task_impact a15 ' as Table_name, count(1) Row_Count
from ldb.f_enhancement_monthly_backlog_c a11 
join ldb.d_task_impact a15 
on (a11.impact_src_key = a15.row_key) 
union
select 'ldb.d_task_priority a16 ' as Table_name, count(1) Row_Count
from ldb.f_enhancement_monthly_backlog_c a11 
join ldb.d_task_priority a16 
on (a11.priority_src_key = a16.row_key) 
union
select 'ldb.d_task_urgency a17 ' as Table_name, count(1) Row_Count
from ldb.f_enhancement_monthly_backlog_c a11 
join ldb.d_task_urgency a17 
on (a11.urgency_src_key = a17.row_key) 