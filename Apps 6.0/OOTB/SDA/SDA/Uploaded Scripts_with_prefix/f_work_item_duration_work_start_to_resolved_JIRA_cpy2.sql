SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.duration_work_start_to_resolved' ELSE 'SUCCESS' END as Message
 from #MDS_TABLE_SCHEMA.issue_final SRC
 
 left join (
 select SRC.id, SRC.sourceinstance, min(CG.created) as work_start_on
 from #MDS_TABLE_SCHEMA.issue_final SRC
 left join  #MDS_TABLE_SCHEMA.issue_changelog_final CG
 on SRC.id=CG.issueid and SRC.sourceinstance=CG.sourceinstance

 left join #MDS_TABLE_SCHEMA.issue_changelog_items_final CI
 on CI.issuechangelogid=CG.id and CI.sourceinstance=CG.sourceinstance

 left join #DWH_TABLE_SCHEMA.d_lov_map DM
 on concat('STATUS~WORK_ITEM~',upper(CI.to))=DM.src_rowid
 
 where lower(CI.field) = 'status' and DM.dimension_wh_code='IN PROGRESS'
 group by SRC.id,SRC.key,SRC.sourceinstance
 )SRC1
 on SRC.id=SRC1.id
 and SRC.sourceinstance=SRC1.sourceinstance
 
 left join #DWH_TABLE_SCHEMA.f_work_item TRGT
 on concat(SRC.id, '')=TRGT.row_id
 and SRC.sourceinstance = TRGT.source_id
 
 left join #DWH_TABLE_SCHEMA.d_work_item LKP1
 on SRC.id=LKP1.row_id
 and SRC.sourceinstance=LKP1.source_id 
 
 left join #DWH_TABLE_SCHEMA.d_lov_map DM
 on LKP1.work_item_status_src_key = DM.src_key
  
 where coalesce(case when DM.dimension_wh_code='RESOLVED' and SRC1.work_start_on is not null then 
 timestampdiff(second,coalesce(SRC1.work_start_on,0),coalesce(SRC.resolutiondate,0)) else 0 end,0) <>coalesce(TRGT.duration_work_start_to_resolved,'')