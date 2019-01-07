/* RITA Application Business Process Fact . 

Fact: f_rita_application_business_process_c_fact
Dimension1: d_rita_application_c
Dimension2: d_business_process_c
 */

SELECT 'f_rita_application_business_process_c_fact' AS Table_NAME,Count(1) as CNT 
FROM ldb.f_rita_application_business_process_c_fact a11
UNION 
SELECT 'd_rita_application_c' AS Table_NAME,Count(1) as CNT 
FROM ldb.f_rita_application_business_process_c_fact a11
JOIN ldb.d_rita_application_c a12 ON a11.rita_application_c_key=a12.row_key
UNION 
SELECT 'd_business_process_c' AS Table_NAME,Count(1) as CNT 
FROM ldb.f_rita_application_business_process_c_fact a11
JOIN ldb.d_business_process_c a12 ON a11.business_process_c_key=a12.row_key




