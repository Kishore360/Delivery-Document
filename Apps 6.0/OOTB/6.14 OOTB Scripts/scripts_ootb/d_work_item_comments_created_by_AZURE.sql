SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item_comments.created_by' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.azure_workitem_comment_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item_comments TRGT 
 ON  SRC.__numerify__primary_key=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
 ON (CONCAT('INTERNAL_CONTACT~',SRC.createdByKey) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.createdByKey IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.created_by,'');
 
