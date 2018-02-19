SELECT 'f_it_hardware_requests_c' as Table_Name,count(1) as Row_count
FROM ldb.f_it_hardware_requests_c a
UNION 
SELECT 'd_request_item' as Table_Name,count(1) as Row_count
FROM ldb.f_it_hardware_requests_c a
JOIN ldb.d_request_item b ON a.request_item_key=b.row_key
UNION 
SELECT 'd_it_hardware_requests_c' as Table_Name,count(1) as Row_count
FROM ldb.f_it_hardware_requests_c a
JOIN ldb.d_it_hardware_requests_c b ON a.it_hardware_requests_c_key=b.row_key 


