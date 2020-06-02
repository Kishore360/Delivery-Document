
  SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_work_item_label.row_count' ELSE 'SUCCESS' END as Message
 from ( select *from
 (select count(*) count_src from #MDS_TABLE_SCHEMA.issue_labels_final  SRC where cdctype<>'D') count_src,
 (select count(*) count_trgt from #DWH_TABLE_SCHEMA.f_work_item_label TRGT 
 where TRGT.row_key not in (0, -1) and TRGT.source_id = 20) count_trgt
 where count_src.count_src <> count_trgt.count_trgt
 )SQ ;