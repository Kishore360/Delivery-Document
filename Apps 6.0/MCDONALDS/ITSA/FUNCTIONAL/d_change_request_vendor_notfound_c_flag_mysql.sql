SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.vendor_notfound_c_flag' ELSE 'SUCCESS' END as Message 
FROM mcd_mdwdb.d_change_request trgt
RIGHT JOIN mcd_mdsdb.change_request_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE CASE WHEN src.u_vendor_notfound = 1 THEN 'Y' ELSE 'N' END  <>vendor_notfound_c_flag
;