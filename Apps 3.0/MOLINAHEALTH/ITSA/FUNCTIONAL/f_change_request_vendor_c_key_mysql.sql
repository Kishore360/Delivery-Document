SELECT 
-- src.sys_id,src.u_vendor,lkp.row_id,COALESCE(lkp.row_key,CASE WHEN src.u_vendor IS NULL THEN 0 else -1 end) as lkp_key,trgt.vendor_c_key
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.vendor_c_key' ELSE 'SUCCESS' END as Message
FROM molinahealth_mdsdb.change_request_final src 
LEFT JOIN molinahealth_mdwdb.f_change_request trgt ON src.sys_id = trgt.row_id AND src.sourceinstance = trgt.source_id
LEFT JOIN molinahealth_mdwdb.d_internal_organization lkp ON src.u_vendor = right(lkp.row_id,32) AND src.sourceinstance = lkp.source_id
WHERE COALESCE(lkp.row_key,CASE WHEN src.u_vendor IS NULL THEN 0 else -1 end) <> (trgt.vendor_c_key);