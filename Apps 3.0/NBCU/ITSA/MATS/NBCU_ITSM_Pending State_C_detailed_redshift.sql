
select 'ldb.f_incident_pending_state_activity_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_pending_state_activity_c a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_pending_state_activity_c a11 
join ldb.d_calendar_date a12 
on (a11.pending_state_assigned_on_key = a12.row_key) 
union
select 'ldb.d_incident_pending_state_current_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_pending_state_activity_c a11 
join ldb.d_incident_pending_state_current_c a13 
on (a11.current_pending_state_key = a13.row_key) 
union
select 'ldb.d_inc_ritm_state_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_pending_state_activity_c a11 
join ldb.d_inc_ritm_state_c a14 
on (a11.current_state_key = a14.row_key) 
union
select 'ldb.d_incident_pending_state_new_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_pending_state_activity_c a11 
join ldb.d_incident_pending_state_new_c a15 
on (a11.to_pending_state_key = a15.row_key) 
union
select 'ldb.d_incident_pending_state_old_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_pending_state_activity_c a11 
join ldb.d_incident_pending_state_old_c a16 
on (a11.from_pending_state_key = a16.row_key) 
union
select 'ldb.d_task_ra_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_pending_state_activity_c a11 
join ldb.d_task_ra_c a17 
on (a11.task_ra_c_key = a17.row_key) 
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_pending_state_activity_c a11 
join ldb.d_calendar_date a12 
on (a11.pending_state_assigned_on_key = a12.row_key) 
join ldb.d_calendar_month a18 
on (a12.month_start_date_key = a18.row_key) 

