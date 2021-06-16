/* 
Report: RITA Application Data Category_C

Tables Accessed:
d_data_category_c
d_rita_application_c
f_rita_application_data_category_c
 */

SELECT 'f_rita_application_data_category_c_fact' AS Table_NAME,Count(1) as CNT 
FROM ldb.f_rita_application_data_category_c_fact a11
UNION 
SELECT 'd_rita_application_c' AS Table_NAME,Count(1) as CNT 
FROM ldb.f_rita_application_data_category_c_fact a11
JOIN ldb.d_rita_application_c a12 ON a11.rita_application_c_key=a12.row_key
UNION 
SELECT 'd_data_category_c' AS Table_NAME,Count(1) as CNT 
FROM ldb.f_rita_application_data_category_c_fact a11
JOIN ldb.d_data_category_c a12 ON a11.data_category_c_key=a12.row_key





