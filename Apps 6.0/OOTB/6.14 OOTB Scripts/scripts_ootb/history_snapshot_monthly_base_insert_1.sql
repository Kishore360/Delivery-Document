drop table if exists #STG_TABLE_SCHEMA.history_snapshot_monthly_temp;

create table if not exists #STG_TABLE_SCHEMA.history_snapshot_monthly_temp (
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  issueid varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  n_date datetime DEFAULT NULL,
  n_key int(15) DEFAULT 0,
  lagging_count_of_month int(15) DEFAULT 0,
  wi_number varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  summary varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  age_since_creation int(20) DEFAULT 0,
  assignee varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  project varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  wi_type varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  sourceinstance bigint(20) NOT NULL DEFAULT '0',
  work_item_status varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  work_item_resolution varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  work_item_iteration_key int(15) DEFAULT 0,
  work_item_earliest_fixed_version_key varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  work_item_priority varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  reassignment_count int(15) DEFAULT 0,
  reopen_count int(15) DEFAULT 0,
  reopened_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  overdue_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  in_progress_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  proposed_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  resolved_on datetime DEFAULT NULL,
  due_on datetime DEFAULT NULL,
  in_progress_on datetime DEFAULT NULL,
  completed_on datetime DEFAULT NULL,
  last_updated_on datetime DEFAULT NULL,
  business_value DECIMAL(28,10) DEFAULT NULL,
  cancelled_on DATETIME DEFAULT NULL,
  story_points DECIMAL(28,10) DEFAULT NULL,
  changed_on datetime DEFAULT NULL,
  created_on datetime DEFAULT NULL,
  changed_by varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  created_by varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  cdctype varchar(1) COLLATE utf8_unicode_ci DEFAULT null,
  to_delete_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  inserted_on datetime DEFAULT NULL,
  updated_on datetime DEFAULT NULL
);

insert into #STG_TABLE_SCHEMA.history_snapshot_monthly_temp

(issueid, wi_number, n_date, n_key, lagging_count_of_month, summary, wi_type, sourceinstance, 
assignee, project, work_item_status, work_item_resolution, work_item_iteration_key, work_item_earliest_fixed_version_key, work_item_priority, 
business_value, story_points, created_on, created_by, changed_on, changed_by, cdctype, to_delete_flag, inserted_on, updated_on)

select issue.id, issue.`key`, calendar.calendar_date as n_date, calendar.row_key as n_key, calendar.lagging_count_of_month, 
issue.summary, issue.IssueTypeId, issue.sourceinstance, issue.AssigneeId, issue.ProjectId, issue.StatusId, issue.ResolutionId, D.iteration_key, D.earliest_fixed_version_key,
issue.PriorityId, round(issue.business_value,10), D.story_points, issue.created, issue.CreatorId, issue.updated, issue.CreatorId, issue.cdctype, 
'N' as to_delete_flag, current_timestamp as inserted_on, current_timestamp as updated_on
from #MDS_TABLE_SCHEMA.issue_final issue
left join #DWH_TABLE_SCHEMA.d_work_item D
on concat(issue.id, '')=D.row_id and issue.sourceinstance=D.source_id
cross join (
select distinct CAL_MN.calendar_date, CAL_MN.row_key, CAL.lagging_count_of_month
from #DWH_TABLE_SCHEMA.d_calendar_date CAL
left join  #DWH_TABLE_SCHEMA.d_calendar_date CAL_MN
ON (date_format(CAL.month_start_date,'%Y%m%d') = CAL_MN.row_id)
where CAL.lagging_count_of_month between 1 and 6) calendar;
-- where issue.id in (15852, 15780, 107250, 107810, 107317, 107323);

alter table #STG_TABLE_SCHEMA.history_snapshot_monthly_temp
ADD INDEX first_idx (issueid,sourceinstance),
ADD INDEX second_idx (n_key);

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp base
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
ON (base.n_key = CAL.row_key)
set base.to_delete_flag = 'Y', base.updated_on = current_timestamp
where convert_tz(base.created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') > CAL.month_end_date; 

use #STG_TABLE_SCHEMA;

delete base
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp base
where base.to_delete_flag = 'Y';

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp base
set sys_id = concat(issueid, '~', n_key);

drop table if exists #STG_TABLE_SCHEMA.changelog_monthly_temp;

create table if not exists #STG_TABLE_SCHEMA.changelog_monthly_temp 

select distinct base.id as changelogid, base.issueid, base.sourceinstance, base.created, base.field, base.fromstring, base.tostring, base.`from`, base.`to`, monthly.n_key
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
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on SRC.issueid=chnglog.issueid
and SRC.sourceinstance=chnglog.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where lower(chnglogitems.field) in ('status', 'assignee', 'priority', 'sprint', 'duedate', 'summary', 'project', 'business value', 'story points', 'resolution') and
convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') <= cal.month_end_date
group by SRC.issueid,SRC.sourceinstance, SRC.n_key, chnglogitems.field
) monthly
on monthly.max_chnglog_id = base.id and monthly.issueid = base.issueid and monthly.sourceinstance = base.sourceinstance and monthly.field = base.field

union all

select distinct base.id as changelogid, base.issueid, base.sourceinstance, base.created, base.field, base.fromstring, base.tostring, base.`from`, base.`to`, monthly.n_key
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
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on SRC.issueid=chnglog.issueid
and SRC.sourceinstance=chnglog.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where lower(chnglogitems.field) in ('fix version') and
convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') <= cal.month_end_date
group by SRC.issueid,SRC.sourceinstance, SRC.n_key, chnglogitems.field
) monthly
on monthly.min_chnglog_id = base.id and monthly.issueid = base.issueid and monthly.sourceinstance = base.sourceinstance and monthly.field = base.field;

alter table #STG_TABLE_SCHEMA.changelog_monthly_temp
ADD INDEX first_idx (issueid,sourceinstance),
ADD INDEX second_idx (changelogid,sourceinstance),
ADD INDEX third_idx (issueid,sourceinstance, n_key);

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.work_item_status = coalesce(LKP.`to`, LKP.`from`, SRC.work_item_status), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('status');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.assignee = coalesce(LKP.`to`, LKP.`from`, SRC.assignee), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('assignee');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.project = coalesce(LKP.`to`, LKP.`from`, SRC.project), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('project');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.summary = coalesce(LKP.`to`, LKP.`from`, SRC.summary), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('summary');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.business_value = coalesce(LKP.`to`, LKP.`from`, SRC.business_value), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('business value');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.story_points = coalesce(LKP.`to`, LKP.`from`, SRC.story_points), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('story points');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.work_item_resolution = coalesce(LKP.`to`, LKP.`from`, SRC.work_item_resolution), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('resolution');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.work_item_priority = coalesce(LKP.`to`, LKP.`from`, SRC.work_item_priority), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('priority');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
left join #DWH_TABLE_SCHEMA.d_iteration ITE
on ITE.row_id = IF(TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(LKP.`from`, ',', -2),',',1))=TRIM(SUBSTRING_INDEX(LKP.`to`, ',', -1)) 
OR LENGTH(TRIM(SUBSTRING_INDEX(LKP.`to`, ',', -1)))=0,null,TRIM(SUBSTRING_INDEX(LKP.`to`, ',', -1))) and LKP.sourceinstance = ITE.source_id
set SRC.work_item_iteration_key = coalesce(ITE.row_key, case when IF(TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(LKP.`from`, ',', -2),',',1))=TRIM(SUBSTRING_INDEX(LKP.`to`, ',', -1)) 
OR LENGTH(TRIM(SUBSTRING_INDEX(LKP.`to`, ',', -1)))=0,null,TRIM(SUBSTRING_INDEX(LKP.`to`, ',', -1))) is null then 0 else -1 end), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('sprint');
 
update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
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

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
left join #MDS_TABLE_SCHEMA.issue_final issue
on issue.id = SRC.issueid and SRC.sourceinstance = issue.sourceinstance
set SRC.due_on = convert_tz(coalesce(LKP.`to`, LKP.`from`, issue.duedate),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('duedate');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id

left join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, max(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as resolved_on
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
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
where lower(chnglogitems.field) = 'status' and LM.dimension_wh_code IN ('RESOLVED') and convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') <= cal.month_end_date
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_res
on tmp_res.issueid = SRC.issueid and tmp_res.sourceinstance = SRC.sourceinstance and tmp_res.n_key = SRC.n_key

left join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, max(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as completed_on
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
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
where lower(chnglogitems.field) = 'status' and LM.dimension_wh_code IN ('COMPLETED') and convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') <= cal.month_end_date
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_cmp
on tmp_cmp.issueid = SRC.issueid and tmp_cmp.sourceinstance = SRC.sourceinstance and tmp_cmp.n_key = SRC.n_key

set SRC.resolved_on = case when LM.dimension_wh_code IN ('RESOLVED' , 'COMPLETED') then coalesce(tmp_res.resolved_on, tmp_cmp.completed_on, '') else null end, SRC.updated_on = current_timestamp;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM_FROM
on concat('STATUS~WORK_ITEM','~',upper(LKP.`from`)) = LM_FROM.src_rowid
and SRC.sourceinstance=LM_FROM.source_id

join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, max(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as in_prog_on
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
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
where lower(chnglogitems.field) = 'status' and LM.dimension_wh_code IN ('PROPOSED') and convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') <= cal.month_end_date
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp
on tmp.issueid = SRC.issueid and tmp.sourceinstance = SRC.sourceinstance and tmp.n_key = SRC.n_key

set SRC.in_progress_on = case when LM_FROM.dimension_wh_code IN ('PROPOSED') then tmp.in_prog_on else null end, SRC.updated_on = current_timestamp
where lower(LKP.field) in ('status');