SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_ad_hoc_request_c.sd_touched_flag' ELSE 'SUCCESS' END as Message 
FROM whirlpool_mdsdb.u_ad_hoc_request_final  SRC 
JOIN whirlpool_mdwdb.d_ad_hoc_request_c TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
 WHERE (CASE WHEN SRC.u_sd_touched = 1 then 'Y' else 'N' END) <> (TRGT.sd_touched_flag) and SRC.cdctype='X'
