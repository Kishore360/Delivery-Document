SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_request_item.closed_on' ELSE 'SUCCESS' END as Message  
FROM (SELECT count(1) as CNT 
FROM <<tenant>>_mdsdb.sc_req_item_final SRC  
LEFT JOIN <<tenant>>_mdwdb.d_request_item TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
WHERE convert_tz(coalesce(SRC.closed_at,SRC.sys_updated_on),<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>)<> TRGT.closed_on)temp;


