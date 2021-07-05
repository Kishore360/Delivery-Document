SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.closure_code_src_c_key' ELSE 'SUCCESS' END as Message 
FROM mcd_mdwdb.d_change_request trgt
RIGHT JOIN mcd_mdsdb.change_request_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN mcd_mdwdb.d_lov lkp
ON COALESCE(CONCAT('CLOSURE_CODE_C~CHANGE_REQUEST~~~',src.u_closure_code),'UNSPECIFIED') =lkp.row_id and src.sourceinstance = lkp.source_id
where COALESCE(lkp.row_key,CASE WHEN src.u_closure_code IS NULL THEN 0 else -1 end)<> trgt.closure_code_src_c_key
;