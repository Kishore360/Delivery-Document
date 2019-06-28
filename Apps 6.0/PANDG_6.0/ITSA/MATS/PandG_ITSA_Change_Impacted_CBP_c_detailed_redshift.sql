SELECT 'f_task_cbp_c_change_request' AS Row_Count,Count(1) AS Row_Count 
FROM ldb.f_task_cbp_c_change_request a
UNION 
SELECT 'd_change_request' AS Row_Count,Count(1) AS Row_Count 
FROM ldb.f_task_cbp_c_change_request a 
JOIN ldb.d_change_request b ON a.cbp_change_request_c_key=b.row_key
UNION 
SELECT 'd_configuration_item_business_service_cbp_c' AS Row_Count,Count(1) AS Row_Count 
FROM ldb.f_task_cbp_c_change_request a 
JOIN ldb.d_configuration_item_business_service_cbp_c b ON a.cbp_ci_business_process_c_key=b.row_key