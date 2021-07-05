SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_request_item.resolved_on_c' ELSE 'SUCCESS' END as Message 
FROM mcd_mdwdb.d_request_item trgt
RIGHT JOIN mcd_mdsdb.sc_req_item_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE CONVERT_TZ(src.u_resolved,'GMT','US/Central') <>resolved_on_c
;