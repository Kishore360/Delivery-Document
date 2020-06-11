SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item_comments.created_on' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.azure_workitem_comment_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item_comments TRGT 
 ON SRC.__numerify__primary_key=TRGT.row_id  
 AND SRC.sourceinstance=TRGT.source_id
 WHERE coalesce(convert_tz(SRC.modifiedDate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<> COALESCE(TRGT.created_on,'');
 
