SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_request_task.changed_on' ELSE 'SUCCESS' END as Message 
FROM (SELECT count(1) as CNT 
FROM #MDS_TABLE_SCHEMA.sc_task_final SRC  LEFT JOIN #DWH_TABLE_SCHEMA.d_request_task TRGT  
ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
WHERE convert_tz(SRC.sys_updated_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')<> TRGT.changed_on )temp;

