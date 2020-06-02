SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.reopen_count' ELSE 'SUCCESS' END as Message
 from #MDS_TABLE_SCHEMA.issue_final SRC
left join (
select tmp.issue_changelog_issueid,tmp.issue_changelog_sourceinstance, count(1) as reopened_count
from #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM_TO
on concat('STATUS~WORK_ITEM~',upper(tmp.to))=LM_TO.src_rowid

left join #DWH_TABLE_SCHEMA.d_lov_map LM_FROM
on concat('STATUS~WORK_ITEM~',upper(tmp.from))=LM_FROM.src_rowid
 
where lower(tmp.field) = 'status' and LM_FROM.dimension_wh_code in ('COMPLETED','RESOLVED','CANCELLED') and LM_TO.dimension_wh_code in ('PROPOSED', 'IN PROGRESS')

group by tmp.issue_changelog_issueid,tmp.issue_changelog_sourceinstance
) reopen_cnt
on SRC.id=reopen_cnt.issue_changelog_issueid
and SRC.sourceinstance=reopen_cnt.issue_changelog_sourceinstance
 
left join #DWH_TABLE_SCHEMA.f_work_item TRGT
on concat(SRC.id, '')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
 
 where coalesce(reopen_cnt.reopened_count,0) <>coalesce(TRGT.reopen_count,'')