 SELECT CASE WHEN SQ.work_item_rec_count > 0 THEN 'SUCCESS' ELSE 'FAILURE' END as Result,
 CASE WHEN SQ.work_item_rec_count > 0 THEN 'SUCCESS' ELSE 'WORK_ITEM hierarchy class not present in d_h_all_hierarchies' END as Message
 from (select count(*) work_item_rec_count
 FROM #DWH_TABLE_SCHEMA.d_h_all_hierarchies TRGT 
 WHERE TRGT.row_id like '%WORK_ITEM' and 
 COALESCE(TRGT.hierarchy_class, '') = 'WORK_ITEM') SQ;