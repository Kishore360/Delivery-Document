

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.stage_src_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sc_req_item_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_request_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON ( concat('STAGE','~','SC_REQ_ITEM','~',upper(stage)) = LKP.src_rowid 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.stage IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.stage_src_key ,'')
