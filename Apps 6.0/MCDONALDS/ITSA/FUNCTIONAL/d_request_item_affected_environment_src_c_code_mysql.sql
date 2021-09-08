SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_request_item.affected_environment_src_c_code' ELSE 'SUCCESS' END as Message 
FROM mcd_mdwdb.d_request_item trgt
RIGHT JOIN mcd_mdsdb.sc_req_item_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE src.u_affected_environment <> trgt.affected_environment_src_c_code
;