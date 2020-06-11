drop table if exists #STG_TABLE_SCHEMA.changelog_weekly_temp;

create table if not exists #STG_TABLE_SCHEMA.changelog_weekly_temp 

select distinct base.id as changelogid, base.issueid, base.sourceinstance, base.created, base.field, base.fromstring, base.tostring, base.`from`, base.`to`, weekly.n_key
from 
(select chnglog.id, chnglog.issueid, chnglog.sourceinstance, chnglog.created, chnglogitems.field, chnglogitems.fromstring, chnglogitems.`from`, chnglogitems.`to`, chnglogitems.tostring
from #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
where lower(chnglogitems.field) in ('status', 'assignee', 'priority', 'sprint', 'duedate', 'summary', 'project', 'business value', 'story points', 'resolution')
) base

join 
(
select SRC.issueid,SRC.sourceinstance, SRC.n_key, chnglogitems.field, max(chnglogitems.issuechangelogid) as max_chnglog_id
from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on SRC.issueid=chnglog.issueid
and SRC.sourceinstance=chnglog.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where lower(chnglogitems.field) in ('status', 'assignee', 'priority', 'sprint', 'duedate', 'summary', 'project', 'business value', 'story points', 'resolution') and
convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') <= cal.week_end_date
group by SRC.issueid,SRC.sourceinstance, SRC.n_key, chnglogitems.field
) weekly
on weekly.max_chnglog_id = base.id and weekly.issueid = base.issueid and weekly.sourceinstance = base.sourceinstance and weekly.field = base.field

union all

select distinct base.id as changelogid, base.issueid, base.sourceinstance, base.created, base.field, base.fromstring, base.tostring, base.`from`, base.`to`, weekly.n_key
from 
(select chnglog.id, chnglog.issueid, chnglog.sourceinstance, chnglog.created, chnglogitems.field, chnglogitems.fromstring, chnglogitems.`from`, chnglogitems.`to`, chnglogitems.tostring
from #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
where lower(chnglogitems.field) in ('fix version')
) base

join 
(
select SRC.issueid,SRC.sourceinstance, SRC.n_key, chnglogitems.field, min(chnglogitems.issuechangelogid) as min_chnglog_id
from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on SRC.issueid=chnglog.issueid
and SRC.sourceinstance=chnglog.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where lower(chnglogitems.field) in ('fix version') and
convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') <= cal.week_end_date
group by SRC.issueid,SRC.sourceinstance, SRC.n_key, chnglogitems.field
) weekly
on weekly.min_chnglog_id = base.id and weekly.issueid = base.issueid and weekly.sourceinstance = base.sourceinstance and weekly.field = base.field;

alter table #STG_TABLE_SCHEMA.changelog_weekly_temp
ADD INDEX first_idx (issueid,sourceinstance),
ADD INDEX second_idx (changelogid,sourceinstance),
ADD INDEX third_idx (issueid,sourceinstance, n_key);

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.work_item_status = coalesce(LKP.`to`, LKP.`from`, SRC.work_item_status), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('status');

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.assignee = coalesce(LKP.`to`, LKP.`from`, SRC.assignee), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('assignee');

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.project = coalesce(LKP.`to`, LKP.`from`, SRC.project), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('project');

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.summary = coalesce(LKP.`to`, LKP.`from`, SRC.summary), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('summary');

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.business_value = coalesce(LKP.`to`, LKP.`from`, SRC.business_value), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('business value');

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.story_points = coalesce(LKP.`to`, LKP.`from`, SRC.story_points), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('story points');

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.work_item_resolution = coalesce(LKP.`to`, LKP.`from`, SRC.work_item_resolution), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('resolution');

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.work_item_priority = coalesce(LKP.`to`, LKP.`from`, SRC.work_item_priority), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('priority');

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
left join #DWH_TABLE_SCHEMA.d_iteration ITE
on ITE.row_id = IF(TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(LKP.`from`, ',', -2),',',1))=TRIM(SUBSTRING_INDEX(LKP.`to`, ',', -1)) 
OR LENGTH(TRIM(SUBSTRING_INDEX(LKP.`to`, ',', -1)))=0,null,TRIM(SUBSTRING_INDEX(LKP.`to`, ',', -1))) and LKP.sourceinstance = ITE.source_id
set SRC.work_item_iteration_key = coalesce(ITE.row_key, case when IF(TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(LKP.`from`, ',', -2),',',1))=TRIM(SUBSTRING_INDEX(LKP.`to`, ',', -1)) 
OR LENGTH(TRIM(SUBSTRING_INDEX(LKP.`to`, ',', -1)))=0,null,TRIM(SUBSTRING_INDEX(LKP.`to`, ',', -1))) is null then 0 else -1 end), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('sprint');
 
update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
left join 
(
select FV.issueid, FV.sourceinstance, min(FV.id) earliest_fix_version_id
from #MDS_TABLE_SCHEMA.issue_fixversions_final FV
group by issueid, FV.sourceinstance
) FV
on FV.issueid = LKP.issueid
left join #DWH_TABLE_SCHEMA.f_work_item_fix_version DFV
on concat(FV.issueid, '~', coalesce(LKP.`to`, LKP.`from`, FV.earliest_fix_version_id))=DFV.row_id and FV.sourceinstance=DFV.source_id
set SRC.work_item_earliest_fixed_version_key = coalesce(DFV.project_fixed_version_key,case when coalesce(LKP.`to`, LKP.`from`, FV.earliest_fix_version_id) is null then 0 else -1 end), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('fix version');

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
left join #MDS_TABLE_SCHEMA.issue_final issue
on issue.id = SRC.issueid and SRC.sourceinstance = issue.sourceinstance
set SRC.due_on = convert_tz(coalesce(LKP.`to`, LKP.`from`, issue.duedate),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('duedate');

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id

left join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, max(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as resolved_on
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
where lower(chnglogitems.field) = 'status' and LM.dimension_wh_code IN ('RESOLVED') and convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') <= cal.week_end_date
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_res
on tmp_res.issueid = SRC.issueid and tmp_res.sourceinstance = SRC.sourceinstance and tmp_res.n_key = SRC.n_key

left join (
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
where lower(chnglogitems.field) = 'status' and LM.dimension_wh_code IN ('COMPLETED') and convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') <= cal.week_end_date
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_cmp
on tmp_cmp.issueid = SRC.issueid and tmp_cmp.sourceinstance = SRC.sourceinstance and tmp_cmp.n_key = SRC.n_key

set SRC.resolved_on = case when LM.dimension_wh_code IN ('RESOLVED' , 'COMPLETED') then coalesce(tmp_res.resolved_on, tmp_cmp.completed_on, '') else null end, SRC.updated_on = current_timestamp;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM_FROM
on concat('STATUS~WORK_ITEM','~',upper(LKP.`from`)) = LM_FROM.src_rowid
and SRC.sourceinstance=LM_FROM.source_id

join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, max(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as in_prog_on
from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on SRC.issueid=chnglog.issueid
and SRC.sourceinstance=chnglog.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(chnglogitems.`from`))=LM.src_rowid
and chnglogitems.sourceinstance=LM.source_id
where lower(chnglogitems.field) = 'status' and LM.dimension_wh_code IN ('PROPOSED') and convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') <= cal.week_end_date
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp
on tmp.issueid = SRC.issueid and tmp.sourceinstance = SRC.sourceinstance and tmp.n_key = SRC.n_key

set SRC.in_progress_on = case when LM_FROM.dimension_wh_code IN ('PROPOSED') then tmp.in_prog_on else null end, SRC.updated_on = current_timestamp
where lower(LKP.field) in ('status');