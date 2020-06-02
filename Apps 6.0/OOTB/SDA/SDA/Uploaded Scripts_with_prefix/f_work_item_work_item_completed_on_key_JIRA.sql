SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.work_item_completed_on_key' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.issue_final SRC
 
left join (
select tmp.issue_changelog_issueid,tmp.issue_changelog_sourceinstance,max(tmp.created) as work_complete_on
from app_test.issue_sys_audit_temp tmp
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(tmp.to))=LM.src_rowid and tmp.issue_changelog_sourceinstance = LM.source_id
 
where lower(tmp.field) = 'status' and LM.dimension_wh_code='COMPLETED' and tmp.primary_sequence_id <>0
group by tmp.issue_changelog_issueid,tmp.issue_changelog_sourceinstance
) compltd_dt
 
on SRC.id=compltd_dt.issue_changelog_issueid
and SRC.sourceinstance=compltd_dt.issue_changelog_sourceinstance

LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP_COMPLETED
on (LKP.row_id  = date_format(convert_tz(compltd_dt.work_complete_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d') and LKP.source_id=0)

 left join #DWH_TABLE_SCHEMA.f_work_item TRGT
 on concat(SRC.id, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id

 left join #DWH_TABLE_SCHEMA.d_work_item D
 on SRC.id=D.row_id and SRC.sourceinstance=D.source_id
  
 left join #DWH_TABLE_SCHEMA.d_lov_map DM
 on D.work_item_status_src_key=DM.src_key
  
 where coalesce(case when DM.dimension_wh_code='COMPLETED' then LKP_COMPLETED.row_key else 0 end,0) <>coalesce(TRGT.work_item_completed_on_key,'0')