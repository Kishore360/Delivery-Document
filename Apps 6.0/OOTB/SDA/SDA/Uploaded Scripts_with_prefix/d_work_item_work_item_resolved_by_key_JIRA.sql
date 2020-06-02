SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.work_item_resolved_by_key' ELSE 'SUCCESS' END as Message
 /*SELECT TRGT.row_id, TRGT.row_key,DM.dimension_wh_code, resolved_by.author_key,
case when DM.dimension_wh_code not in ('RESOLVED', 'COMPLETED') then 'UNSPECIFIED'
 when DM.dimension_wh_code in ('RESOLVED', 'COMPLETED') and ASCII(COALESCE(resolved_by.author_key,'')) = 0 THEN 'UNSPECIFIED' 
 when DM.dimension_wh_code in ('RESOLVED', 'COMPLETED') then CONCAT('INTERNAL_CONTACT~',resolved_by.author_key)
 else 'UNKNOWN' end lkp_row_id,
COALESCE(LKP.row_key, case when DM.dimension_wh_code not in ('RESOLVED') then 0 else -1 end) sr, coalesce(TRGT.work_item_resolved_by_key,'') tg*/
 
 FROM #MDS_TABLE_SCHEMA.issue_final SRC 

 left join #DWH_TABLE_SCHEMA.d_lov_map DM
 on concat('STATUS~WORK_ITEM~',upper(SRC.statusid))=DM.src_rowid and SRC.sourceinstance = DM.source_id
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item TRGT 
 ON (concat(SRC.id, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
 
 left join (
 select tmp.issue_changelog_issueid, tmp.issue_changelog_sourceinstance, tmp.author_key, resolved.max_created
 from #STG_TABLE_SCHEMA.issue_activity_temp tmp
 join 
 (
 select tmp.issue_changelog_issueid, tmp.issue_changelog_sourceinstance, max(tmp.created) max_created
 from #STG_TABLE_SCHEMA.issue_activity_temp tmp
 left join #DWH_TABLE_SCHEMA.d_lov_map LM
 on concat('STATUS~WORK_ITEM~',upper(tmp.to))=LM.src_rowid and tmp.issue_changelog_sourceinstance = LM.source_id
 where tmp.field = 'STATUS' and LM.dimension_wh_code='RESOLVED' and tmp.primary_sequence_id <> 0
 group by tmp.issue_changelog_issueid, tmp.issue_changelog_sourceinstance
 ) resolved
 on resolved.issue_changelog_issueid = tmp.issue_changelog_issueid and resolved.issue_changelog_sourceinstance = tmp.issue_changelog_sourceinstance 
 and tmp.created = resolved.max_created
where tmp.field = 'STATUS' and tmp.primary_sequence_id <> 0
 ) resolved_by
 on resolved_by.issue_changelog_issueid = SRC.id and resolved_by.issue_changelog_sourceinstance = SRC.sourceinstance 
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
 ON (case when DM.dimension_wh_code not in ('RESOLVED', 'COMPLETED') then 'UNSPECIFIED'
 when DM.dimension_wh_code in ('RESOLVED', 'COMPLETED') and ASCII(COALESCE(resolved_by.author_key,'')) = 0 THEN 'UNSPECIFIED' 
 when DM.dimension_wh_code in ('RESOLVED', 'COMPLETED') then CONCAT('INTERNAL_CONTACT~',resolved_by.author_key)
 else 'UNKNOWN' end = LKP.row_id 
 AND (SRC.sourceinstance = LKP.source_id or LKP.source_id = 0))
  
 WHERE COALESCE(LKP.row_key, case when DM.dimension_wh_code not in ('RESOLVED') then 0 else -1 end)<>coalesce(TRGT.work_item_resolved_by_key,'');