SELECT 'f_request_task_closed' as Table_Name, count(a11.row_key) as Row_count
FROM ldb.f_request_task_closed a11
UNION 
select 'd_sc_task_state' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_request_task_closed  a11 
join ldb.d_sc_task_state a12 on (a11.state_src_key = a12.row_key)
UNION 
select 'd_sc_task_priority' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_request_task_closed a11 
join ldb.d_sc_task_priority a12 on (a11.priority_src_key= a12.row_key)
UNION 
select 'd_request_task' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_request_task_closed a11 
join ldb.d_request_task a12 on (a11.request_task_key= a12.row_key)
UNION 
select 'd_request_task_hold_type_c' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_request_task a12 on (a11.request_task_key= a12.row_key)
join ldb.d_request_task_hold_type_c a123 on (a12.hold_type_c_key=a123.row_key)
UNION 
select 'd_request_task_closure_code_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_request_task_closed a11
join ldb.d_request_task a12 on (a11.request_task_key = a12.row_key)
join ldb.d_request_task_closure_code_c a13 on (a12.closure_code_c_key = a13.row_key)
UNION 
SELECT 'd_request_item' as Table_Name,count(a11.row_key) as Row_count
FROM ldb.f_request_task_closed a11 
JOIN ldb.d_request_item a12 ON (a11.request_item_key=a12.row_key)
UNION 
SELECT 'd_internal_organization_group' as Table_Name,count(a11.row_key) as Row_count
FROM ldb.f_request_task_closed a11
JOIN ldb.d_internal_organization_group a12 ON (a11.assignment_group_key=a12.row_key)
UNION 
SELECT 'd_internal_organization_department' as Table_Name,count(a11.row_key) as Row_count
FROM ldb.f_request_task_closed a11 
JOIN ldb.d_internal_organization_department a12 ON (a11.opened_by_department_key=a12.row_key)
UNION 
SELECT 'd_internal_contact_assigned_to' as Table_Name,count(a11.row_key) as Row_count
FROM ldb.f_request_task_closed a11 
JOIN ldb.d_internal_contact_assigned_to a12 ON (a11.assigned_to_key=a12.row_key)
UNION 
select 'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
FROM ldb.f_request_task_closed a11
JOIN ldb.d_calendar_date a12  on (a11.closed_on_key = a12.row_key)
UNION 
select 'd_calendar_year' as Table_Name, count(a11.row_key) Row_Count
FROM ldb.f_request_task_closed a11
JOIN ldb.d_calendar_date a12  on (a11.closed_on_key = a12.row_key)
JOIN ldb.d_calendar_year a13 on (a12.year_start_date_key = a13.row_key)
UNION 
Select 'd_calendar_week' as Table_Name, count(a11.row_key) as Row_count
FROM ldb.f_request_task_closed a11
JOIN ldb.d_calendar_date a12 ON (a11.closed_on_key=a12.row_key)
JOIN ldb.d_calendar_week a13 ON (a12.week_start_date_key=a13.row_key)
UNION 
Select 'd_calendar_month' as Table_Name, count(a11.row_key) as Row_count
FROM ldb.f_request_task_closed a11
JOIN ldb.d_calendar_date a12 ON (a11.closed_on_key=a12.row_key)
JOIN ldb.d_calendar_month a13 ON (a12.month_start_date_key=a13.row_key)