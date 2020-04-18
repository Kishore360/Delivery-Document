SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_request_item.requested_for_region_c' 
ELSE 'SUCCESS' END as Message 
FROM  wpl_mdsdb.sc_req_item_final src
join wpl_mdwdb.d_request_item d_request_item 
on src.sys_id=d_request_item.row_id and src.sourceinstance=d_request_item.source_id     
INNER JOIN wpl_mdwdb.d_location d_location 
ON d_request_item.requested_for_location_c_key=d_location.row_key  
LEFT OUTER JOIN wpl_mdwdb.d_location_country_c d_location_country_c 
ON d_location.location_country_c_key=d_location_country_c.row_key  
LEFT OUTER JOIN wpl_mdwdb.d_region_lkp_c d_region_lkp_c 
ON d_location_country_c.region_lkp_c_key=d_region_lkp_c.row_key  
WHERE d_request_item.requested_for_region_c<>coalesce(d_region_lkp_c.name,'UNSPECIFIED');
