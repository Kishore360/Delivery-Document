SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_request_item.situation_src_c_code' ELSE 'SUCCESS' END as Message 
FROM mcdonalds_mdwdb.d_request_item trgt
RIGHT JOIN mcdonalds_mdsdb.sc_req_item_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE src.u_situation <> trgt.situtation_src_c_code
;