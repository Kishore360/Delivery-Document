SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hp_kcrt_requests_final where cdctype <> 'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_demand TRGT 
 ON (SRC.request_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

 WHERE COALESCE(CONVERT_TZ(SRC.CREATION_DATE,'@#TENANT_SSI_TIME_ZONE@#','@#DW_TARGET_TIME_ZONE@#')) <> COALESCE(TRGT.CREATED_ON,'')