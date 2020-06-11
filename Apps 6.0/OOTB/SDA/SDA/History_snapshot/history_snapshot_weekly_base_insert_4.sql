use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id

join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, max(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as completed_on
from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on SRC.issueid=chnglog.issueid
and SRC.sourceinstance=chnglog.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(chnglogitems.`to`))=LM.src_rowid
and chnglogitems.sourceinstance=LM.source_id
where lower(chnglogitems.field) = 'status' and LM.dimension_wh_code='COMPLETED' and convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') <= cal.week_end_date
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp
on tmp.issueid = SRC.issueid and tmp.sourceinstance = SRC.sourceinstance and tmp.n_key = SRC.n_key

set SRC.completed_on = case when LM.dimension_wh_code IN ('COMPLETED') then tmp.completed_on else null end, SRC.updated_on = current_timestamp;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join 
(
select max(changelogid) max_changelog_week, issueid, sourceinstance, n_key
from #STG_TABLE_SCHEMA.changelog_weekly_temp 
group by issueid, sourceinstance, n_key
) LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
 
join (
select chnglog.id, chnglog.issueid, chnglog.sourceinstance, chnglog.created
from #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_final isu
on chnglog.issueid = isu.id and chnglog.sourceinstance = isu.sourceinstance
) tmp
on tmp.id = LKP.max_changelog_week and tmp.issueid = LKP.issueid and tmp.sourceinstance = LKP.sourceinstance

left join #MDS_TABLE_SCHEMA.issue_changelog_final updated_by
on updated_by.id = LKP.max_changelog_week and updated_by.issueid = LKP.issueid and updated_by.sourceinstance = LKP.sourceinstance

left join #DWH_TABLE_SCHEMA.d_work_item D
on concat(SRC.issueid, '') = D.row_id and SRC.sourceinstance = D.source_id

set SRC.last_updated_on = coalesce(convert_tz(tmp.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), D.work_item_updated_on), SRC.changed_by = updated_by.authorkey, SRC.updated_on = current_timestamp;	

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id

set SRC.overdue_flag = coalesce(case when SRC.due_on is null then 'N' when LM.dimension_wh_code IN ('PROPOSED','IN PROGRESS') and coalesce(SRC.due_on,0) < SRC.n_date THEN 'Y' ELSE 'N' END, 'N'), SRC.updated_on = current_timestamp;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id

set SRC.proposed_flag = coalesce(case when LM.dimension_wh_code IN ('PROPOSED') THEN 'Y' ELSE 'N' END, 'N'), SRC.updated_on = current_timestamp;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM_FROM
on concat('STATUS~WORK_ITEM~',upper(LKP.`from`))=LM_FROM.src_rowid
and LKP.sourceinstance=LM_FROM.source_id

set SRC.in_progress_flag = coalesce(case when LM_FROM.dimension_wh_code IN ('PROPOSED') THEN 'Y' ELSE 'N' END, 'N'), SRC.updated_on = current_timestamp;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC

join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, count(1) as reopened_count
from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on SRC.issueid=chnglog.issueid
and SRC.sourceinstance=chnglog.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map LM_TO
on concat('STATUS~WORK_ITEM~',upper(chnglogitems.`to`))=LM_TO.src_rowid
and chnglogitems.sourceinstance=LM_TO.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map LM_FROM
on concat('STATUS~WORK_ITEM~',upper(chnglogitems.`from`))=LM_FROM.src_rowid
and chnglogitems.sourceinstance=LM_FROM.source_id
where lower(chnglogitems.field) = 'status' and (LM_FROM.dimension_wh_code in ('COMPLETED','RESOLVED','CANCELLED') and LM_TO.dimension_wh_code in ('PROPOSED', 'IN PROGRESS')) and convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') <= cal.week_end_date
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_reopn
on tmp_reopn.issueid = SRC.issueid and tmp_reopn.sourceinstance = SRC.sourceinstance and tmp_reopn.n_key = SRC.n_key

set SRC.reopened_flag = coalesce(case when tmp_reopn.reopened_count > 0 THEN 'Y' ELSE 'N' END, 'N'), SRC.reopen_count = tmp_reopn.reopened_count, SRC.updated_on = current_timestamp;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC

join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, count(chnglogitems.issueid) as reassignment_count
from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on SRC.issueid=chnglog.issueid
and SRC.sourceinstance=chnglog.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where lower(chnglogitems.field) = 'assignee' and convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') <= cal.week_end_date
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_reasgn
on tmp_reasgn.issueid = SRC.issueid and tmp_reasgn.sourceinstance = SRC.sourceinstance and tmp_reasgn.n_key = SRC.n_key

set SRC.reassignment_count = tmp_reasgn.reassignment_count, SRC.updated_on = current_timestamp;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id
set SRC.age_since_creation =  coalesce(case when SRC.created_on > SRC.n_date then 0 
when LM.dimension_wh_code in ('RESOLVED', 'COMPLETED') then timestampdiff(second,coalesce(SRC.created_on,0),coalesce(convert_tz(SRC.resolved_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>') , case when LM.dimension_wh_code in ('COMPLETED','RESOLVED') then convert_tz(SRC.completed_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>') else null end, convert_tz(SRC.cancelled_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>')))
when LM.dimension_wh_code in ('CANCELLED') then timestampdiff(second,coalesce(SRC.created_on,0),convert_tz(coalesce(SRC.resolved_on, SRC.cancelled_on),'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'))
else timestampdiff(second,coalesce(SRC.created_on,0),coalesce(convert_tz(SRC.n_date,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),0)) end,0), SRC.updated_on = current_timestamp;