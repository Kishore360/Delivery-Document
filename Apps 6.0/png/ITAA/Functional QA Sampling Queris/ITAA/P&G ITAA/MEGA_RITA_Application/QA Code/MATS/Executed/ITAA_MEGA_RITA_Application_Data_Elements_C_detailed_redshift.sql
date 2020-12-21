/* Report: RITA Application Data Elements_C

Tables Accessed:
d_png_ot_data_elements_collected_c
d_rita_application_c
f_rita_application_data_elements_c_fact
 */

SELECT 'f_rita_application_data_elements_c_fact' AS Table_NAME,Count(1) as CNT 
FROM ldb.f_rita_application_data_elements_c_fact a11
UNION 
SELECT 'd_rita_application_c' AS Table_NAME,Count(1) as CNT 
FROM ldb.f_rita_application_data_elements_c_fact a11
JOIN ldb.d_rita_application_c a12 ON a11.rita_application_c_key=a12.row_key
UNION 
SELECT 'd_png_ot_data_elements_collected_c' AS Table_NAME,Count(1) as CNT 
FROM ldb.f_rita_application_data_elements_c_fact a11
JOIN ldb.d_png_ot_data_elements_collected_c a12 ON a11.png_ot_data_elements_collected_c_key=a12.row_key


