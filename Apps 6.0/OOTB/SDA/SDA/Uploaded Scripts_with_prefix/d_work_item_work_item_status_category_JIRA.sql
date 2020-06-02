SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.work_item_status_category' ELSE 'SUCCESS' END as Message
 
 from #MDS_TABLE_SCHEMA.issue_final SRC
 
 left join #MDS_TABLE_SCHEMA.status_final STA
 on SRC.status=STA.id
 /*
  left join #MDS_TABLE_SCHEMA.status_category_final STA1
 on SRC.StatusCategoryId=STA1.id
 */
 left join #DWH_TABLE_SCHEMA.d_work_item TRGT
 on concat(SRC.id, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
 where coalesce(STA.StatusCategoryId,'')<>coalesce(TRGT.work_item_status_category,'')