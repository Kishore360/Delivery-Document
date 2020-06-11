
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.change_request_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D') SRC
 LEFT JOIN #DWH_TABLE_SCHEMA.f_change_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_change_request LKP 
 ON ( SRC.sys_id = LKP.row_id 
 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_id IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.change_request_key,'')
