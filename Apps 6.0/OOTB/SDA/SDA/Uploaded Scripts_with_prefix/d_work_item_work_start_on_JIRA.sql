SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.WORK_START_ON' ELSE 'SUCCESS' END as Message

from #MDS_TABLE_SCHEMA.issue_final SRC
 
left join (
select tmp.issue_changelog_issueid,tmp.issue_changelog_sourceinstance,min(tmp.created) as work_start_on
from #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(tmp.from))=LM.src_rowid
 
where lower(tmp.field) = 'status' and LM.dimension_wh_code='PROPOSED'
group by tmp.issue_changelog_issueid,tmp.issue_changelog_sourceinstance
) strtd_dt
 
on SRC.id=strtd_dt.issue_changelog_issueid
and SRC.sourceinstance=strtd_dt.issue_changelog_sourceinstance
 
 left join #DWH_TABLE_SCHEMA.d_work_item TRGT
 on concat(SRC.id, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
 where coalesce(convert_tz(strtd_dt.work_start_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<>coalesce(TRGT.work_start_on,'')