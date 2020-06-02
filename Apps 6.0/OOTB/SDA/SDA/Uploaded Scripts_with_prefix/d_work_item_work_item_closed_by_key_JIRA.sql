SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.work_item_closed_by_key' ELSE 'SUCCESS' END as Message
 /*SELECT TRGT.row_id, TRGT.row_key,DM.dimension_wh_code, SRC.assignee_key, SQ.author_key,
(case when DM.dimension_wh_code not in ('COMPLETED') then 'UNSPECIFIED'
 when DM.dimension_wh_code='COMPLETED' then CONCAT('INTERNAL_CONTACT~',SQ.author_key)
 when ASCII(COALESCE(SRC.assignee_key,'')) = 0 THEN 'UNSPECIFIED'
 else 'UNKNOWN' end) lkp_row_id,
COALESCE(LKP.row_key, 0) sr, coalesce(TRGT.work_item_closed_by_key,'') tg*/
 
 FROM #MDS_TABLE_SCHEMA.issue_final SRC 

 left join #DWH_TABLE_SCHEMA.d_lov_map DM
 on concat('STATUS~WORK_ITEM~',upper(SRC.statusid))=DM.src_rowid and SRC.sourceinstance = DM.source_id
 
 left join #DWH_TABLE_SCHEMA.d_lov_map RES
 on concat('RESOLUTION~WORK_ITEM','~',upper(SRC.resolution_id))=RES.src_rowid and SRC.sourceinstance = RES.source_id
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item TRGT 
 ON (concat(SRC.id, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
 
 left join 
 (
 select tmp.issue_changelog_issueid, tmp.issue_changelog_sourceinstance, LM.dimension_wh_code, tmp.author_key
 from #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
 join 
 (
 select tmp.issue_changelog_issueid, tmp.issue_changelog_sourceinstance, max(tmp.created) max_created
 from #STG_TABLE_SCHEMA.issue_activity_temp tmp
 left join #DWH_TABLE_SCHEMA.d_lov_map LM
 on concat('STATUS~WORK_ITEM~',upper(tmp.to))=LM.src_rowid and tmp.issue_changelog_sourceinstance = LM.source_id
 where tmp.field = 'STATUS' and LM.dimension_wh_code='COMPLETED' and tmp.primary_sequence_id <> 0
 group by tmp.issue_changelog_issueid, tmp.issue_changelog_sourceinstance
 ) max_created
 on max_created.issue_changelog_issueid = tmp.issue_changelog_issueid and max_created.issue_changelog_sourceinstance = tmp.issue_changelog_sourceinstance 
 and tmp.created = max_created.max_created
 
 left join #DWH_TABLE_SCHEMA.d_lov_map LM
 on concat('STATUS~WORK_ITEM~',upper(tmp.to))=LM.src_rowid and tmp.issue_changelog_sourceinstance = LM.source_id
 
 where tmp.field = 'STATUS' and LM.dimension_wh_code='COMPLETED' and tmp.primary_sequence_id <> 0

 ) SQ
 on SQ.issue_changelog_issueid = SRC.id and SQ.issue_changelog_sourceinstance = SRC.sourceinstance
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
 ON (case when DM.dimension_wh_code not in ('COMPLETED') then 'UNSPECIFIED'
 when DM.dimension_wh_code='COMPLETED' then CONCAT('INTERNAL_CONTACT~',SQ.author_key)
 when ASCII(COALESCE(SRC.assignee_key,'')) = 0 THEN 'UNSPECIFIED'
 else 'UNKNOWN' end = LKP.row_id 
 AND SRC.sourceinstance = LKP.source_id )
  
 WHERE COALESCE(LKP.row_key, case when DM.dimension_wh_code='COMPLETED' and CONCAT('INTERNAL_CONTACT~',SQ.author_key) is not null then -1 else 0 end)<>coalesce(TRGT.work_item_closed_by_key,'')