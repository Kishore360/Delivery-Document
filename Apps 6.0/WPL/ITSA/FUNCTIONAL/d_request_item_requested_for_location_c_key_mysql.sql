SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_request_item.requested_for_location_c_key' 
ELSE 'SUCCESS' END as Message 
FROM  wpl_mdsdb.sc_req_item_final src
join wpl_mdwdb.d_request_item d_request_item 
on src.sys_id=d_request_item.row_id and src.sourceinstance=d_request_item.source_id  
INNER JOIN wpl_mdwdb.f_request_item f_request_item 
ON d_request_item.row_key=f_request_item.request_item_key  
INNER JOIN wpl_mdwdb.d_internal_contact d_internal_contact 
ON f_request_item.requested_for_key=d_internal_contact.row_key  
WHERE d_request_item.requested_for_location_c_key<>d_internal_contact.location_key;
