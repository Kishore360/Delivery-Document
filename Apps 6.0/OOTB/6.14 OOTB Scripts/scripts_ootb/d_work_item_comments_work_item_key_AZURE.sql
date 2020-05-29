SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item_comments.work_item_key' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.azure_workitem_comment_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item_comments TRGT 
 ON  (SRC.__numerify__primary_key=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item D
ON  concat(SRC.workitemkey,'') = D.row_id and SRC.sourceinstance = D.source_id
where D.soft_deleted_flag = 'N' and
COALESCE(D.row_key,case when SRC.workitemkey is null then 0 else -1 end)<>COALESCE(TRGT.work_item_key,0)

 
