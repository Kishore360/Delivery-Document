SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_change_request.reason_src_key' ELSE 'SUCCESS' END as Message 
FROM mcd_mdwdb.f_change_request trgt
RIGHT JOIN mcd_mdsdb.change_request_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN mcd_mdwdb.d_lov lkp
ON COALESCE(CONCAT('REASON~CHANGE_REQUEST~~~',src.u_reason),'UNSPECIFIED') =lkp.row_id and src.sourceinstance = lkp.source_id
where COALESCE(lkp.row_key,CASE WHEN src.u_reason IS NULL THEN 0 else -1 end)<> trgt.reason_src_key
;