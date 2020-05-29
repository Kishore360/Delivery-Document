 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.work_item_priority_src_key' ELSE 'SUCCESS' END as Message
 
 from #MDS_TABLE_SCHEMA.issue_final SRC
 
 left join #DWH_TABLE_SCHEMA.d_lov LKP
 on concat('PRIORITY~WORK_ITEM','~',upper(SRC.priority_id))=LKP.src_rowid
 and SRC.sourceinstance=LKP.source_id
 
 left join #DWH_TABLE_SCHEMA.d_work_item TRGT
 on concat(SRC.id, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
 where coalesce(LKP.row_key, case when SRC.priority_id is null then 0 else -1 end,'')<>coalesce(TRGT.work_item_priority_src_key,'')