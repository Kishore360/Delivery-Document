SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_item.created_on' ELSE 'SUCCESS' END as Message  
FROM (SELECT count(1) as CNT 
FROM #MDS_TABLE_SCHEMA.sc_req_item_final SRC  LEFT JOIN #DWH_TABLE_SCHEMA.f_request_item TRGT  
ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  )
 WHERE convert_tz(SRC.sys_created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')<> TRGT.created_on)temp;
 
