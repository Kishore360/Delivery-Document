SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item_epic.epic_name' ELSE 'SUCCESS' END as Message
 from (select LKP_SRC.sourceinstance, LKP_SRC.cdctype, LKP_SRC.id, LKP_SRC.`key`, SRC.boardid, EXT.customfield_10009 as epic_name 
 from #MDS_TABLE_SCHEMA.issue_final LKP_SRC
 join #MDS_TABLE_SCHEMA.issue_ext_final EXT
on LKP_SRC.id = EXT.record_id and LKP_SRC.sourceinstance = EXT.sourceinstance
left join #DWH_TABLE_SCHEMA.d_lov_map LKP
 on concat('TYPE~WORK_ITEM~',upper(LKP_SRC.issuetype_id))=LKP.src_rowid and LKP_SRC.sourceinstance=LKP.source_id and LKP.dimension_class = 'TYPE~WORK_ITEM'
left join #MDS_TABLE_SCHEMA.epic_final SRC
 on concat(LKP_SRC.key, '') = SRC.key
 and LKP_SRC.sourceinstance = SRC.sourceinstance
where LKP.dimension_wh_code = 'EPIC') SRC
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item_epic TRGT 
 ON (SRC.key=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

 WHERE SRC.key is not null and COALESCE(SRC.epic_name,'' )<> COALESCE(TRGT.epic_name ,'');