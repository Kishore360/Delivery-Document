SELECT 
 CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.location_key' ELSE 'SUCCESS' END as Message
FROM molinahealth_mdsdb.sc_req_item_final src 
LEFT JOIN molinahealth_mdwdb.f_request_item trgt ON src.sys_id = trgt.row_id AND src.sourceinstance = trgt.source_id
LEFT JOIN molinahealth_mdwdb.d_location lkp ON src.location = lkp.row_id AND src.sourceinstance = lkp.source_id
WHERE COALESCE(lkp.row_key,CASE WHEN src.location IS NULL THEN 0 else -1 end) <> (trgt.location_key);