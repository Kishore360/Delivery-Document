SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item_comments.soft_deleted_flag' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.azure_workitem_comment_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item_comments TRGT 
 ON  SRC.__numerify__primary_key=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id
where coalesce(case when SRC.cdctype = 'D' then 'Y' else 'N' end, '')<>coalesce(TRGT.soft_deleted_flag,'')
