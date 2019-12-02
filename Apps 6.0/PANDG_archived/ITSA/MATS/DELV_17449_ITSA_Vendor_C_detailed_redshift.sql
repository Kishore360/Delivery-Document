/* d_lov_vendor_level_c
d_vendor
f_vendor_fact_c */

SELECT 'f_vendor_fact_c' AS Table_Name, Count(1) as ROW_COUNT
FROM ldb.f_vendor_fact_c a 
UNION 
SELECT 'd_vendor' AS Table_Name, Count(1) as ROW_COUNT
FROM ldb.f_vendor_fact_c a 
JOIN ldb.d_vendor_c b ON a.vendor_key=b.row_key
UNION 
SELECT 'd_lov_vendor_level_c' AS Table_Name, Count(1) as ROW_COUNT
FROM ldb.f_vendor_fact_c a 
JOIN ldb.d_vendor_c b ON a.vendor_key=b.row_key
JOIN ldb.d_lov_vendor_level_c c ON b.vendor_level_c_key=c.row_key
