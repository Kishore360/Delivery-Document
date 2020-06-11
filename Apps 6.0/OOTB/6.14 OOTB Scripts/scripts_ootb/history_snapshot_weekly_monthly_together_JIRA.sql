-- Weekly base table creation --

drop table if exists #STG_TABLE_SCHEMA.history_snapshot_weekly_temp;

create table if not exists #STG_TABLE_SCHEMA.history_snapshot_weekly_temp (
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  issueid varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  n_date datetime DEFAULT NULL,
  n_key int(15) DEFAULT 0,
  lagging_count_of_weeks int(15) DEFAULT 0,
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

insert into #STG_TABLE_SCHEMA.history_snapshot_weekly_temp

(issueid, wi_number, n_date, n_key, lagging_count_of_weeks, summary, wi_type, sourceinstance, due_on,
assignee, project, work_item_status, work_item_resolution, work_item_iteration_key, work_item_earliest_fixed_version_key, work_item_priority, 
business_value, story_points, created_on, created_by, changed_on, changed_by, cdctype, to_delete_flag, inserted_on, updated_on)

select issue.id, issue.`key`, calendar.calendar_date as n_date, calendar.row_key as n_key, calendar.lagging_count_of_weeks, 
issue.summary, issue.IssueTypeId, issue.sourceinstance, convert_tz(issue.duedate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') as due_on, issue.AssigneeId, issue.ProjectId, issue.StatusId, issue.ResolutionId, D.iteration_key, D.earliest_fixed_version_key,
issue.PriorityId, round(issue.business_value,10), D.story_points, issue.created, issue.CreatorId, issue.updated, issue.CreatorId, issue.cdctype, 
'N' as to_delete_flag, current_timestamp as inserted_on, current_timestamp as updated_on
from #MDS_TABLE_SCHEMA.issue_final issue
left join #DWH_TABLE_SCHEMA.d_work_item D
on concat(issue.id, '')=D.row_id and issue.sourceinstance=D.source_id
cross join (
select distinct CAL_WK.calendar_date, CAL_WK.row_key, CAL.lagging_count_of_weeks
from #DWH_TABLE_SCHEMA.d_calendar_date CAL
left join  #DWH_TABLE_SCHEMA.d_calendar_date CAL_WK
ON (date_format(CAL.week_start_date,'%Y%m%d') = CAL_WK.row_id)
where CAL.lagging_count_of_weeks between 1 and 6) calendar;

alter table #STG_TABLE_SCHEMA.history_snapshot_weekly_temp
ADD PRIMARY KEY (issueid, sourceinstance, n_key),
ADD INDEX first_idx (issueid,sourceinstance) USING BTREE,
ADD INDEX second_idx (issueid,sourceinstance,n_key) USING BTREE,
ADD INDEX third_idx (n_key) USING BTREE;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp base
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
ON (base.n_key = CAL.row_key)
set base.to_delete_flag = 'Y', base.updated_on = current_timestamp
where date_format(convert_tz(base.created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') > date_format(CAL.week_end_date, '%Y-%m-%d'); 

use #STG_TABLE_SCHEMA;

delete base
from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp base
where base.to_delete_flag = 'Y';

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp base
set sys_id = concat(issueid, '~', n_key);

-- Weekly changelog table creation --

drop table if exists #STG_TABLE_SCHEMA.weekly_changelog_id;

create table if not exists #STG_TABLE_SCHEMA.weekly_changelog_id 

select SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_weeks, chnglogitems.field, max(chnglogitems.issuechangelogid) as max_chnglog_id, min(chnglogitems.issuechangelogid) as min_chnglog_id
from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on SRC.issueid=chnglog.issueid
and SRC.sourceinstance=chnglog.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where lower(chnglogitems.field) in ('status', 'assignee', 'priority', 'sprint', 'duedate', 'summary', 'project', 'business value', 'story points', 'resolution', 'fix version') and
date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.week_end_date, '%Y-%m-%d')
and chnglogitems.`from` <> chnglogitems.`to`
group by SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_weeks, chnglogitems.field;

drop table if exists #STG_TABLE_SCHEMA.changelog_weekly_temp;

create table if not exists #STG_TABLE_SCHEMA.changelog_weekly_temp (
  changelogid int(15) DEFAULT NULL,
  issueid varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  sourceinstance bigint(20) NOT NULL DEFAULT 0,
  created datetime DEFAULT NULL,
  field varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  fromstring text COLLATE utf8_unicode_ci DEFAULT NULL,
  tostring text COLLATE utf8_unicode_ci DEFAULT NULL,
  `from` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `to` text COLLATE utf8_unicode_ci DEFAULT NULL,
  n_key int(15) DEFAULT 0,
  lagging_count_of_weeks int(15) DEFAULT 0,
  
  PRIMARY KEY (changelogid, field, sourceinstance, n_key),
  KEY first_idx (issueid, sourceinstance, field, n_key) USING BTREE,
  KEY second_idx (field) USING BTREE,
  KEY third_idx (changelogid, issueid, sourceinstance, field) USING BTREE,
  KEY fourth_idx (changelogid, sourceinstance) USING BTREE
);

insert into #STG_TABLE_SCHEMA.changelog_weekly_temp 
(changelogid, issueid, sourceinstance, created, field, fromstring, tostring, `from`, `to`, n_key, lagging_count_of_weeks)

select distinct base.id as changelogid, base.issueid, base.sourceinstance, base.created, base.field, base.fromstring, base.tostring, base.`from`, base.`to`, weekly.n_key, weekly.lagging_count_of_weeks
from 
(select chnglog.id, chnglog.issueid, chnglog.sourceinstance, chnglog.created, chnglogitems.field, chnglogitems.fromstring, chnglogitems.`from`, chnglogitems.`to`, chnglogitems.tostring
from #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
where lower(chnglogitems.field) in ('status', 'assignee', 'priority', 'sprint', 'duedate', 'summary', 'project', 'business value', 'story points', 'resolution') and chnglogitems.`from` <> chnglogitems.`to`
) base

join #STG_TABLE_SCHEMA.weekly_changelog_id weekly
on weekly.max_chnglog_id = base.id and weekly.issueid = base.issueid and weekly.sourceinstance = base.sourceinstance and weekly.field = base.field

union all

select distinct base.id as changelogid, base.issueid, base.sourceinstance, base.created, base.field, base.fromstring, base.tostring, base.`from`, base.`to`, weekly.n_key, weekly.lagging_count_of_weeks
from 
(select chnglog.id, chnglog.issueid, chnglog.sourceinstance, chnglog.created, chnglogitems.field, chnglogitems.fromstring, chnglogitems.`from`, chnglogitems.`to`, chnglogitems.tostring
from #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
where lower(chnglogitems.field) in ('fix version') and chnglogitems.`from` <> chnglogitems.`to`
) base

join #STG_TABLE_SCHEMA.weekly_changelog_id weekly
on weekly.min_chnglog_id = base.id and weekly.issueid = base.issueid and weekly.sourceinstance = base.sourceinstance and weekly.field = base.field;

-- Weekly next changelog table creation --

drop table if exists #STG_TABLE_SCHEMA.next_changelog_val_week;

create table if not exists #STG_TABLE_SCHEMA.next_changelog_val_week 

select chnglog.id AS changelogid, chnglog.issueid, chnglog.sourceinstance, chnglogitems.field, chnglogitems.fromstring as next_fromstring, chnglogitems.`from` as next_from, next_id.n_key, next_id.lagging_count_of_weeks
from #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_weeks, chnglogitems.field, min(chnglogitems.issuechangelogid) as nxt_chnglog_id
from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on SRC.issueid=chnglog.issueid
and SRC.sourceinstance=chnglog.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where lower(chnglogitems.field) in ('status', 'assignee', 'priority', 'sprint', 'duedate', 'summary', 'project', 'business value', 'story points', 'resolution', 'fix version') and
date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') > date_format(cal.week_end_date, '%Y-%m-%d') and chnglogitems.`from` <> chnglogitems.`to`
group by SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_weeks, chnglogitems.field) next_id
on next_id.nxt_chnglog_id = chnglog.id and next_id.sourceinstance = chnglog.sourceinstance and next_id.issueid = chnglog.issueid and next_id.field = chnglogitems.field
where lower(chnglogitems.field) in ('status', 'assignee', 'priority', 'sprint', 'duedate', 'summary', 'project', 'business value', 'story points', 'resolution', 'fix version');

alter table #STG_TABLE_SCHEMA.next_changelog_val_week
ADD PRIMARY KEY (changelogid, field, sourceinstance, n_key),
ADD INDEX first_idx (issueid, sourceinstance, field, n_key) USING BTREE,
ADD INDEX second_idx (field) USING BTREE,
ADD INDEX third_idx (changelogid, issueid, sourceinstance, field) USING BTREE,
ADD INDEX fourth_idx (changelogid, sourceinstance) USING BTREE;

-- Weekly base table assignee update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.assignee = coalesce(LKP.`to`, LKP.`from`, SRC.assignee), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('assignee');

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_week LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.assignee = coalesce(LKP2.next_from, SRC.assignee), SRC.updated_on = current_timestamp
where lower(LKP2.field) in ('assignee') and SRC.assignee <> LKP2.next_from;

-- Weekly base table business value update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.business_value = coalesce(LKP.`to`, LKP.`from`, SRC.business_value), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('business value');

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_week LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.business_value = coalesce(LKP2.next_from, SRC.business_value), SRC.updated_on = current_timestamp
where lower(LKP2.field) in ('business value') and coalesce(LKP2.next_from, '') <> coalesce(SRC.business_value, '');

-- Weekly base table duedate update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key and lower(LKP.field) in ('duedate')
left join #MDS_TABLE_SCHEMA.issue_final issue
on issue.id = SRC.issueid and SRC.sourceinstance = issue.sourceinstance
set SRC.due_on = convert_tz(coalesce(LKP.`to`, case when date_format(SRC.n_date, '%Y-%m-%d') < date_format(LKP.created, '%Y-%m-%d') then LKP.`from` else null end, issue.duedate),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), SRC.updated_on = current_timestamp;

-- Weekly base table fix version update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
left join #DWH_TABLE_SCHEMA.d_work_item_version DFV
on coalesce(LKP.`to`, LKP.`from`)=DFV.row_id and LKP.sourceinstance=DFV.source_id
set SRC.work_item_earliest_fixed_version_key = coalesce(DFV.row_key,case when coalesce(LKP.`to`, LKP.`from`) is null then 0 else -1 end), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('fix version');

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_week LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
join #DWH_TABLE_SCHEMA.d_work_item_version DFV
on coalesce(LKP2.next_from)=DFV.row_id and LKP2.sourceinstance=DFV.source_id
set SRC.work_item_earliest_fixed_version_key = coalesce(DFV.row_key,case when LKP2.next_from is null then 0 else -1 end), SRC.updated_on = current_timestamp
where lower(LKP2.field) in ('fix version') and DFV.row_key <> SRC.work_item_earliest_fixed_version_key;

-- Weekly base table priority update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.work_item_priority = coalesce(LKP.`to`, LKP.`from`, SRC.work_item_priority), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('priority');

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_week LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.work_item_priority = coalesce(LKP2.next_from, SRC.work_item_priority), SRC.updated_on = current_timestamp
where lower(LKP2.field) in ('priority') and LKP2.next_from <> SRC.work_item_priority;

-- Weekly base table project update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.project = coalesce(LKP.`to`, LKP.`from`, SRC.project), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('project');

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_week LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.project = coalesce(LKP2.next_from, SRC.project), SRC.updated_on = current_timestamp
where lower(LKP2.field) in ('project') and LKP2.next_from <> SRC.project;

-- Weekly base table resolution update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.work_item_resolution = coalesce(LKP.`to`, LKP.`from`, SRC.work_item_resolution), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('resolution');

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_week LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.work_item_resolution = coalesce(LKP2.next_from, SRC.work_item_resolution), SRC.updated_on = current_timestamp
where lower(LKP2.field) in ('resolution') and LKP2.next_from <> SRC.work_item_resolution;

-- Weekly base table story points update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.story_points = coalesce(LKP.`to`, LKP.`from`, SRC.story_points), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('story points');

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_week LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.story_points = coalesce(LKP2.next_from, SRC.story_points), SRC.updated_on = current_timestamp
where lower(LKP2.field) in ('story points') and SRC.story_points <> LKP2.next_from;

-- Weekly base table work_item_iteration_key update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #DWH_TABLE_SCHEMA.d_work_item D
on SRC.issueid = D.row_id and SRC.sourceinstance = D.source_id
join 
(
select FACT.work_item_key, FACT.source_id, LKP.week_start_date_key, FACT.task_attribute_wh_new_value_key
from #DWH_TABLE_SCHEMA.f_work_item_activity FACT
join (
select act.work_item_key, act.source_id, CAL.week_start_date_key, max(act.started_on) max_started_on
from #DWH_TABLE_SCHEMA.f_work_item_activity act
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on CAL.row_key = act.started_on_key
where act.task_attribute_wh_name = 'ITERATION'
group by act.work_item_key, act.source_id, CAL.week_start_date_key
) LKP
on FACT.work_item_key = LKP.work_item_key and FACT.source_id = LKP.source_id and FACT.started_on = LKP.max_started_on
where FACT.task_attribute_wh_name = 'ITERATION'
) base
on base.work_item_key = D.row_key and base.source_id = D.source_id and base.week_start_date_key = SRC.n_key

set SRC.work_item_iteration_key = coalesce(base.task_attribute_wh_new_value_key, 0);

-- Weekly base table status update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.work_item_status = coalesce(LKP.`to`, LKP.`from`, SRC.work_item_status), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('status');

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_week LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.work_item_status = coalesce(LKP2.next_from, SRC.work_item_status), SRC.updated_on = current_timestamp
where lower(LKP2.field) in ('status') and LKP2.next_from <> SRC.work_item_status;

-- Weekly base table summary update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.summary = coalesce(LKP.`to`, LKP.`from`, SRC.summary), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('summary');

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_week LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.summary = coalesce(LKP2.next_from, SRC.summary), SRC.updated_on = current_timestamp
where lower(LKP2.field) in ('summary') and LKP2.next_from <> SRC.summary;

-- Weekly base table completed_on update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
 
join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id and LM.dimension_wh_code IN ('COMPLETED')

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
where lower(chnglogitems.field) = 'status' and LM.dimension_wh_code='COMPLETED' and date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.week_end_date, '%Y-%m-%d') and chnglogitems.`from` <> chnglogitems.`to`
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp
on tmp.issueid = SRC.issueid and tmp.sourceinstance = SRC.sourceinstance and tmp.n_key = SRC.n_key

set SRC.completed_on = case when LM.dimension_wh_code IN ('COMPLETED') then tmp.completed_on else null end, SRC.updated_on = current_timestamp;

-- Weekly base table in_progress_on update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC

join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, min(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as in_prog_on
from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on SRC.issueid=chnglog.issueid and SRC.sourceinstance=chnglog.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(chnglogitems.`from`))=LM.src_rowid
and chnglogitems.sourceinstance=LM.source_id
where lower(chnglogitems.field) = 'status' and LM.dimension_wh_code IN ('PROPOSED') and date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.week_end_date, '%Y-%m-%d') and chnglogitems.`from` <> chnglogitems.`to`
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp
on tmp.issueid = SRC.issueid and tmp.sourceinstance = SRC.sourceinstance and tmp.n_key = SRC.n_key

set SRC.in_progress_on = tmp.in_prog_on, SRC.updated_on = current_timestamp;

-- Weekly base table last_updated_on update --

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
where chnglogitems.`from` <> chnglogitems.`to`
) tmp
on tmp.id = LKP.max_changelog_week and tmp.issueid = LKP.issueid and tmp.sourceinstance = LKP.sourceinstance

left join #MDS_TABLE_SCHEMA.issue_changelog_final updated_by
on updated_by.id = LKP.max_changelog_week and updated_by.issueid = LKP.issueid and updated_by.sourceinstance = LKP.sourceinstance

join #DWH_TABLE_SCHEMA.d_work_item D
on concat(SRC.issueid, '') = D.row_id and SRC.sourceinstance = D.source_id

set SRC.last_updated_on = coalesce(convert_tz(tmp.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), D.work_item_updated_on), SRC.changed_by = updated_by.authorkey, SRC.updated_on = current_timestamp;

-- Weekly base table resolved_on update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
 
join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id and LM.dimension_wh_code IN ('RESOLVED' , 'COMPLETED')

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
where lower(chnglogitems.field) = 'status' and LM.dimension_wh_code IN ('RESOLVED') and date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.week_end_date, '%Y-%m-%d') and chnglogitems.`from` <> chnglogitems.`to`
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_res
on tmp_res.issueid = SRC.issueid and tmp_res.sourceinstance = SRC.sourceinstance and tmp_res.n_key = SRC.n_key

set SRC.resolved_on = case when LM.dimension_wh_code IN ('RESOLVED' , 'COMPLETED') then coalesce(tmp_res.resolved_on, SRC.completed_on) else null end, SRC.updated_on = current_timestamp;

-- Weekly base table cancelled_on update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
 
join #DWH_TABLE_SCHEMA.d_lov_map LM_ST
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM_ST.src_rowid
and SRC.sourceinstance=LM_ST.source_id and LM_ST.dimension_wh_code in ('RESOLVED','CANCELLED','COMPLETED')

left join #DWH_TABLE_SCHEMA.d_lov_map LM_RES
on concat('RESOLUTION~WORK_ITEM','~',upper(SRC.work_item_resolution)) = LM_RES.src_rowid
and SRC.sourceinstance=LM_RES.source_id

left join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, max(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as cancelled_on
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
left join #DWH_TABLE_SCHEMA.d_lov_map LM_RES
on concat('RESOLUTION~WORK_ITEM','~',upper(SRC.work_item_resolution)) = LM_RES.src_rowid
and SRC.sourceinstance=LM_RES.source_id
where lower(chnglogitems.field) = 'status' and (LM.dimension_wh_code = 'CANCELLED' or LM_RES.dimension_wh_code in ('CANCELLED')) and date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.week_end_date, '%Y-%m-%d') and chnglogitems.`from` <> chnglogitems.`to`
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_cncl
on tmp_cncl.issueid = SRC.issueid and tmp_cncl.sourceinstance = SRC.sourceinstance and tmp_cncl.n_key = SRC.n_key

set SRC.cancelled_on = case when (LM_ST.dimension_wh_code in ('CANCELLED') AND (LM_RES.dimension_wh_code != 'CANCELLED' OR LM_RES.dimension_wh_code IS NULL)) then tmp_cncl.cancelled_on
 when LM_ST.dimension_wh_code in ('RESOLVED','CANCELLED','COMPLETED') AND LM_RES.dimension_wh_code  in ('CANCELLED') then COALESCE(SRC.resolved_on,tmp_cncl.cancelled_on)
 else null end, SRC.updated_on = current_timestamp;
 
-- Weekly base table overdue_flag update --
 
use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
 
join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id

join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cal.row_key = SRC.n_key

set SRC.overdue_flag = coalesce(case when SRC.due_on is null then 'N' when LM.dimension_wh_code IN ('PROPOSED','IN PROGRESS') and coalesce(SRC.due_on,0) < cal.week_end_date THEN 'Y' ELSE 'N' END, 'N'), SRC.updated_on = current_timestamp;

-- Weekly base table proposed_flag update --

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
 
join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id

set SRC.proposed_flag = coalesce(case when LM.dimension_wh_code IN ('PROPOSED') THEN 'Y' ELSE 'N' END, 'N'), SRC.updated_on = current_timestamp;

-- Weekly base table in_progress_flag update --

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id

set SRC.in_progress_flag = coalesce(case when LM.dimension_wh_code IN ('IN PROGRESS') THEN 'Y' ELSE 'N' END, 'N'), SRC.updated_on = current_timestamp;

-- Weekly base table reassignment_count update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC

join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, count(LKP.issue_changelog_issueid) as reassignment_count
from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp LKP
on SRC.issueid=LKP.issue_changelog_issueid and SRC.sourceinstance=LKP.issue_changelog_sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where lower(LKP.`field`) = 'assignee' and date_format(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.week_end_date, '%Y-%m-%d') and (LKP.fromstring is not null or LKP.`from` is not null)
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_reasgn
on tmp_reasgn.issueid = SRC.issueid and tmp_reasgn.sourceinstance = SRC.sourceinstance and tmp_reasgn.n_key = SRC.n_key

set SRC.reassignment_count = tmp_reasgn.reassignment_count, SRC.updated_on = current_timestamp;

-- Weekly base table reopened_flag reopen_count update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC

join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, count(1) as reopened_count
from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp LKP
on SRC.issueid=LKP.issue_changelog_issueid and SRC.sourceinstance=LKP.issue_changelog_sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map LM_TO
on concat('STATUS~WORK_ITEM~',upper(LKP.`to`))=LM_TO.src_rowid
and LKP.issue_changelog_sourceinstance=LM_TO.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map LM_FROM
on concat('STATUS~WORK_ITEM~',upper(LKP.`from`))=LM_FROM.src_rowid
and LKP.issue_changelog_sourceinstance=LM_FROM.source_id
where lower(LKP.field) = 'status' and (LM_FROM.dimension_wh_code in ('COMPLETED','RESOLVED','CANCELLED') and LM_TO.dimension_wh_code in ('PROPOSED', 'IN PROGRESS')) and date_format(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.week_end_date, '%Y-%m-%d')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_reopn
on tmp_reopn.issueid = SRC.issueid and tmp_reopn.sourceinstance = SRC.sourceinstance and tmp_reopn.n_key = SRC.n_key

set SRC.reopened_flag = coalesce(case when tmp_reopn.reopened_count > 0 THEN 'Y' ELSE 'N' END, 'N'), SRC.reopen_count = tmp_reopn.reopened_count, SRC.updated_on = current_timestamp;

-- Weekly base table age_since_creation update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on CAL.row_key = SRC.n_key
set SRC.age_since_creation =  coalesce(case when SRC.created_on > SRC.n_date then 0 
when LM.dimension_wh_code in ('RESOLVED', 'COMPLETED') then timestampdiff(second,coalesce(SRC.created_on,0),coalesce(convert_tz(SRC.resolved_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>') , case when LM.dimension_wh_code in ('COMPLETED','RESOLVED') then convert_tz(SRC.completed_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>') else null end, convert_tz(SRC.cancelled_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>')))
when LM.dimension_wh_code in ('CANCELLED') then timestampdiff(second,coalesce(SRC.created_on,0),convert_tz(coalesce(SRC.resolved_on, SRC.cancelled_on),'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'))
else timestampdiff(second,coalesce(SRC.created_on,0),coalesce(convert_tz(CAL.week_end_date,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),0)) end,0), SRC.updated_on = current_timestamp;

-- Weekly base table backup creation --

drop table if exists #STG_TABLE_SCHEMA.history_snapshot_weekly_temp_bkp;

create table #STG_TABLE_SCHEMA.history_snapshot_weekly_temp_bkp
select * from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp;

-- Weekly final table creation --

drop table if exists #STG_TABLE_SCHEMA.f_work_item_snpst_wk_base;

create table #STG_TABLE_SCHEMA.f_work_item_snpst_wk_base

select D.row_key as work_item_key,
SRC.age_since_creation as age_since_creation,
coalesce(ASGN.row_key, case when SRC.assignee is null then 0 else -1 end) as assigned_to_key,
SRC.cdctype as cdctype,
SRC.changed_by as changed_by,
coalesce(SRC.changed_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') as changed_on,
SRC.created_by as created_by,
coalesce(SRC.created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') as created_on,
SRC.due_on as due_date,
SRC.in_progress_on as in_progress_date,
SRC.resolved_on as resolved_date,
SRC.completed_on as completed_date,
SRC.cancelled_on as cancelled_date,
SRC.in_progress_flag as in_progress_flag,
SRC.proposed_flag as proposed_flag,
SRC.reopened_flag as reopened_flag,
SRC.overdue_flag as overdue_flag,
SRC.last_updated_on as last_updated_date,
SRC.n_date as n_date,
SRC.n_key as n_key,
coalesce(PROJ.row_key, case when SRC.project is null then 0 else -1 end) as project_key,
SRC.reassignment_count as reassignment_count,
SRC.reopen_count as reopen_count,
SRC.issueid as row_id,
cast((case when SRC.cdctype = 'D' then 'Y' else 'N' end) as char(1)) as soft_deleted_flag,
SRC.sourceinstance as source_id,
SRC.summary as summary,
SRC.work_item_earliest_fixed_version_key as work_item_earliest_fixed_version_key,
SRC.work_item_iteration_key as work_item_iteration_key,
coalesce(PRIO.row_key, case when SRC.work_item_priority is null then 0 else -1 end) as work_item_priority_src_key,
coalesce(STATUS.row_key, case when SRC.work_item_status is null then 0 else -1 end) as work_item_status_src_key,
coalesce(RESOLUTION.row_key, case when SRC.work_item_resolution is null then 0 else -1 end) as work_item_resolution_src_key,
SRC.business_value as business_value,
SRC.story_points as story_points


from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #DWH_TABLE_SCHEMA.d_work_item D
on SRC.issueid=D.row_id
and SRC.sourceinstance=D.source_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact ASGN
ON (concat('INTERNAL_CONTACT~', SRC.assignee) = ASGN.row_id 
AND SRC.sourceinstance=ASGN.source_id)
LEFT JOIN #DWH_TABLE_SCHEMA.d_project PROJ
ON (SRC.project = PROJ.row_id 
AND SRC.sourceinstance=PROJ.source_id)
left join #DWH_TABLE_SCHEMA.d_lov PRIO
on concat('PRIORITY~WORK_ITEM','~',upper(SRC.work_item_priority))=PRIO.src_rowid
and SRC.sourceinstance=PRIO.source_id
left join #DWH_TABLE_SCHEMA.d_lov STATUS
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status))=STATUS.src_rowid
and SRC.sourceinstance=STATUS.source_id
left join #DWH_TABLE_SCHEMA.d_lov RESOLUTION
on concat('RESOLUTION~WORK_ITEM','~',upper(SRC.work_item_resolution))=RESOLUTION.src_rowid
and SRC.sourceinstance=RESOLUTION.source_id;

insert into #STG_TABLE_SCHEMA.f_work_item_snpst_wk_base
(work_item_key, age_since_creation, assigned_to_key, cdctype, changed_by, changed_on, created_by, created_on, 
due_date, in_progress_date, resolved_date, completed_date, cancelled_date, in_progress_flag, proposed_flag , 
reopened_flag, overdue_flag, last_updated_date, n_date, n_key, project_key, reassignment_count, reopen_count, row_id, soft_deleted_flag, source_id, summary, 
work_item_earliest_fixed_version_key, work_item_iteration_key, work_item_priority_src_key, work_item_status_src_key, work_item_resolution_src_key, business_value, story_points)

select F.work_item_key as work_item_key,
F.age_since_creation as age_since_creation,
D.work_item_assigned_to_key as assigned_to_key,
F.cdctype as cdctype,
F.changed_by as changed_by,
F.changed_on as changed_on,
F.created_by as created_by,
F.created_on as created_on,
D.due_on as due_date,
D.work_start_on as in_progress_date,
D.resolved_on as resolved_date,
D.completed_on as completed_date,
D.cancelled_on as cancelled_date,
D.in_progress_flag as in_progress_flag,
D.proposed_flag as proposed_flag,
D.reopened_flag as reopened_flag,
D.overdue_flag as overdue_flag,
D.work_item_updated_on as last_updated_date,
CAL.week_start_date as n_date,
CAL.week_start_date_key as n_key,
F.project_key as project_key,
F.reassignment_count as reassignment_count,
F.reopen_count as reopen_count,
F.row_id as row_id,
F.soft_deleted_flag as soft_deleted_flag,
F.source_id as source_id,
D.short_description as summary,
D.earliest_fixed_version_key as work_item_earliest_fixed_version_key,
D.iteration_key as work_item_iteration_key,
D.work_item_priority_src_key as work_item_priority_src_key, 
D.work_item_status_src_key as work_item_status_src_key,
D.work_item_resolution_src_key as work_item_resolution_src_key,
F.business_value as business_value,
F.story_points as story_points

from #DWH_TABLE_SCHEMA.f_work_item F
left join  #DWH_TABLE_SCHEMA.d_work_item D
ON F.work_item_key = D.row_key
left join (
select source_id, max(lastupdated) as last_updated
from #DWH_TABLE_SCHEMA.d_o_data_freshness 
where sourcename = 'Jira_Tenant' group by source_id) ODF 
on ODF.source_id = F.source_id
left join  #DWH_TABLE_SCHEMA.d_calendar_date CAL
ON (date_format(ODF.last_updated,'%Y%m%d') = CAL.row_id);

-- Monthly --

-- Monthly base table creation --

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

(issueid, wi_number, n_date, n_key, lagging_count_of_month, summary, wi_type, sourceinstance, due_on,
assignee, project, work_item_status, work_item_resolution, work_item_iteration_key, work_item_earliest_fixed_version_key, work_item_priority, 
business_value, story_points, created_on, created_by, changed_on, changed_by, cdctype, to_delete_flag, inserted_on, updated_on)

select issue.id, issue.`key`, calendar.calendar_date as n_date, calendar.row_key as n_key, calendar.lagging_count_of_month, 
issue.summary, issue.IssueTypeId, issue.sourceinstance, convert_tz(issue.duedate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), issue.AssigneeId, issue.ProjectId, issue.StatusId, issue.ResolutionId, D.iteration_key, D.earliest_fixed_version_key,
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

alter table #STG_TABLE_SCHEMA.history_snapshot_monthly_temp
ADD PRIMARY KEY (issueid, sourceinstance, n_key),
ADD INDEX first_idx (issueid,sourceinstance) USING BTREE,
ADD INDEX second_idx (issueid,sourceinstance,n_key) USING BTREE,
ADD INDEX third_idx (n_key) USING BTREE;

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

-- Monthly changelog table creation --

drop table if exists #STG_TABLE_SCHEMA.monthly_changelog_id;

create table if not exists #STG_TABLE_SCHEMA.monthly_changelog_id 

select SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, chnglogitems.field, max(chnglogitems.issuechangelogid) as max_chnglog_id, min(chnglogitems.issuechangelogid) as min_chnglog_id
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on SRC.issueid=chnglog.issueid
and SRC.sourceinstance=chnglog.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where lower(chnglogitems.field) in ('status', 'assignee', 'priority', 'sprint', 'duedate', 'summary', 'project', 'business value', 'story points', 'resolution', 'fix version') and
date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') and chnglogitems.`from` <> chnglogitems.`to`
group by SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, chnglogitems.field;

drop table if exists #STG_TABLE_SCHEMA.changelog_monthly_temp;

create table if not exists #STG_TABLE_SCHEMA.changelog_monthly_temp (
  changelogid int(15) DEFAULT NULL,
  issueid varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  sourceinstance bigint(20) NOT NULL DEFAULT 0,
  created datetime DEFAULT NULL,
  field varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  fromstring text COLLATE utf8_unicode_ci DEFAULT NULL,
  tostring text COLLATE utf8_unicode_ci DEFAULT NULL,
  `from` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `to` text COLLATE utf8_unicode_ci DEFAULT NULL,
  n_key int(15) DEFAULT 0,
  lagging_count_of_month int(15) DEFAULT 0,
  
  PRIMARY KEY (changelogid, field, sourceinstance, n_key),
  KEY first_idx (issueid, sourceinstance, field, n_key) USING BTREE,
  KEY second_idx (field) USING BTREE,
  KEY third_idx (changelogid, issueid, sourceinstance, field) USING BTREE,
  KEY fourth_idx (changelogid, sourceinstance) USING BTREE
);


insert into #STG_TABLE_SCHEMA.changelog_monthly_temp 
(changelogid, issueid, sourceinstance, created, field, fromstring, tostring, `from`, `to`, n_key, lagging_count_of_month)

select distinct base.id as changelogid, base.issueid, base.sourceinstance, base.created, base.field, base.fromstring, base.tostring, base.`from`, base.`to`, monthly.n_key, monthly.lagging_count_of_month
from 
(select chnglog.id, chnglog.issueid, chnglog.sourceinstance, chnglog.created, chnglogitems.field, chnglogitems.fromstring, chnglogitems.`from`, chnglogitems.`to`, chnglogitems.tostring
from #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
where lower(chnglogitems.field) in ('status', 'assignee', 'priority', 'sprint', 'duedate', 'summary', 'project', 'business value', 'story points', 'resolution') and chnglogitems.`from` <> chnglogitems.`to`
) base

join #STG_TABLE_SCHEMA.monthly_changelog_id monthly
on monthly.max_chnglog_id = base.id and monthly.issueid = base.issueid and monthly.sourceinstance = base.sourceinstance and monthly.field = base.field

union all

select distinct base.id as changelogid, base.issueid, base.sourceinstance, base.created, base.field, base.fromstring, base.tostring, base.`from`, base.`to`, monthly.n_key, monthly.lagging_count_of_month
from 
(select chnglog.id, chnglog.issueid, chnglog.sourceinstance, chnglog.created, chnglogitems.field, chnglogitems.fromstring, chnglogitems.`from`, chnglogitems.`to`, chnglogitems.tostring
from #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
where lower(chnglogitems.field) in ('fix version') and chnglogitems.`from` <> chnglogitems.`to`
) base

join #STG_TABLE_SCHEMA.monthly_changelog_id monthly
on monthly.min_chnglog_id = base.id and monthly.issueid = base.issueid and monthly.sourceinstance = base.sourceinstance and monthly.field = base.field;

-- Monthly next changelog table creation --

drop table if exists #STG_TABLE_SCHEMA.next_changelog_val_month;

create table if not exists #STG_TABLE_SCHEMA.next_changelog_val_month 

select chnglog.id AS changelogid, chnglog.issueid, chnglog.sourceinstance, chnglogitems.field, chnglogitems.fromstring as next_fromstring, chnglogitems.`from` as next_from, next_id.n_key, next_id.lagging_count_of_month
from #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, chnglogitems.field, min(chnglogitems.issuechangelogid) as nxt_chnglog_id
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on SRC.issueid=chnglog.issueid
and SRC.sourceinstance=chnglog.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where lower(chnglogitems.field) in ('status', 'assignee', 'priority', 'sprint', 'duedate', 'summary', 'project', 'business value', 'story points', 'resolution', 'fix version') and
date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') > date_format(cal.month_end_date, '%Y-%m-%d') and chnglogitems.`from` <> chnglogitems.`to`
group by SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, chnglogitems.field) next_id
on next_id.nxt_chnglog_id = chnglog.id and next_id.sourceinstance = chnglog.sourceinstance and next_id.issueid = chnglog.issueid and next_id.field = chnglogitems.field
where lower(chnglogitems.field) in ('status', 'assignee', 'priority', 'sprint', 'duedate', 'summary', 'project', 'business value', 'story points', 'resolution', 'fix version');

alter table #STG_TABLE_SCHEMA.next_changelog_val_month
ADD PRIMARY KEY (changelogid, field, sourceinstance, n_key),
ADD INDEX first_idx (issueid, sourceinstance, field, n_key) USING BTREE,
ADD INDEX second_idx (field) USING BTREE,
ADD INDEX third_idx (changelogid, issueid, sourceinstance, field) USING BTREE,
ADD INDEX fourth_idx (changelogid, sourceinstance) USING BTREE;

-- Monthly base table assignee update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.assignee = coalesce(LKP.`to`, LKP.`from`, SRC.assignee), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('assignee');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_month LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.assignee = coalesce(LKP2.next_from, SRC.assignee), SRC.updated_on = current_timestamp
where lower(LKP2.field) in ('assignee') and SRC.assignee <> LKP2.next_from;

-- Monthly base table business value update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.business_value = coalesce(LKP.`to`, LKP.`from`, SRC.business_value), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('business value');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_month LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.business_value = coalesce(LKP2.next_from, SRC.business_value), SRC.updated_on = current_timestamp
where lower(LKP2.field) in ('business value') and SRC.business_value <> LKP2.next_from;

-- Monthly base table duedate update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key and lower(LKP.field) in ('duedate')
left join #MDS_TABLE_SCHEMA.issue_final issue
on issue.id = SRC.issueid and SRC.sourceinstance = issue.sourceinstance
set SRC.due_on = convert_tz(coalesce(LKP.`to`, case when date_format(SRC.n_date, '%Y-%m-%d') < date_format(LKP.created, '%Y-%m-%d') then LKP.`from` else null end, issue.duedate),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), SRC.updated_on = current_timestamp;

-- Monthly base table fix version update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
left join #DWH_TABLE_SCHEMA.d_work_item_version DFV
on coalesce(LKP.`to`, LKP.`from`)=DFV.row_id and LKP.sourceinstance=DFV.source_id
set SRC.work_item_earliest_fixed_version_key = coalesce(DFV.row_key,case when coalesce(LKP.`to`, LKP.`from`) is null then 0 else -1 end), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('fix version');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_month LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
left join #DWH_TABLE_SCHEMA.d_work_item_version DFV
on LKP2.next_from = DFV.row_id and LKP2.sourceinstance=DFV.source_id
set SRC.work_item_earliest_fixed_version_key = coalesce(DFV.row_key,case when LKP2.next_from is null then 0 else -1 end), SRC.updated_on = current_timestamp
where lower(LKP2.field) in ('fix version') and DFV.row_key <> SRC.work_item_earliest_fixed_version_key;

-- Monthly base table priority update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.work_item_priority = coalesce(LKP.`to`, LKP.`from`, SRC.work_item_priority), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('priority');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_month LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.work_item_priority = coalesce(LKP2.next_from, SRC.work_item_priority), SRC.updated_on = current_timestamp
where lower(LKP2.field) in ('priority') and SRC.work_item_priority <> LKP2.next_from;

-- Monthly base table project update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.project = coalesce(LKP.`to`, LKP.`from`, SRC.project), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('project');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_month LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.project = coalesce(LKP2.next_from, SRC.project), SRC.updated_on = current_timestamp
where lower(LKP2.field) in ('project') and SRC.project <> LKP2.next_from;

-- Monthly base table resolution update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.work_item_resolution = coalesce(LKP.`to`, LKP.`from`, SRC.work_item_resolution), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('resolution');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_month LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.work_item_resolution = coalesce(LKP2.next_from, SRC.work_item_resolution), SRC.updated_on = current_timestamp
where lower(LKP2.field) in ('resolution') and SRC.work_item_resolution <> LKP2.next_from;

-- Monthly base table story points update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.story_points = coalesce(LKP.`to`, LKP.`from`, SRC.story_points), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('story points');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_month LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.story_points = coalesce(LKP2.next_from, SRC.story_points), SRC.updated_on = current_timestamp
where lower(LKP2.field) in ('story points') and SRC.story_points <> LKP2.next_from;

-- Monthly base table work_item_iteration_key update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #DWH_TABLE_SCHEMA.d_work_item D
on SRC.issueid = D.row_id and SRC.sourceinstance = D.source_id
join 
(
select FACT.work_item_key, FACT.source_id, LKP.month_start_date_key, FACT.task_attribute_wh_new_value_key
from #DWH_TABLE_SCHEMA.f_work_item_activity FACT
join (
select act.work_item_key, act.source_id, CAL.month_start_date_key, max(act.started_on) max_started_on
from #DWH_TABLE_SCHEMA.f_work_item_activity act
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on CAL.row_key = act.started_on_key
where act.task_attribute_wh_name = 'ITERATION'
group by act.work_item_key, act.source_id, CAL.month_start_date_key
) LKP
on FACT.work_item_key = LKP.work_item_key and FACT.source_id = LKP.source_id and FACT.started_on = LKP.max_started_on
where FACT.task_attribute_wh_name = 'ITERATION'
) base
on base.work_item_key = D.row_key and base.source_id = D.source_id and base.month_start_date_key = SRC.n_key

set SRC.work_item_iteration_key = coalesce(base.task_attribute_wh_new_value_key, 0);

-- Monthly base table status update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.work_item_status = coalesce(LKP.`to`, LKP.`from`, SRC.work_item_status), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('status');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_month LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.work_item_status = coalesce(LKP2.next_from, SRC.work_item_status), SRC.updated_on = current_timestamp
where lower(LKP2.field) in ('status') and SRC.work_item_status <> LKP2.next_from;

-- Monthly base table summary update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.summary = coalesce(LKP.`to`, LKP.`from`, SRC.summary), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('summary');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_month LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.summary = coalesce(LKP2.next_from, SRC.summary), SRC.updated_on = current_timestamp
where lower(LKP2.field) in ('summary') and SRC.summary <> LKP2.next_from;

-- Monthly base table completed_on update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
 
join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id and LM.dimension_wh_code IN ('COMPLETED')

join (
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
where lower(chnglogitems.field) = 'status' and LM.dimension_wh_code='COMPLETED' and date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') and chnglogitems.`from` <> chnglogitems.`to`
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp
on tmp.issueid = SRC.issueid and tmp.sourceinstance = SRC.sourceinstance and tmp.n_key = SRC.n_key

set SRC.completed_on = case when LM.dimension_wh_code IN ('COMPLETED') then tmp.completed_on else null end, SRC.updated_on = current_timestamp;

-- Monthly base table in_progress_on update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
 
join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, min(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as in_prog_on
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
where lower(chnglogitems.field) = 'status' and LM.dimension_wh_code IN ('PROPOSED') and date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') and chnglogitems.`from` <> chnglogitems.`to`
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp
on tmp.issueid = SRC.issueid and tmp.sourceinstance = SRC.sourceinstance and tmp.n_key = SRC.n_key

set SRC.in_progress_on = tmp.in_prog_on, SRC.updated_on = current_timestamp;

-- Monthly base table last_updated_on update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join 
(
select max(changelogid) max_changelog_week, issueid, sourceinstance, n_key
from #STG_TABLE_SCHEMA.changelog_monthly_temp 
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
where  chnglogitems.`from` <> chnglogitems.`to`
) tmp
on tmp.id = LKP.max_changelog_week and tmp.issueid = LKP.issueid and tmp.sourceinstance = LKP.sourceinstance

left join #MDS_TABLE_SCHEMA.issue_changelog_final updated_by
on updated_by.id = LKP.max_changelog_week and updated_by.issueid = LKP.issueid and updated_by.sourceinstance = LKP.sourceinstance

left join #DWH_TABLE_SCHEMA.d_work_item D
on concat(SRC.issueid, '') = D.row_id and SRC.sourceinstance = D.source_id

set SRC.last_updated_on = coalesce(convert_tz(tmp.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), D.work_item_updated_on), SRC.changed_by = updated_by.authorkey, SRC.updated_on = current_timestamp;

-- Monthly base table resolved_on update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
 
join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id and LM.dimension_wh_code IN ('RESOLVED' , 'COMPLETED')

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
where lower(chnglogitems.field) = 'status' and LM.dimension_wh_code IN ('RESOLVED') and date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') and chnglogitems.`from` <> chnglogitems.`to`
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_res
on tmp_res.issueid = SRC.issueid and tmp_res.sourceinstance = SRC.sourceinstance and tmp_res.n_key = SRC.n_key

set SRC.resolved_on = case when LM.dimension_wh_code IN ('RESOLVED' , 'COMPLETED') then coalesce(tmp_res.resolved_on, SRC.completed_on) else null end, SRC.updated_on = current_timestamp;

-- Monthly base table cancelled_on update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
 
join #DWH_TABLE_SCHEMA.d_lov_map LM_ST
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM_ST.src_rowid
and SRC.sourceinstance=LM_ST.source_id and LM_ST.dimension_wh_code in ('RESOLVED','CANCELLED','COMPLETED')

left join #DWH_TABLE_SCHEMA.d_lov_map LM_RES
on concat('RESOLUTION~WORK_ITEM','~',upper(SRC.work_item_resolution)) = LM_RES.src_rowid
and SRC.sourceinstance=LM_RES.source_id

left join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, max(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as cancelled_on
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
left join #DWH_TABLE_SCHEMA.d_lov_map LM_RES
on concat('RESOLUTION~WORK_ITEM','~',upper(SRC.work_item_resolution)) = LM_RES.src_rowid
and SRC.sourceinstance=LM_RES.source_id
where lower(chnglogitems.field) = 'status' and (LM.dimension_wh_code = 'CANCELLED' or LM_RES.dimension_wh_code in ('CANCELLED')) and date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') and chnglogitems.`from` <> chnglogitems.`to`
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_cncl
on tmp_cncl.issueid = SRC.issueid and tmp_cncl.sourceinstance = SRC.sourceinstance and tmp_cncl.n_key = SRC.n_key

set SRC.cancelled_on = case when (LM_ST.dimension_wh_code in ('CANCELLED') AND (LM_RES.dimension_wh_code != 'CANCELLED' OR LM_RES.dimension_wh_code IS NULL)) then tmp_cncl.cancelled_on
 when LM_ST.dimension_wh_code in ('RESOLVED','CANCELLED','COMPLETED') AND LM_RES.dimension_wh_code  in ('CANCELLED') then COALESCE(SRC.resolved_on,tmp_cncl.cancelled_on)
 else null end, SRC.updated_on = current_timestamp;
 
-- Monthly base table overdue_flag update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
 
join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id

join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cal.row_key = SRC.n_key

set SRC.overdue_flag = coalesce(case when SRC.due_on is null then 'N' when LM.dimension_wh_code IN ('PROPOSED','IN PROGRESS') and coalesce(SRC.due_on,0) < cal.month_end_date THEN 'Y' ELSE 'N' END, 'N'), SRC.updated_on = current_timestamp;

-- Monthly base table proposed_flag update --

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
 
join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id

set SRC.proposed_flag = coalesce(case when LM.dimension_wh_code IN ('PROPOSED') THEN 'Y' ELSE 'N' END, 'N'), SRC.updated_on = current_timestamp;

-- Monthly base table in_progress_flag update --

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id

set SRC.in_progress_flag = coalesce(case when LM.dimension_wh_code IN ('IN PROGRESS') THEN 'Y' ELSE 'N' END, 'N'), SRC.updated_on = current_timestamp;

-- Monthly base table reassignment_count update --
 
use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC

join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, count(LKP.issue_changelog_issueid) as reassignment_count
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp LKP
on SRC.issueid=LKP.issue_changelog_issueid and SRC.sourceinstance=LKP.issue_changelog_sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where lower(LKP.field) = 'assignee' and date_format(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') and (LKP.fromstring is not null or LKP.`from` is not null)
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_reasgn
on tmp_reasgn.issueid = SRC.issueid and tmp_reasgn.sourceinstance = SRC.sourceinstance and tmp_reasgn.n_key = SRC.n_key

set SRC.reassignment_count = tmp_reasgn.reassignment_count, SRC.updated_on = current_timestamp;

-- Monthly base table reopened_flag reopen_count update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC

join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, count(1) as reopened_count
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp LKP
on SRC.issueid=LKP.issue_changelog_issueid and SRC.sourceinstance=LKP.issue_changelog_sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map LM_TO
on concat('STATUS~WORK_ITEM~',upper(LKP.`to`))=LM_TO.src_rowid
and LKP.issue_changelog_sourceinstance=LM_TO.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map LM_FROM
on concat('STATUS~WORK_ITEM~',upper(LKP.`from`))=LM_FROM.src_rowid
and LKP.issue_changelog_sourceinstance=LM_FROM.source_id
where lower(LKP.field) = 'status' and (LM_FROM.dimension_wh_code in ('COMPLETED','RESOLVED','CANCELLED') and LM_TO.dimension_wh_code in ('PROPOSED', 'IN PROGRESS')) and date_format(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_reopn
on tmp_reopn.issueid = SRC.issueid and tmp_reopn.sourceinstance = SRC.sourceinstance and tmp_reopn.n_key = SRC.n_key

set SRC.reopened_flag = coalesce(case when tmp_reopn.reopened_count > 0 THEN 'Y' ELSE 'N' END, 'N'), SRC.reopen_count = tmp_reopn.reopened_count, SRC.updated_on = current_timestamp;

-- Monthly base table age_since_creation update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on CAL.row_key = SRC.n_key
set SRC.age_since_creation =  coalesce(case when SRC.created_on > SRC.n_date then 0 
when LM.dimension_wh_code in ('RESOLVED', 'COMPLETED') then timestampdiff(second,coalesce(SRC.created_on,0),coalesce(convert_tz(SRC.resolved_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>') , case when LM.dimension_wh_code in ('COMPLETED','RESOLVED') then convert_tz(SRC.completed_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>') else null end, convert_tz(SRC.cancelled_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>')))
when LM.dimension_wh_code in ('CANCELLED') then timestampdiff(second,coalesce(SRC.created_on,0),convert_tz(coalesce(SRC.resolved_on, SRC.cancelled_on),'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'))
else timestampdiff(second,coalesce(SRC.created_on,0),coalesce(convert_tz(CAL.month_end_date,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),0)) end,0), SRC.updated_on = current_timestamp;

-- Monthly base table backup creation --

drop table if exists #STG_TABLE_SCHEMA.history_snapshot_monthly_temp_bkp;

create table #STG_TABLE_SCHEMA.history_snapshot_monthly_temp_bkp
select * from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp;

-- Monthly final table creation --

drop table if exists #STG_TABLE_SCHEMA.f_work_item_snpst_mn_base;

create table #STG_TABLE_SCHEMA.f_work_item_snpst_mn_base

select D.row_key as work_item_key,
SRC.age_since_creation as age_since_creation,
coalesce(ASGN.row_key, case when SRC.assignee is null then 0 else -1 end) as assigned_to_key,
SRC.cdctype as cdctype,
SRC.changed_by as changed_by,
coalesce(SRC.changed_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') as changed_on,
SRC.created_by as created_by,
coalesce(SRC.created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') as created_on,
SRC.due_on as due_date,
SRC.in_progress_on as in_progress_date,
SRC.resolved_on as resolved_date,
SRC.completed_on as completed_date,
SRC.cancelled_on as cancelled_date,
SRC.in_progress_flag as in_progress_flag,
SRC.proposed_flag as proposed_flag,
SRC.reopened_flag as reopened_flag,
SRC.overdue_flag as overdue_flag,
SRC.last_updated_on as last_updated_date,
SRC.n_date as n_date,
SRC.n_key as n_key,
coalesce(PROJ.row_key, case when SRC.project is null then 0 else -1 end) as project_key,
SRC.reassignment_count as reassignment_count,
SRC.reopen_count as reopen_count,
SRC.issueid as row_id,
cast((case when SRC.cdctype = 'D' then 'Y' else 'N' end) as char(1)) as soft_deleted_flag,
SRC.sourceinstance as source_id,
SRC.summary as summary,
SRC.work_item_earliest_fixed_version_key as work_item_earliest_fixed_version_key,
SRC.work_item_iteration_key as work_item_iteration_key,
coalesce(PRIO.row_key, case when SRC.work_item_priority is null then 0 else -1 end) as work_item_priority_src_key,
coalesce(STATUS.row_key, case when SRC.work_item_status is null then 0 else -1 end) as work_item_status_src_key,
coalesce(RESOLUTION.row_key, case when SRC.work_item_resolution is null then 0 else -1 end) as work_item_resolution_src_key,
SRC.business_value as business_value,
SRC.story_points as story_points


from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #DWH_TABLE_SCHEMA.d_work_item D
on SRC.issueid=D.row_id
and SRC.sourceinstance=D.source_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact ASGN
ON (concat('INTERNAL_CONTACT~', SRC.assignee) = ASGN.row_id 
AND SRC.sourceinstance=ASGN.source_id)
LEFT JOIN #DWH_TABLE_SCHEMA.d_project PROJ
ON (SRC.project = PROJ.row_id 
AND SRC.sourceinstance=PROJ.source_id)
left join #DWH_TABLE_SCHEMA.d_lov PRIO
on concat('PRIORITY~WORK_ITEM','~',upper(SRC.work_item_priority))=PRIO.src_rowid
and SRC.sourceinstance=PRIO.source_id
left join #DWH_TABLE_SCHEMA.d_lov STATUS
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status))=STATUS.src_rowid
and SRC.sourceinstance=STATUS.source_id
left join #DWH_TABLE_SCHEMA.d_lov RESOLUTION
on concat('RESOLUTION~WORK_ITEM','~',upper(SRC.work_item_resolution))=RESOLUTION.src_rowid
and SRC.sourceinstance=RESOLUTION.source_id;

insert into #STG_TABLE_SCHEMA.f_work_item_snpst_mn_base
(work_item_key, age_since_creation, assigned_to_key, cdctype, changed_by, changed_on, created_by, created_on, 
due_date, in_progress_date, resolved_date, completed_date, cancelled_date, in_progress_flag, proposed_flag , 
reopened_flag, overdue_flag, last_updated_date, n_date, n_key, project_key, reassignment_count, reopen_count, row_id, soft_deleted_flag, source_id, summary, 
work_item_earliest_fixed_version_key, work_item_iteration_key, work_item_priority_src_key, work_item_status_src_key, work_item_resolution_src_key, business_value, story_points)

select F.work_item_key as work_item_key,
F.age_since_creation as age_since_creation,
D.work_item_assigned_to_key as assigned_to_key,
F.cdctype as cdctype,
F.changed_by as changed_by,
F.changed_on as changed_on,
F.created_by as created_by,
F.created_on as created_on,
D.due_on as due_date,
D.work_start_on as in_progress_date,
D.resolved_on as resolved_date,
D.completed_on as completed_date,
D.cancelled_on as cancelled_date,
D.in_progress_flag as in_progress_flag,
D.proposed_flag as proposed_flag,
D.reopened_flag as reopened_flag,
D.overdue_flag as overdue_flag,
D.work_item_updated_on as last_updated_date,
CAL.month_start_date as n_date,
CAL.month_start_date_key as n_key,
F.project_key as project_key,
F.reassignment_count as reassignment_count,
F.reopen_count as reopen_count,
F.row_id as row_id,
F.soft_deleted_flag as soft_deleted_flag,
F.source_id as source_id,
D.short_description as summary,
D.earliest_fixed_version_key as work_item_earliest_fixed_version_key,
D.iteration_key as work_item_iteration_key,
D.work_item_priority_src_key as work_item_priority_src_key, 
D.work_item_status_src_key as work_item_status_src_key,
D.work_item_resolution_src_key as work_item_resolution_src_key,
F.business_value as business_value,
F.story_points as story_points

from #DWH_TABLE_SCHEMA.f_work_item F
left join  #DWH_TABLE_SCHEMA.d_work_item D
ON F.work_item_key = D.row_key
left join (
select source_id, max(lastupdated) as last_updated
from #DWH_TABLE_SCHEMA.d_o_data_freshness 
where sourcename = 'Jira_Tenant' group by source_id) ODF 
on ODF.source_id = F.source_id
left join  #DWH_TABLE_SCHEMA.d_calendar_date CAL
ON (date_format(ODF.last_updated,'%Y%m%d') = CAL.row_id);