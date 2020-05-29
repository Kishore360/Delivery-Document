SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_request_item.due_on' ELSE 'SUCCESS' END as Message 
FROM (SELECT count(1) as CNT  
 FROM #MDS_TABLE_SCHEMA.sc_req_item_final SRC  LEFT JOIN #DWH_TABLE_SCHEMA.d_request_item TRGT  
 ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
 WHERE date(convert_tz(SRC.due_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'))<> date(TRGT.due_on))temp;
 
