SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.in_progress_flag' ELSE 'SUCCESS' END as Message
 from #MDS_TABLE_SCHEMA.issue_final SRC
 
 left join #DWH_TABLE_SCHEMA.d_work_item TRGT
 on concat(SRC.id, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
  
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM
 on TRGT.work_item_status_src_key= LM.src_key
where coalesce(CASE WHEN LM.dimension_wh_code in ('IN PROGRESS') THEN 'Y' ELSE 'N' END,'N') <> coalesce(TRGT.in_progress_flag ,'')