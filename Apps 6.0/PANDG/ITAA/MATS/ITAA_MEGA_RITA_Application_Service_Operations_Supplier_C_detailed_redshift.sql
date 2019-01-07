/* Report: RITA Application Service Operations Supplier_C

Tables Accessed:
d_application_service_operations_supplier_c
d_rita_application_c
f_rita_application_service_operations_supplier_c_fact
 */
 
 
 
SELECT 'f_rita_application_service_operations_supplier_c_fact' AS Table_NAME,Count(1) as CNT 
FROM ldb.f_rita_application_service_operations_supplier_c_fact a11
UNION 
SELECT 'd_rita_application_c' AS Table_NAME,Count(1) as CNT 
FROM ldb.f_rita_application_service_operations_supplier_c_fact a11
JOIN ldb.d_rita_application_c a12 ON a11.rita_application_c_key=a12.row_key
UNION 
SELECT 'd_application_service_operations_supplier_c' AS Table_NAME,Count(1) as CNT 
FROM ldb.f_rita_application_service_operations_supplier_c_fact a11
JOIN ldb.d_application_service_operations_supplier_c a12 ON a11.application_service_operations_supplier_c_key=a12.row_key



