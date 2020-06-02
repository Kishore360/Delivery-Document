SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.duration_work_start_to_resolved' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.issue_final SRC
 
left join (
select tmp.issue_changelog_issueid,tmp.issue_changelog_sourceinstance,max(tmp.created) as work_complete_on
from #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(tmp.to))=LM.src_rowid and tmp.issue_changelog_sourceinstance = LM.source_id

where lower(tmp.field) = 'status' and LM.dimension_wh_code='COMPLETED' and tmp.primary_sequence_id <>0
group by tmp.issue_changelog_issueid,tmp.issue_changelog_sourceinstance
) compltd_dt
 
on SRC.id=compltd_dt.issue_changelog_issueid
and SRC.sourceinstance=compltd_dt.issue_changelog_sourceinstance

left join (
select tmp.issue_changelog_issueid,tmp.issue_changelog_sourceinstance,min(tmp.created) as work_start_on
from #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(tmp.from))=LM.src_rowid
 
where lower(tmp.field) = 'status' and LM.dimension_wh_code='PROPOSED'
group by tmp.issue_changelog_issueid,tmp.issue_changelog_sourceinstance
) strt_dt
 
on SRC.id=strt_dt.issue_changelog_issueid
and SRC.sourceinstance=strt_dt.issue_changelog_sourceinstance
 
left join #DWH_TABLE_SCHEMA.f_work_item TRGT
on concat(SRC.id, '')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
 
left join #DWH_TABLE_SCHEMA.d_work_item LKP1
on concat(SRC.id, '')=LKP1.row_id
and SRC.sourceinstance=LKP1.source_id
  
left join #DWH_TABLE_SCHEMA.d_lov_map DM
on LKP1.work_item_status_src_key=DM.src_key
 
left join #DWH_TABLE_SCHEMA.d_lov_map RES
on concat('RESOLUTION~WORK_ITEM','~',upper(SRC.resolution_id))=RES.src_rowid and SRC.sourceinstance = RES.source_id
 
 where coalesce(case when DM.dimension_wh_code in ('RESOLVED', 'COMPLETED') and RES.dimension_wh_code in ('CANCELLED') then 0
 when DM.dimension_wh_code in ('RESOLVED', 'COMPLETED') and strt_dt.work_start_on is not null then 
 timestampdiff(second,coalesce(strt_dt.work_start_on,0),coalesce(SRC.resolutiondate,compltd_dt.work_complete_on)) else 0 end,0) <>coalesce(TRGT.duration_work_start_to_resolved,'');