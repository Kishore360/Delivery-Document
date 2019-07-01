/* f_avail_psat_art_c
d_configuration_item
d_calendar_date_fiscal
d_lov_install_status_website_c */


SELECT 'f_avail_psat_art_c' AS Table_Name,Count(1) as CNT 
FROM ldb.f_avail_psat_art_c a 
UNION 
SELECT 'd_configuration_item' AS Table_Name,Count(1) as CNT 
FROM ldb.f_avail_psat_art_c a 
JOIN ldb.d_configuration_item b ON a.configuration_item_key=b.row_key
UNION 
SELECT 'd_calendar_date_fiscal' AS Table_Name,Count(1) as CNT 
FROM ldb.f_avail_psat_art_c a 
JOIN ldb.d_calendar_date_fiscal b ON a.date_key=b.row_key 
UNION 
SELECT 'd_lov_install_status_website_c' AS Table_Name,Count(1) as CNT 
FROM ldb.f_avail_psat_art_c a 
JOIN ldb.d_lov_install_status_website_c b ON a.cmdb_ci_install_status_c_key=b.row_key 




