SELECT 'f_task_cbp_c_problem' AS Row_Count,Count(1) AS Row_Count 
FROM ldb.f_task_cbp_c_problem a
UNION 
SELECT 'd_problem' AS Row_Count,Count(1) AS Row_Count 
FROM ldb.f_task_cbp_c_problem a 
JOIN ldb.d_problem b ON a.cbp_problem_c_key=b.row_key
UNION 
SELECT 'd_configuration_item_business_service_cbp_c' AS Row_Count,Count(1) AS Row_Count 
FROM ldb.f_task_cbp_c_problem a 
JOIN ldb.d_configuration_item_business_service_cbp_c b ON a.cbp_ci_business_process_c_key=b.row_key