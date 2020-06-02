SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hp_kcrt_requests_final where cdctype <> 'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_demand TRGT 
 ON (SRC.request_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

 WHERE COALESCE(SRC.LAST_UPDATED_BY)<> COALESCE(TRGT.CHANGED_BY,'')