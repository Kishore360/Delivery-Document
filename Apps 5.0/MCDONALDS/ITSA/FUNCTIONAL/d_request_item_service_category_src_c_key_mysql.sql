SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_request_item.service_category_src_c_key' ELSE 'SUCCESS' END as Message 
FROM mcdonalds_mdwdb.d_request_item trgt
RIGHT JOIN mcdonalds_mdsdb.sc_req_item_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN mcdonalds_mdwdb.d_lov lkp
ON COALESCE(CONCAT('SERVICE_CATEGORY_C~REQUEST_ITEM~~~',src.u_service_category),'UNSPECIFIED') =lkp.row_id and src.sourceinstance = lkp.source_id
where COALESCE(lkp.row_key,CASE WHEN src.u_service_category IS NULL THEN 0 else -1 end)<> trgt.service_category_src_c_key
;