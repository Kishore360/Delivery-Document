-- monthly base table creation --

drop table if exists #STG_TABLE_SCHEMA.history_snapshot_monthly_temp;

create table if not exists #STG_TABLE_SCHEMA.history_snapshot_monthly_temp (
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  issueid varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  n_date date DEFAULT NULL,
  n_key int(15) DEFAULT 0,
  lagging_count_of_month int(15) DEFAULT 0,
  wi_number varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  title varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  age_since_creation bigint(20) DEFAULT 0,
  assignee varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  project varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  wi_type varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  sourceinstance bigint(20) NOT NULL DEFAULT '0',
  work_item_status varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  work_item_severity varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  invalid_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  deferred_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  defect_regression_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
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

(issueid, wi_number, n_date, n_key, lagging_count_of_month, title, wi_type, sourceinstance, due_on,
assignee, project, work_item_status, work_item_severity, work_item_resolution, work_item_iteration_key, work_item_earliest_fixed_version_key, work_item_priority, 
business_value, story_points, created_on, created_by, changed_on, changed_by, cdctype, to_delete_flag, inserted_on, updated_on)

select issue.__numerify__primary_key, issue.id, calendar.calendar_date as n_date, calendar.row_key as n_key, calendar.lagging_count_of_month, 
issue.title, issue.workItemType, issue.sourceinstance, convert_tz(coalesce(issue.msvsts_scheduling_targetdate, issue.msvsts_cmmi_targetresolvedate),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') as due_on, issue.assignedToKey, issue.projectKey, issue.state, issue.msvsts_common_severity, issue.msvsts_common_resolvedreason, D.iteration_key, D.earliest_fixed_version_key,
issue.msvsts_common_priority, round(issue.msvsts_common_businessvalue,10), issue.msvsts_scheduling_storypoints, issue.createdDate, issue.createdByKey, issue.changedDate, issue.createdByKey, issue.cdctype, 
'N' as to_delete_flag, current_timestamp as inserted_on, current_timestamp as updated_on
from (select * from #STG_TABLE_SCHEMA.workitem_temp_azure where cdctype <> 'D') issue
left join #DWH_TABLE_SCHEMA.d_work_item D
on concat(issue.__numerify__primary_key, '')=D.row_id and issue.sourceinstance=D.source_id
cross join (
select distinct CAL_MN.calendar_date, CAL_MN.row_key, CAL.lagging_count_of_month
from #DWH_TABLE_SCHEMA.d_calendar_date CAL
left join  #DWH_TABLE_SCHEMA.d_calendar_date CAL_MN
ON (date_format(CAL.month_start_date,'%Y%m%d') = CAL_MN.row_id)
left join #DWH_TABLE_SCHEMA.d_calendar_date CAL_CURR
on (date_format(current_timestamp,'%Y%m%d') = CAL_CURR.row_id)
where CAL.lagging_count_of_month between (CAL_CURR.lagging_count_of_month + 1) and
(select retention
from #STG_TABLE_SCHEMA.lsm_ls_dw_aggregator where subject_area = 'AZURE' and target_table = 'f_work_item_snapshot_monthly')) calendar;

alter table #STG_TABLE_SCHEMA.history_snapshot_monthly_temp
ADD PRIMARY KEY (issueid, sourceinstance, n_key),
ADD INDEX first_idx (issueid,sourceinstance) USING BTREE,
ADD INDEX second_idx (issueid,sourceinstance,n_key) USING BTREE,
ADD INDEX third_idx (n_key) USING BTREE,
ADD INDEX fourth_idx (issueid,sourceinstance,n_key,lagging_count_of_month) USING BTREE;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp base
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
ON (base.n_key = CAL.row_key)
set base.to_delete_flag = 'Y', base.updated_on = current_timestamp
where date_format(convert_tz(base.created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') > date_format(CAL.month_end_date, '%Y-%m-%d'); 

use #STG_TABLE_SCHEMA;

delete base
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp base
where base.to_delete_flag = 'Y';

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp base
set sys_id = concat(issueid, '~', n_key);

-- monthly changelog table creation --

drop table if exists #STG_TABLE_SCHEMA.monthly_changelog_id;

create table if not exists #STG_TABLE_SCHEMA.monthly_changelog_id 

select SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, wi_update.field as `field`, max(wi_update.primary_sequence_id) as max_chnglog_id, min(wi_update.primary_sequence_id) as min_chnglog_id
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_azure_base wi_update
on SRC.issueid=wi_update.issueid and SRC.sourceinstance=wi_update.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where wi_update.field in ('STATUS', 'ASSIGNEE', 'PRIORITY', 'ITERATION', 'PROJECT', 'BUSINESS VALUE', 'STORY POINTS', 'RESOLUTION', 'SEVERITY', 'DUEDATE', 'TITLE') and wi_update.primary_sequence_id <> 0 
and date_format(convert_tz(wi_update.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d')
and coalesce(wi_update.`from`, wi_update.fromstring, '') <> coalesce(wi_update.`to`, wi_update.tostring,'')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, wi_update.field;

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
  
  PRIMARY KEY (changelogid, issueid, field, sourceinstance, n_key),
  KEY first_idx (issueid, sourceinstance, field, n_key) USING BTREE,
  KEY second_idx (field) USING BTREE,
  KEY third_idx (changelogid, issueid, sourceinstance, field) USING BTREE,
  KEY fourth_idx (changelogid, sourceinstance) USING BTREE
);

insert into #STG_TABLE_SCHEMA.changelog_monthly_temp 
(changelogid, issueid, sourceinstance, created, field, fromstring, tostring, `from`, `to`, n_key, lagging_count_of_month)

select distinct base.id as changelogid, base.issueid, base.sourceinstance, base.created, base.field, base.fromstring, base.tostring, base.`from`, base.`to`, monthly.n_key, monthly.lagging_count_of_month
from 
(select wi_update.primary_sequence_id as id, wi_update.issueid as issueid, wi_update.sourceinstance, wi_update.created as created, wi_update.field as `field`, 
wi_update.fromstring as fromstring, coalesce(wi_update.`from`, wi_update.fromstring) as `from`, wi_update.tostring as tostring, coalesce(wi_update.`to`, wi_update.tostring) as `to`
from #STG_TABLE_SCHEMA.issue_activity_azure_base wi_update
where wi_update.field in ('STATUS', 'ASSIGNEE', 'PRIORITY', 'ITERATION', 'PROJECT', 'RESOLUTION', 'SEVERITY', 'DUEDATE') and wi_update.primary_sequence_id <> 0 
and coalesce(wi_update.`from`, wi_update.fromstring, '') <> coalesce(wi_update.`to`, wi_update.tostring,'')
) base

join #STG_TABLE_SCHEMA.monthly_changelog_id monthly
on monthly.max_chnglog_id = base.id and monthly.issueid = base.issueid and monthly.sourceinstance = base.sourceinstance and monthly.field = base.field

union all 

select distinct base.id as changelogid, base.issueid, base.sourceinstance, base.created, base.field, base.fromstring, base.tostring, base.`from`, base.`to`, monthly.n_key, monthly.lagging_count_of_month
from 
(
select wi_update.primary_sequence_id as id, wi_update.issueid as issueid, wi_update.sourceinstance, wi_update.created as created, wi_update.field as `field`, 
wi_update.fromstring as fromstring, coalesce(wi_update.`from`, wi_update.fromstring) as `from`, wi_update.tostring as tostring, coalesce(wi_update.`to`, wi_update.tostring) as `to`
from #STG_TABLE_SCHEMA.issue_activity_azure_base wi_update
where wi_update.field in ('BUSINESS VALUE', 'STORY POINTS', 'TITLE') and wi_update.primary_sequence_id <> 0 
and coalesce(wi_update.`from`, wi_update.fromstring, '') <> coalesce(wi_update.`to`, wi_update.tostring,'')
) base

join #STG_TABLE_SCHEMA.monthly_changelog_id monthly
on monthly.max_chnglog_id = base.id and monthly.issueid = base.issueid and monthly.sourceinstance = base.sourceinstance and monthly.field = base.field;

-- monthly next changelog table creation --

drop table if exists #STG_TABLE_SCHEMA.next_changelog_val_month;

create table if not exists #STG_TABLE_SCHEMA.next_changelog_val_month 

select wi_update.primary_sequence_id AS changelogid, wi_update.issueid as issueid, wi_update.sourceinstance, wi_update.field as `field`, 
wi_update.fromstring as next_fromstring, coalesce(wi_update.`from`, wi_update.fromstring) as next_from, 
next_id.n_key, next_id.lagging_count_of_month
from #STG_TABLE_SCHEMA.issue_activity_azure_base wi_update
join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, wi_update.field as `field`, 
min(wi_update.primary_sequence_id) as nxt_chnglog_id
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_azure_base wi_update
on SRC.issueid=wi_update.issueid and SRC.sourceinstance=wi_update.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where wi_update.field in ('STATUS', 'ASSIGNEE', 'PRIORITY', 'ITERATION', 'PROJECT', 'RESOLUTION', 'SEVERITY', 'DUEDATE') and wi_update.primary_sequence_id <> 0 and 
date_format(convert_tz(wi_update.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') > date_format(cal.month_end_date, '%Y-%m-%d') 
and coalesce(wi_update.`from`, wi_update.fromstring, '') <> coalesce(wi_update.`to`, wi_update.tostring,'')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, wi_update.field
) next_id
on next_id.nxt_chnglog_id = wi_update.primary_sequence_id and next_id.sourceinstance = wi_update.sourceinstance and next_id.issueid = wi_update.issueid 
and next_id.field = wi_update.field
where wi_update.primary_sequence_id <> 0 and wi_update.field in ('STATUS', 'ASSIGNEE', 'PRIORITY', 'ITERATION', 'PROJECT', 'RESOLUTION', 'SEVERITY', 'DUEDATE') 

union all

select wi_update.primary_sequence_id AS changelogid, wi_update.issueid as issueid, wi_update.sourceinstance, wi_update.field as `field`, 
wi_update.fromstring as next_fromstring, coalesce(wi_update.`from`, wi_update.fromstring) as next_from, 
next_id.n_key, next_id.lagging_count_of_month
from #STG_TABLE_SCHEMA.issue_activity_azure_base wi_update
join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, wi_update.field as `field`, 
min(wi_update.primary_sequence_id) as nxt_chnglog_id
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_azure_base wi_update
on SRC.issueid=wi_update.issueid and SRC.sourceinstance=wi_update.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where wi_update.field in ('BUSINESS VALUE', 'STORY POINTS', 'TITLE') and wi_update.primary_sequence_id <> 0 and 
date_format(convert_tz(wi_update.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') > date_format(cal.month_end_date, '%Y-%m-%d') 
and coalesce(wi_update.`from`, wi_update.fromstring, '') <> coalesce(wi_update.`to`, wi_update.tostring,'')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, wi_update.field
) next_id
on next_id.nxt_chnglog_id = wi_update.primary_sequence_id and next_id.sourceinstance = wi_update.sourceinstance and next_id.issueid = wi_update.issueid 
and next_id.field = wi_update.field
where wi_update.primary_sequence_id <> 0 and wi_update.field in ('BUSINESS VALUE', 'STORY POINTS', 'TITLE');


alter table #STG_TABLE_SCHEMA.next_changelog_val_month
ADD PRIMARY KEY (issueid, changelogid, field, sourceinstance, n_key),
ADD INDEX first_idx (issueid, sourceinstance, field, n_key) USING BTREE,
ADD INDEX second_idx (field) USING BTREE,
ADD INDEX third_idx (changelogid, issueid, sourceinstance, field) USING BTREE,
ADD INDEX fourth_idx (changelogid, sourceinstance) USING BTREE;

-- Updating to initial value --

drop table if exists #STG_TABLE_SCHEMA.azure_initial_values_temp;

create table if not exists #STG_TABLE_SCHEMA.azure_initial_values_temp
select organizationKey as org, workItemKey as issueid, sourceinstance as sourceinstance, rev as sequence_id, 
max(case when fieldName in ('state') then coalesce(newValueKey, newValue) else null end) as work_item_status,
max(case when fieldName in ('iterationIdKey') then coalesce(newValueKey, newValue) else null end) as work_item_iteration_key,
max(case when fieldName in ('msvsts_scheduling_storypoints') then coalesce(newValueKey, newValue) else null end) as story_points,
max(case when fieldName in ('msvsts_scheduling_originalestimate') then coalesce(newValueKey, newValue) else null end) as time_estimate,
max(case when fieldName in ('msvsts_common_businessvalue') then coalesce(newValueKey, newValue) else null end) as business_value,
max(case when fieldName in ('msvsts_common_priority') then coalesce(newValueKey, newValue) else null end) as work_item_priority,
max(case when fieldName in ('assignedToKey') then coalesce(newValueKey, newValue) else null end) as assignee,
max(case when fieldName in ('workItemType') then coalesce(newValueKey, newValue) else null end) as work_item_type,
max(case when fieldName in ('teamProject') then coalesce(newValueKey, newValue) else null end) as project,
max(case when fieldName in ('msvsts_common_severity') then coalesce(newValueKey, newValue) else null end) as severity,
max(case when fieldName in ('msvsts_common_resolvedreason') then coalesce(newValueKey, newValue) else null end) as resolution,
max(case when fieldName in ('msvsts_scheduling_targetdate', 'msvsts_cmmi_targetresolvedate') then concat (trim(SUBSTRING_INDEX(coalesce(newValueKey, newValue), 'T', 1)), ' ', trim(time_format(SUBSTRING_INDEX(SUBSTRING_INDEX(coalesce(newValueKey, newValue), 'T', -1), 'Z', 1), '%H:%i:%s'))) else null end) as duedate
from #MDS_TABLE_SCHEMA.azure_workitem_update_final wi_update
where fieldName in ('state', 'assignedToKey', 'iterationIdKey', 'msvsts_common_businessvalue', 'msvsts_common_priority', 'msvsts_scheduling_originalestimate', 'msvsts_scheduling_storypoints', 'teamProject', 'msvsts_common_severity', 'workItemType', 'msvsts_common_resolvedreason', 'msvsts_scheduling_targetdate', 'msvsts_cmmi_targetresolvedate')
and wi_update.rev = 1
group by organizationKey, workItemKey, sourceinstance, rev;

alter table #STG_TABLE_SCHEMA.azure_initial_values_temp
ADD PRIMARY KEY (org, issueid, sourceinstance, sequence_id);

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.azure_initial_values_temp base
on SRC.issueid = base.issueid and SRC.sourceinstance = base.sourceinstance
set SRC.assignee = base.assignee, SRC.story_points = base.story_points, SRC.business_value = base.business_value, SRC.work_item_severity = base.severity, SRC.work_item_resolution = base.resolution, SRC.due_on = base.duedate;

-- monthly base table assignee update --

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

-- monthly base table business value update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.business_value = coalesce(LKP.tostring, LKP.fromstring, SRC.business_value), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('business value');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_month LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.business_value = coalesce(LKP2.next_fromstring, SRC.business_value), SRC.updated_on = current_timestamp
where lower(LKP2.field) in ('business value') and coalesce(LKP2.next_fromstring, '') <> coalesce(SRC.business_value, '');

-- monthly base table duedate update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key and lower(LKP.field) in ('duedate')
left join #STG_TABLE_SCHEMA.workitem_temp_azure issue
on issue.__numerify__primary_key = SRC.issueid and SRC.sourceinstance = issue.sourceinstance
set SRC.due_on = convert_tz(coalesce(LKP.`to`, LKP.`from`, SRC.due_on),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), SRC.updated_on = current_timestamp;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_month LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.due_on = coalesce(convert_tz(LKP2.next_from,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), SRC.due_on), SRC.updated_on = current_timestamp
where lower(LKP2.field) in ('duedate') and SRC.due_on <> convert_tz(LKP2.next_from,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>');

-- monthly base table fix version update --

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
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key and lower(LKP2.field) in ('fix version')
left join #DWH_TABLE_SCHEMA.d_work_item_version DFV
on case when LKP2.next_from is null then 0 else LKP2.next_from end = DFV.row_id
left join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key and lower(LKP.field) in ('fix version')
set SRC.work_item_earliest_fixed_version_key = coalesce(DFV.row_key,case when LKP2.next_from is null then 0 else -1 end), SRC.updated_on = current_timestamp
where lower(LKP2.field) in ('fix version') and (DFV.row_key <> SRC.work_item_earliest_fixed_version_key or LKP2.next_from is null)
and LKP.issueid is null;

-- monthly base table priority update --

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
where lower(LKP2.field) in ('priority') and LKP2.next_from <> SRC.work_item_priority;

-- monthly base table project update --

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
where lower(LKP2.field) in ('project') and LKP2.next_from <> SRC.project;

-- monthly base table resolution update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.work_item_resolution = coalesce(LKP.`to`, SRC.work_item_resolution), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('resolution');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_month LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.work_item_resolution = coalesce(LKP2.next_from, SRC.work_item_resolution), SRC.updated_on = current_timestamp
where lower(LKP2.field) in ('resolution') and LKP2.next_from <> SRC.work_item_resolution;

-- monthly base table severity update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.work_item_severity = coalesce(LKP.`to`, SRC.work_item_severity), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('severity');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_month LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.work_item_severity = coalesce(LKP2.next_from, SRC.work_item_severity), SRC.updated_on = current_timestamp
where lower(LKP2.field) in ('severity') and LKP2.next_from <> SRC.work_item_severity;

-- monthly base table story points update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.story_points = coalesce(LKP.tostring, LKP.fromstring, SRC.story_points), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('story points');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_month LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.story_points = coalesce(LKP2.next_fromstring, SRC.story_points), SRC.updated_on = current_timestamp
where lower(LKP2.field) in ('story points') and SRC.story_points <> LKP2.next_fromstring;

-- monthly base table work_item_iteration_key update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join (
select FACT.work_item_key, base.issueid, FACT.source_id, base.n_key, FACT.task_attribute_wh_new_value_key
from #DWH_TABLE_SCHEMA.f_work_item_activity FACT
left join (
select FACT.work_item_key, SRC.issueid, FACT.source_id, FACT.task_attribute_wh_name, SRC.n_key, max(FACT.primary_sequence_id) max_sequence_id
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #DWH_TABLE_SCHEMA.d_work_item D
on SRC.issueid = D.row_id and SRC.sourceinstance = D.source_id
left join #DWH_TABLE_SCHEMA.f_work_item_activity FACT
on FACT.work_item_key = D.row_key and FACT.source_id = D.source_id and FACT.task_attribute_wh_name = 'ITERATION'
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where FACT.task_attribute_wh_name = 'ITERATION' and date_format(FACT.started_on, '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d')
group by FACT.work_item_key, SRC.issueid, FACT.source_id, FACT.task_attribute_wh_name, SRC.n_key
) base
on FACT.work_item_key = base.work_item_key and FACT.source_id = base.source_id and FACT.task_attribute_wh_name = base.task_attribute_wh_name 
and FACT.primary_sequence_id = base.max_sequence_id and FACT.task_attribute_wh_name = 'ITERATION'
where base.n_key is not null) LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.source_id and SRC.n_key = LKP.n_key
set SRC.work_item_iteration_key = coalesce(LKP.task_attribute_wh_new_value_key, 0);

-- monthly base table status update --

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
where lower(LKP2.field) in ('status') and LKP2.next_from <> SRC.work_item_status;

-- monthly base table title update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.title = coalesce(LKP.tostring, LKP.fromstring, SRC.title), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('title');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_month LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.title = coalesce(LKP2.next_fromstring, SRC.title), SRC.updated_on = current_timestamp
where lower(LKP2.field) in ('title') and LKP2.next_fromstring <> SRC.title;

-- monthly base table completed_on update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC

join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id and LM.dimension_wh_code IN ('COMPLETED')

left join #STG_TABLE_SCHEMA.workitem_temp_azure issue
on SRC.issueid = issue.__numerify__primary_key and issue.sourceinstance = SRC.sourceinstance

left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key

join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, max(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as completed_on
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_azure_base LKP
on SRC.issueid=LKP.issueid and SRC.sourceinstance=LKP.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(LKP.`to`))=LM.src_rowid
and LKP.sourceinstance=LM.source_id
where lower(LKP.field) = 'status' and LM.dimension_wh_code='COMPLETED' and date_format(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') and coalesce(LKP.`from`,'') <> coalesce(LKP.`to`,'')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp
on tmp.issueid = SRC.issueid and tmp.sourceinstance = SRC.sourceinstance and tmp.n_key = SRC.n_key

set SRC.completed_on = case when LM.dimension_wh_code IN ('COMPLETED') then coalesce(case when date_format(tmp.completed_on, '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') 
then tmp.completed_on else null end, convert_tz(issue.msvsts_common_closeddate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') ) else null end, SRC.updated_on = current_timestamp;

-- monthly base table in_progress_on update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC

join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, min(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as in_prog_on
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_azure_base LKP
on SRC.issueid=LKP.issueid and SRC.sourceinstance=LKP.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(LKP.`from`))=LM.src_rowid
and LKP.sourceinstance=LM.source_id
where lower(LKP.field) = 'status' and LM.dimension_wh_code IN ('PROPOSED') and date_format(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') and coalesce(LKP.`from`,'') <> coalesce(LKP.`to`,'')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp
on tmp.issueid = SRC.issueid and tmp.sourceinstance = SRC.sourceinstance and tmp.n_key = SRC.n_key

set SRC.in_progress_on = tmp.in_prog_on, SRC.updated_on = current_timestamp;

-- monthly base table last_updated_on update --
use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join 
(
select SQ.issueid, SQ.sourceinstance, SQ.n_key, SQ.authorkey, max(SQ.last_updated_on) as last_updated_on
from (
select SRC.issueid, SRC.sourceinstance, SRC.n_key, LKP.authorkey, max(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as last_updated_on
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join (select rev.workItemKey as issueid,
rev.sourceinstance as sourceinstance,
rev.fieldName as field,
rev_prev.revisedDate as created,
rev.rev as sequence_id,
rev.revisedByKey as authorkey
from #MDS_TABLE_SCHEMA.azure_workitem_update_final rev
left join 
(select workItemKey, sourceinstance, rev, max(revisedDate) as revisedDate
from #MDS_TABLE_SCHEMA.azure_workitem_update_final
group by workItemKey, sourceinstance, rev) rev_prev
on rev_prev.workItemKey = rev.workItemKey and rev_prev.sourceinstance=rev.sourceinstance and rev.rev = rev_prev.rev + 1
where rev.cdctype <> 'D' and rev.rev <> 1
order by rev.rev) LKP
on SRC.issueid=LKP.issueid and SRC.sourceinstance=LKP.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where date_format(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d')
group by SRC.issueid, SRC.sourceinstance, SRC.n_key
) SQ
group by SQ.issueid, SQ.sourceinstance, SQ.n_key
) base
on base.issueid = SRC.issueid and base.sourceinstance = SRC.sourceinstance and base.n_key = SRC.n_key
left join #DWH_TABLE_SCHEMA.d_work_item D
on concat(SRC.issueid, '') = D.row_id and SRC.sourceinstance = D.source_id
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key

set SRC.last_updated_on = case when date_format(D.changed_on, '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') then D.changed_on else coalesce(base.last_updated_on, D.created_on) end, SRC.changed_by = base.authorkey, SRC.updated_on = current_timestamp;

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
set SRC.changed_on = SRC.last_updated_on;

-- monthly base table resolved_on update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC

left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key

join #STG_TABLE_SCHEMA.workitem_temp_azure issue
on issue.__numerify__primary_key = SRC.issueid and issue.sourceinstance = SRC.sourceinstance

join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id and LM.dimension_wh_code IN ('RESOLVED' , 'COMPLETED', 'CANCELLED')

left join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, max(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as resolved_on
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_azure_base LKP
on SRC.issueid=LKP.issueid and SRC.sourceinstance=LKP.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(LKP.`to`))=LM.src_rowid
and LKP.sourceinstance=LM.source_id
where lower(LKP.field) = 'status' and LM.dimension_wh_code IN ('RESOLVED') and date_format(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') and coalesce(LKP.`from`,'') <> coalesce(LKP.`to`,'')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_res
on tmp_res.issueid = SRC.issueid and tmp_res.sourceinstance = SRC.sourceinstance and tmp_res.n_key = SRC.n_key

left join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, max(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as cancelled_on
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_azure_base LKP
on SRC.issueid=LKP.issueid and SRC.sourceinstance=LKP.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(LKP.`to`))=LM.src_rowid
and LKP.sourceinstance=LM.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map LM_RES
on concat('RESOLUTION~WORK_ITEM','~',upper(SRC.work_item_resolution)) = LM_RES.src_rowid
and SRC.sourceinstance=LM_RES.source_id
where lower(LKP.field) = 'status' and LM.dimension_wh_code = 'CANCELLED' and date_format(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') and coalesce(LKP.`from`,'') <> coalesce(LKP.`to`,'')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_cncl
on tmp_cncl.issueid = SRC.issueid and tmp_cncl.sourceinstance = SRC.sourceinstance and tmp_cncl.n_key = SRC.n_key

set SRC.resolved_on = case when LM.dimension_wh_code IN ('RESOLVED' , 'COMPLETED', 'CANCELLED') 
then coalesce(case when date_format(convert_tz(issue.msvsts_common_resolveddate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') 
then convert_tz(issue.msvsts_common_resolveddate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') else null end, tmp_res.resolved_on, SRC.completed_on,tmp_cncl.cancelled_on) else null end, SRC.updated_on = current_timestamp;

-- monthly base table cancelled_on update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC

join #DWH_TABLE_SCHEMA.d_lov_map LM_ST
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM_ST.src_rowid
and SRC.sourceinstance=LM_ST.source_id and LM_ST.dimension_wh_code in ('RESOLVED','CANCELLED','COMPLETED')

left join #DWH_TABLE_SCHEMA.d_lov_map LM_RES
on concat('RESOLUTION~WORK_ITEM','~',upper(SRC.work_item_resolution)) = LM_RES.src_rowid
and SRC.sourceinstance=LM_RES.source_id

left join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, max(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as cancelled_on
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_azure_base LKP
on SRC.issueid=LKP.issueid and SRC.sourceinstance=LKP.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(LKP.`to`))=LM.src_rowid
and LKP.sourceinstance=LM.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map LM_RES
on concat('RESOLUTION~WORK_ITEM','~',upper(SRC.work_item_resolution)) = LM_RES.src_rowid
and SRC.sourceinstance=LM_RES.source_id
where lower(LKP.field) = 'status' and (LM.dimension_wh_code = 'CANCELLED' or LM_RES.dimension_wh_code in ('CANCELLED')) and date_format(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') and coalesce(LKP.`from`,'') <> coalesce(LKP.`to`,'')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_cncl
on tmp_cncl.issueid = SRC.issueid and tmp_cncl.sourceinstance = SRC.sourceinstance and tmp_cncl.n_key = SRC.n_key

set SRC.cancelled_on = case when (LM_ST.dimension_wh_code in ('CANCELLED') AND (LM_RES.dimension_wh_code != 'CANCELLED' OR LM_RES.dimension_wh_code IS NULL)) then tmp_cncl.cancelled_on
when LM_ST.dimension_wh_code in ('RESOLVED','CANCELLED','COMPLETED') AND LM_RES.dimension_wh_code  in ('CANCELLED') then COALESCE(SRC.resolved_on,tmp_cncl.cancelled_on)
else null end, SRC.updated_on = current_timestamp;

-- monthly base table overdue_flag update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC

join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id

join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cal.row_key = SRC.n_key

set SRC.overdue_flag = coalesce(case when SRC.due_on is null then 'N' when LM.dimension_wh_code IN ('PROPOSED','IN PROGRESS') and coalesce(SRC.due_on,0) < cal.month_end_date THEN 'Y' ELSE 'N' END, 'N'), SRC.updated_on = current_timestamp;

-- monthly base table proposed_flag update --

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC

join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id

set SRC.proposed_flag = coalesce(case when LM.dimension_wh_code IN ('PROPOSED') THEN 'Y' ELSE 'N' END, 'N'), SRC.updated_on = current_timestamp;

-- monthly base table in_progress_flag update --

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id

set SRC.in_progress_flag = coalesce(case when LM.dimension_wh_code IN ('IN PROGRESS') THEN 'Y' ELSE 'N' END, 'N'), SRC.updated_on = current_timestamp;

-- monthly base table invalid_flag update -- wi_type

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC

join #DWH_TABLE_SCHEMA.d_lov_map TYP
on concat('TYPE~WORK_ITEM~',upper(SRC.wi_type))=TYP.src_rowid and SRC.sourceinstance = TYP.source_id
 
 left join #DWH_TABLE_SCHEMA.d_lov_map DM
on concat('STATUS~WORK_ITEM~',upper(SRC.work_item_status))=DM.src_rowid and SRC.sourceinstance = DM.source_id

left join #DWH_TABLE_SCHEMA.d_lov_map RES
on concat('RESOLUTION~WORK_ITEM~',upper(SRC.work_item_resolution))=RES.src_rowid and SRC.sourceinstance = RES.source_id

set SRC.invalid_flag = coalesce(CASE when ((DM.dimension_wh_code in ('COMPLETED', 'RESOLVED','CANCELLED') and RES.dimension_wh_code in ('CANCELLED')) or DM.dimension_wh_code in ('CANCELLED')) then 'Y' ELSE 'N' end,'N' ), SRC.updated_on = current_timestamp;

-- monthly base table deferred_flag update --

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC

left join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, count(LKP.issueid) deferred_cn
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_azure_base LKP
on SRC.issueid=LKP.issueid and SRC.sourceinstance=LKP.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map LM_TO
on concat('RESOLUTION~WORK_ITEM~',upper(LKP.to))=LM_TO.src_rowid and LKP.sourceinstance = LM_TO.source_id
where upper(LKP.field) = 'RESOLUTION' and LM_TO.dimension_wh_code in ('DEFERRED') and date_format(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) deferred_cn
on deferred_cn.issueid = SRC.issueid and deferred_cn.sourceinstance = SRC.sourceinstance and deferred_cn.n_key = SRC.n_key

join #DWH_TABLE_SCHEMA.d_lov_map TYP
on concat('TYPE~WORK_ITEM~',upper(SRC.wi_type))=TYP.src_rowid and SRC.sourceinstance = TYP.source_id
 
set SRC.deferred_flag = coalesce(CASE when deferred_cn.deferred_cn > 0 then 'Y' ELSE 'N' end,'N' ), SRC.updated_on = current_timestamp;

-- monthly base table defect_regression_flag update --

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id

set SRC.defect_regression_flag = coalesce(case when LM.dimension_wh_code IN ('IN PROGRESS') THEN 'Y' ELSE 'N' END, 'N'), SRC.updated_on = current_timestamp;

-- monthly base table reassignment_count update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC

join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, count(LKP.issueid) as reassignment_count
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_azure_base LKP
on SRC.issueid=LKP.issueid and SRC.sourceinstance=LKP.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where lower(LKP.`field`) = 'assignee' and date_format(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') and (LKP.fromstring is not null or LKP.`from` is not null)
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_reasgn
on tmp_reasgn.issueid = SRC.issueid and tmp_reasgn.sourceinstance = SRC.sourceinstance and tmp_reasgn.n_key = SRC.n_key

set SRC.reassignment_count = tmp_reasgn.reassignment_count, SRC.updated_on = current_timestamp;

-- monthly base table reopened_flag reopen_count update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC

join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, count(1) as reopened_count
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_azure_base LKP
on SRC.issueid=LKP.issueid and SRC.sourceinstance=LKP.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map LM_TO
on concat('STATUS~WORK_ITEM~',upper(LKP.`to`))=LM_TO.src_rowid
and LKP.sourceinstance=LM_TO.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map LM_FROM
on concat('STATUS~WORK_ITEM~',upper(LKP.`from`))=LM_FROM.src_rowid
and LKP.sourceinstance=LM_FROM.source_id
where lower(LKP.field) = 'status' and (LM_FROM.dimension_wh_code in ('COMPLETED','RESOLVED','CANCELLED') and LM_TO.dimension_wh_code in ('PROPOSED', 'IN PROGRESS')) and date_format(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_reopn
on tmp_reopn.issueid = SRC.issueid and tmp_reopn.sourceinstance = SRC.sourceinstance and tmp_reopn.n_key = SRC.n_key

set SRC.reopened_flag = coalesce(case when tmp_reopn.reopened_count > 0 THEN 'Y' ELSE 'N' END, 'N'), SRC.reopen_count = tmp_reopn.reopened_count, SRC.updated_on = current_timestamp;

-- monthly base table age_since_creation update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on CAL.row_key = SRC.n_key
set SRC.age_since_creation =  coalesce(case when date_format(convert_tz(SRC.created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') > CAL.month_end_date then 0 
when LM.dimension_wh_code in ('RESOLVED', 'COMPLETED') then timestampdiff(second,coalesce(SRC.created_on,''),coalesce(convert_tz(SRC.resolved_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>') , case when LM.dimension_wh_code in ('COMPLETED','RESOLVED') then convert_tz(SRC.completed_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>') else null end, convert_tz(SRC.cancelled_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>')))
when LM.dimension_wh_code in ('CANCELLED') then timestampdiff(second,coalesce(SRC.created_on,''),convert_tz(coalesce(SRC.resolved_on, SRC.cancelled_on),'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'))
else timestampdiff(second,coalesce(SRC.created_on,''),coalesce(convert_tz(timestamp(CAL.month_end_date),'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),0)) + 86400 end,0), SRC.updated_on = current_timestamp;

-- monthly base table backup creation --

drop table if exists #STG_TABLE_SCHEMA.history_snapshot_monthly_temp_bkp;

create table #STG_TABLE_SCHEMA.history_snapshot_monthly_temp_bkp
select * from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp;

-- monthly final table creation --

drop table if exists #STG_TABLE_SCHEMA.f_work_item_snpst_mn_base;

create table #STG_TABLE_SCHEMA.f_work_item_snpst_mn_base (
  work_item_key int(15) DEFAULT 0, 
  age_since_creation bigint(30) DEFAULT 0, 
  assigned_to_key int(15) DEFAULT 0, 
  cdctype varchar(1) COLLATE utf8_unicode_ci DEFAULT null,
  changed_by varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  changed_on datetime DEFAULT NULL,
  created_by varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  created_on datetime DEFAULT NULL,
  due_date datetime DEFAULT NULL,
  in_progress_date datetime DEFAULT NULL,
  resolved_date datetime DEFAULT NULL,
  completed_date datetime DEFAULT NULL,
  cancelled_date DATETIME DEFAULT NULL,
  in_progress_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  proposed_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  reopened_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  overdue_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  invalid_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  deferred_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  defect_regression_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  last_updated_date datetime DEFAULT NULL,
  n_date date DEFAULT NULL,
  n_key int(15) DEFAULT 0,
  project_key int(15) DEFAULT 0,
  reassignment_count int(15) DEFAULT 0,
  reopen_count int(15) DEFAULT 0,
  row_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  soft_deleted_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  source_id bigint(20) NOT NULL DEFAULT 0,
  title varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  work_item_earliest_fixed_version_key int(15) DEFAULT 0,
  work_item_iteration_key int(15) DEFAULT 0,
  work_item_priority_src_key int(15) DEFAULT 0,
  work_item_status_src_key int(15) DEFAULT 0,
  work_item_resolution_src_key int(15) DEFAULT 0,
  work_item_severity_src_key int(15) DEFAULT 0,
  business_value DECIMAL(28,10) DEFAULT NULL,
  story_points DECIMAL(28,10) DEFAULT NULL
  );
  
insert into #STG_TABLE_SCHEMA.f_work_item_snpst_mn_base
(work_item_key, age_since_creation, assigned_to_key, cdctype, changed_by, changed_on, created_by, created_on, due_date, in_progress_date, resolved_date, completed_date, cancelled_date,
 in_progress_flag, proposed_flag, reopened_flag, overdue_flag, invalid_flag, deferred_flag, defect_regression_flag, 
 last_updated_date, n_date, n_key, project_key, reassignment_count, reopen_count, row_id, soft_deleted_flag, source_id, title, 
 work_item_earliest_fixed_version_key, work_item_iteration_key, work_item_priority_src_key, work_item_status_src_key, work_item_resolution_src_key, work_item_severity_src_key, business_value, story_points)

select D.row_key as work_item_key,
SRC.age_since_creation as age_since_creation,
coalesce(ASGN.row_key, case when SRC.assignee is null then 0 else -1 end) as assigned_to_key,
SRC.cdctype as cdctype,
SRC.changed_by as changed_by,
SRC.changed_on as changed_on,
SRC.created_by as created_by,
convert_tz(SRC.created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') as created_on,
SRC.due_on as due_date,
SRC.in_progress_on as in_progress_date,
SRC.resolved_on as resolved_date,
SRC.completed_on as completed_date,
SRC.cancelled_on as cancelled_date,
SRC.in_progress_flag as in_progress_flag,
SRC.proposed_flag as proposed_flag,
SRC.reopened_flag as reopened_flag,
SRC.overdue_flag as overdue_flag,
SRC.invalid_flag as invalid_flag, 
SRC.deferred_flag as deferred_flag,
SRC.defect_regression_flag as defect_regression_flag,
SRC.last_updated_on as last_updated_date,
SRC.n_date as n_date,
SRC.n_key as n_key,
coalesce(PROJ.row_key, case when SRC.project is null then 0 else -1 end) as project_key,
SRC.reassignment_count as reassignment_count,
SRC.reopen_count as reopen_count,
SRC.issueid as row_id,
cast((case when SRC.cdctype = 'D' then 'Y' else 'N' end) as char(1)) as soft_deleted_flag,
SRC.sourceinstance as source_id,
SRC.title as title,
SRC.work_item_earliest_fixed_version_key as work_item_earliest_fixed_version_key,
SRC.work_item_iteration_key as work_item_iteration_key,
coalesce(PRIO.row_key, case when SRC.work_item_priority is null then 0 else -1 end) as work_item_priority_src_key,
coalesce(STATUS.row_key, case when SRC.work_item_status is null then 0 else -1 end) as work_item_status_src_key,
coalesce(RESOLUTION.row_key, case when SRC.work_item_resolution is null then 0 else -1 end) as work_item_resolution_src_key,
coalesce(SEVERITY.row_key, case when SRC.work_item_severity is null then 0 else -1 end) as work_item_severity_src_key,
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
left join #DWH_TABLE_SCHEMA.d_lov SEVERITY
on concat('SEVERITY~WORK_ITEM','~',upper(SRC.work_item_severity))=SEVERITY.src_rowid
and SRC.sourceinstance=SEVERITY.source_id;

insert into #STG_TABLE_SCHEMA.f_work_item_snpst_mn_base
(work_item_key, age_since_creation, assigned_to_key, cdctype, changed_by, changed_on, created_by, created_on, due_date, in_progress_date, resolved_date, completed_date, cancelled_date, 
in_progress_flag, proposed_flag, reopened_flag, overdue_flag, invalid_flag, deferred_flag, defect_regression_flag, 
last_updated_date, n_date, n_key, project_key, reassignment_count, reopen_count, row_id, soft_deleted_flag, source_id, title, 
work_item_earliest_fixed_version_key, work_item_iteration_key, work_item_priority_src_key, work_item_status_src_key, work_item_resolution_src_key, work_item_severity_src_key, business_value, story_points)

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
D.invalid_flag as invalid_flag,
D.deferred_flag as deferred_flag,
D.defect_regression_flag as defect_regression_flag,
D.work_item_updated_on as last_updated_date,
CAL.month_start_date as n_date,
CAL.month_start_date_key as n_key,
F.project_key as project_key,
F.reassignment_count as reassignment_count,
F.reopen_count as reopen_count,
F.row_id as row_id,
F.soft_deleted_flag as soft_deleted_flag,
F.source_id as source_id,
D.short_description as title,
D.earliest_fixed_version_key as work_item_earliest_fixed_version_key,
D.iteration_key as work_item_iteration_key,
D.work_item_priority_src_key as work_item_priority_src_key, 
D.work_item_status_src_key as work_item_status_src_key,
D.work_item_resolution_src_key as work_item_resolution_src_key,
D.work_item_severity_src_key as work_item_severity_src_key,
F.business_value as business_value,
F.story_points as story_points

from #DWH_TABLE_SCHEMA.f_work_item F
left join  #DWH_TABLE_SCHEMA.d_work_item D
ON F.work_item_key = D.row_key
left join (
select source_id, max(lastupdated) as last_updated
from #DWH_TABLE_SCHEMA.d_o_data_freshness 
where sourcename = 'Azure_Tenant' and soft_deleted_flag = 'N' group by source_id) ODF 
on ODF.source_id = F.source_id
left join  #DWH_TABLE_SCHEMA.d_calendar_date CAL
ON (date_format(current_timestamp,'%Y%m%d') = CAL.row_id)
where D.soft_deleted_flag <> 'Y';