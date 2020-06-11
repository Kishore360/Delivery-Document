
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.grand_parent_change_request_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D') SRC
 LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D') PARENT
 ON (SRC.parent=PARENT.sys_id AND SRC.sourceinstance=PARENT.sourceinstance)
 LEFT JOIN #DWH_TABLE_SCHEMA.f_change_request TRGT 
 ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
 LEFT JOIN #DWH_TABLE_SCHEMA.d_change_request PARENT_CHNG
 ON (PARENT.parent= PARENT_CHNG.row_id AND SRC.sourceinstance=PARENT_CHNG.source_id)
WHERE COALESCE(PARENT_CHNG.row_key,CASE WHEN PARENT.parent IS NULL THEN 0 ELSE -1 END )<> TRGT.grand_parent_change_request_key;