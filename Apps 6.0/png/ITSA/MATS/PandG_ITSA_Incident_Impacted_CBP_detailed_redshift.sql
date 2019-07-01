SELECT 'f_task_cbp_c_incident' AS Row_Count,Count(1) AS Row_Count 
FROM ldb.f_task_cbp_c_incident a
UNION 
SELECT 'd_incident' AS Row_Count,Count(1) AS Row_Count 
FROM ldb.f_task_cbp_c_incident a 
JOIN ldb.d_incident b ON a.incident_cbp_c_key=b.row_key
UNION 
SELECT 'd_configuration_item_business_service_cbp_c' AS Row_Count,Count(1) AS Row_Count 
FROM ldb.f_task_cbp_c_incident a 
JOIN ldb.d_configuration_item_business_service_cbp_c b ON a.cbp_ci_business_process_c_key=b.row_key