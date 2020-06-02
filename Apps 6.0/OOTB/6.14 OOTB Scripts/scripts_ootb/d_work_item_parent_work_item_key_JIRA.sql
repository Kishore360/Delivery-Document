SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.parent_work_item_key' ELSE 'SUCCESS' END as Message
 
 from #MDS_TABLE_SCHEMA.issue_final SRC
 
 left join #MDS_TABLE_SCHEMA.issue_final PAR
 on SRC.parent_id=PAR.id
 and SRC.sourceinstance=PAR.sourceinstance
 
 left join #DWH_TABLE_SCHEMA.d_work_item PAR_K
 on concat(PAR.id, '')=PAR_K.row_id
 and PAR.sourceinstance=PAR_K.source_id
 
 left join #DWH_TABLE_SCHEMA.d_work_item TRGT
 on concat(SRC.id, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
 where coalesce(PAR_K.row_key,case when SRC.parent_id is null then 0 else -1 end )<>coalesce(TRGT.parent_work_item_key,'')