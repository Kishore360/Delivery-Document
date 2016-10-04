SELECT  CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.correlation_display_c' ELSE 'SUCCESS' END as Message
FROM molinahealth_mdsdb.sc_req_item_final src 
LEFT JOIN molinahealth_mdwdb.d_request_item trgt ON src.sys_id = trgt.row_id AND src.sourceinstance = trgt.source_id
WHERE COALESCE(src.correlation_display,'UNSPECIFIED') <>  trgt.correlation_display_c ;