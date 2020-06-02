-- Weekly base table creation --

drop table if exists #STG_TABLE_SCHEMA.history_snapshot_weekly_temp;

create table if not exists #STG_TABLE_SCHEMA.history_snapshot_weekly_temp (
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  issueid varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  n_date date DEFAULT NULL,
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
  invalid_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
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
issue.summary, issue.issuetype_id, issue.sourceinstance, convert_tz(issue.duedate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') as due_on, issue.assigneeRef, issue.project_id, issue.status_id, issue.resolution_id, D.iteration_key, D.earliest_fixed_version_key,
issue.priority_id, round(EXT.customfield_10005,10) as business_value, EXT.customfield_10004 as story_points, issue.created, issue.creatorRef, issue.updated, issue.creatorRef, issue.cdctype, 
'N' as to_delete_flag, current_timestamp as inserted_on, current_timestamp as updated_on
from #MDS_TABLE_SCHEMA.issue_final issue
join #MDS_TABLE_SCHEMA.issue_ext_final EXT
on issue.id = EXT.record_id and issue.sourceinstance = EXT.sourceinstance
left join #DWH_TABLE_SCHEMA.d_work_item D
on concat(issue.id, '')=D.row_id and issue.sourceinstance=D.source_id
cross join (
select distinct CAL_WK.calendar_date, CAL_WK.row_key, CAL.lagging_count_of_weeks
from #DWH_TABLE_SCHEMA.d_calendar_date CAL
left join  #DWH_TABLE_SCHEMA.d_calendar_date CAL_WK
ON (date_format(CAL.week_start_date,'%Y%m%d') = CAL_WK.row_id)
join (select source_id, current_flag, target_table, retention, subject_area, calendar_code, day_of_week_month 
from #STG_TABLE_SCHEMA.lsm_ls_dw_aggregator where target_table = 'f_work_item_snapshot_weekly' and subject_area = 'JIRA') lsm_aggregator
on CAL.calendar_code = lsm_aggregator.calendar_code and lsm_aggregator.target_table = 'f_work_item_snapshot_weekly' and lsm_aggregator.subject_area = 'JIRA' 
where CAL.lagging_count_of_weeks between 1 and lsm_aggregator.retention) calendar;

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