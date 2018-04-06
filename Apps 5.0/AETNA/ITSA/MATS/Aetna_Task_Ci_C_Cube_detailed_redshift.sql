SELECT 'f_task_ci_c' as Table_Name,count(a11.row_key) as Row_count
FROM ldb.f_task_ci_c a11 
UNION 
SELECT 'd_task' as Table_Name,count(a11.row_key) as Row_count
FROM ldb.f_task_ci_c a11 
JOIN ldb.d_task a12 
ON a11.task_key=a12.row_key
UNION
SELECT 'd_task_ci_c' as Table_Name,count(a11.row_key) as Row_count
FROM ldb.f_task_ci_c a11 
JOIN ldb.d_task_ci_c a13 
ON a11.task_ci_c_key=a13.row_key
UNION
SELECT 'd_configuration_item' as Table_Name,count(a11.row_key) as Row_count
FROM ldb.f_task_ci_c a11 
JOIN ldb.d_configuration_item a14 
ON a11.configuration_item_key=a14.row_key
UNION
SELECT 'd_task_type' as Table_Name,count(a11.row_key) as Row_count
FROM ldb.f_task_ci_c a11 
JOIN ldb.d_task a12 
ON a11.task_key=a12.row_key
JOIN ldb.d_task_type a15 
ON a12.task_type_src_key=a15.row_key
