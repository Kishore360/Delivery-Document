
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.grand_parent_change_request_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D') SRC
 LEFT JOIN #DWH_TABLE_SCHEMA.d_change_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_change_request PARENT 
 ON SRC.parent = PARENT.row_id 
 WHERE COALESCE(PARENT.parent_change_request_key,CASE WHEN PARENT.row_id IS NOT NULL THEN -1 ELSE 0 END )<> TRGT.grand_parent_change_request_key

 
