 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item_epic.source_id' ELSE 'SUCCESS' END as Message
 
 from (select LKP_SRC.* from #MDS_TABLE_SCHEMA.issue_final LKP_SRC
left join #DWH_TABLE_SCHEMA.d_lov_map LKP
 on concat('TYPE~WORK_ITEM','~',upper(LKP_SRC.issuetype_id))=LKP.src_rowid
 and LKP_SRC.sourceinstance=LKP.source_id
left join #MDS_TABLE_SCHEMA.epic_final SRC
 on concat(LKP_SRC.key, '') = SRC.key
 and LKP_SRC.sourceinstance = SRC.sourceinstance
where LKP.dimension_wh_code = 'EPIC') SRC
 
 left join #DWH_TABLE_SCHEMA.d_work_item_epic TRGT
 on SRC.key=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
 where SRC.key is not null and coalesce(SRC.sourceinstance,'')<>coalesce(TRGT.source_id,'')