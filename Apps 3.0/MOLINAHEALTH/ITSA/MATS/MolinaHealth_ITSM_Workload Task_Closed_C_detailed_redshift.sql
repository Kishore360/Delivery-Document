SELECT 'f_task_c' as Table_Name,count(1) as Row_Count 
FROM ldb.f_task_c a 
UNION 
SELECT 'd_task' as Table_Name,count(1) as Row_Count 
FROM ldb.f_task_c a 
JOIN ldb.d_task b ON a.task_key=b.row_key
UNION 
SELECT 'd_task_type' as Table_Name,count(1) as Row_Count 
FROM ldb.f_task_c a 
JOIN ldb.d_task b ON a.task_key=b.row_key
JOIN ldb.d_task_type c ON b.task_type_src_key=c.row_key
UNION 
SELECT 'd_internal_organization_group' as Table_Name,count(1) as Row_Count 
FROM ldb.f_task_c a 
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
UNION 
SELECT 'd_internal_contact_assigned_to' as Table_Name,count(1) as Row_Count 
FROM ldb.f_task_c a 
JOIN ldb.d_internal_contact_assigned_to b ON a.assigned_to_key=b.row_key
UNION 
SELECT 'd_calendar_date' as Table_Name,count(1) as Row_Count 
FROM ldb.f_task_c a 
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key
UNION 
SELECT 'd_calendar_month' as Table_Name,count(1) as Row_Count 
FROM ldb.f_task_c a 
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
UNION 
SELECT 'd_calendar_quarter' as Table_Name,count(1) as Row_Count 
FROM ldb.f_task_c a 
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_quarter c ON b.quarter_start_date_key=b.row_key
UNION 
SELECT 'd_calendar_week' as Table_Name,count(1) as Row_Count 
FROM ldb.f_task_c a 
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_week c ON b.week_start_date_key=c.row_key
UNION 
SELECT 'd_calendar_year' as Table_Name,count(1) as Row_Count 
FROM ldb.f_task_c a 
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_year c ON b.year_start_date_key=c.row_key


