SELECT 'ldb.n_task_monthly_c' AS Table_Name,Count (a.row_key) as Row_count
FROM ldb.n_task_monthly_c a 
UNION 
SELECT 'ldb.n_task_monthly_c' AS Table_Name,Count (a.row_key) as Row_count
FROM ldb.n_task_monthly_c a 
 join        ldb.d_task           a12
 on         (a.task_key = a12.row_key)
UNION 
SELECT 'ldb.d_rm_defect_c' AS Table_Name,Count (a.row_key) as Row_count
FROM ldb.n_task_monthly_c a 
join        ldb.d_calendar_date      a13
 on         (a.n_key = a13.row_key)
UNION 
SELECT 'ldb.d_internal_organization_group' AS Table_Name, Count(a.row_key) as Row_Count 
FROM ldb.n_task_monthly_c a
join        ldb.d_internal_organization_group         a14
on         (a.assignment_group_key = a14.row_key)