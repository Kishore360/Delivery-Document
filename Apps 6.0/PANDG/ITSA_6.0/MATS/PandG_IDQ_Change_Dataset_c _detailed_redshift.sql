SELECT 'f_change_request' AS Table_Name, Count(1) as CNT 
FROM ldb.f_change_request a
UNION 
SELECT 'd_configuration_item' AS Table_Name, Count(1) as CNT 
FROM ldb.f_change_request a
JOIN ldb.d_configuration_item b ON a.configuration_item_key=b.row_key
UNION 
SELECT 'd_change_request' AS Table_Name, Count(1) as CNT 
FROM ldb.f_change_request a
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key 
