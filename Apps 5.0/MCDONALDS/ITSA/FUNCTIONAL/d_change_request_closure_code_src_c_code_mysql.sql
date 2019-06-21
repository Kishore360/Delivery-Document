SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.closure_code_src_c_code' ELSE 'SUCCESS' END as Message 
FROM mcdonalds_mdwdb.d_change_request trgt
RIGHT JOIN mcdonalds_mdsdb.change_request_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE src.u_closure_code <> trgt.closure_code_src_c_code
;