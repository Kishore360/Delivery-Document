SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM  
png_mdwdb.f_request_item a 
JOIN png_mdsdb.sc_req_item_final b
ON a.row_id = b.sys_id and a.source_id = b.sourceinstance 
LEFT JOIN png_mdwdb.d_service LKP 
ON CONCAT('BUSINESS_SERVICE~' ,business_service) = LKP.row_id and b.sourceinstance = LKP.source_id

where
ri_business_service_c_key <> COALESCE(LKP.row_key,CASE WHEN b.business_service IS NULL THEN 0 else -1 end);