SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_request_item.service_category_src_c_code' ELSE 'SUCCESS' END as Message 
FROM mcdonalds_mdwdb.d_request_item trgt
RIGHT JOIN mcdonalds_mdsdb.sc_req_item_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE src.u_service_category <> trgt.service_category_src_c_code
;
