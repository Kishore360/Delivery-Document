/* Tables Accessed:
d_rita_application_c
d_site_c
f_rita_application_site_c_fact */


SELECT 'f_rita_application_site_c_fact' AS Table_NAME,Count(1) as CNT 
FROM ldb.f_rita_application_site_c_fact a11
UNION 
SELECT 'd_rita_application_c' AS Table_NAME,Count(1) as CNT 
FROM ldb.f_rita_application_site_c_fact a11
JOIN ldb.d_rita_application_c a12 ON a11.rita_application_c_key=a12.row_key
UNION 
SELECT 'd_location_site_c' AS Table_NAME,Count(1) as CNT 
FROM ldb.f_rita_application_site_c_fact a11
JOIN ldb.d_location_site_c a12 ON a11.countries_collected_c_key=a12.row_key



