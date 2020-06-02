-- Monthly changelog table creation --

drop table if exists #STG_TABLE_SCHEMA.monthly_changelog_id;

create table if not exists #STG_TABLE_SCHEMA.monthly_changelog_id 

select SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, chnglog.field, max(chnglog.issuechangelogid) as max_chnglog_id, min(chnglog.issuechangelogid) as min_chnglog_id
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp chnglog
on SRC.issueid=chnglog.issueid and SRC.sourceinstance=chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where chnglog.field in ('STATUS', 'ASSIGNEE', 'PRIORITY', 'ITERATION', 'DUEDATE', 'PROJECT', 'RESOLUTION') and chnglog.primary_sequence_id <> 0 and
date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') and coalesce(chnglog.`from`, '') <> coalesce(chnglog.`to`, '')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, chnglog.field

union all

select base.issueid, base.sourceinstance, base.n_key, base.lagging_count_of_month, base.field, cnglg_max.id as max_chnglog_id, cnglg_min.id as min_chnglog_id
from (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, chnglog.field, min(coalesce(chnglog.`to`, chnglog.`from`)) as min_chnglog_id,
max(coalesce(chnglog.`to`, chnglog.`from`)) as max_chnglog_id
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp chnglog
on SRC.issueid=chnglog.issueid and SRC.sourceinstance=chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where chnglog.field in ('FIX VERSION') and chnglog.primary_sequence_id <> 0 and
date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') 
and coalesce(chnglog.`from`, '') <> coalesce(chnglog.`to`, '')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, chnglog.field
) base
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on base.n_key = cal.row_key
left join 
(
select chnglog.id, chnglog.issueid, chnglog.sourceinstance, chnglog.field, chnglog.`to`, chnglog.`from`, chnglog.created
from #STG_TABLE_SCHEMA.issue_activity_temp chnglog
where chnglog.field in ('FIX VERSION') and chnglog.primary_sequence_id <> 0 and
coalesce(chnglog.`from`, '') <> coalesce(chnglog.`to`, '')
) cnglg_max
on coalesce(cnglg_max.to, cnglg_max.from, '') = base.min_chnglog_id and cnglg_max.issueid = base.issueid 
and cnglg_max.sourceinstance = base.sourceinstance and cnglg_max.field = base.field 
and date_format(convert_tz(cnglg_max.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') 
left join 
(
select chnglog.id, chnglog.issueid, chnglog.sourceinstance, chnglog.field, chnglog.`to`, chnglog.`from`, chnglog.created
from #STG_TABLE_SCHEMA.issue_activity_temp chnglog
where chnglog.field in ('FIX VERSION') and chnglog.primary_sequence_id <> 0 and
coalesce(chnglog.`from`, '') <> coalesce(chnglog.`to`, '')
) cnglg_min
on coalesce(cnglg_min.from, cnglg_min.to, '') = base.min_chnglog_id and cnglg_min.issueid = base.issueid 
and cnglg_min.sourceinstance = base.sourceinstance and cnglg_min.field = base.field 
and date_format(convert_tz(cnglg_min.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') 


union all

select SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, chnglog.field, max(chnglog.issuechangelogid) as max_chnglog_id, min(chnglog.issuechangelogid) as min_chnglog_id
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp chnglog
on SRC.issueid=chnglog.issueid and SRC.sourceinstance=chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where chnglog.field in ('BUSINESS VALUE', 'STORY POINTS', 'SUMMARY') and chnglog.primary_sequence_id <> 0 and
date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') and coalesce(chnglog.fromstring, '') <> coalesce(chnglog.tostring, '')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, chnglog.field;

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
(select chnglog.id, chnglog.issueid, chnglog.sourceinstance, chnglog.created, chnglog.field, chnglog.fromstring, chnglog.`from`, chnglog.`to`, chnglog.tostring
from #STG_TABLE_SCHEMA.issue_activity_temp chnglog
where chnglog.field in ('STATUS', 'ASSIGNEE', 'PRIORITY', 'ITERATION', 'DUEDATE', 'PROJECT', 'RESOLUTION') and chnglog.primary_sequence_id <> 0 and coalesce(chnglog.`from`, '') <> coalesce(chnglog.`to`, '')
) base

join #STG_TABLE_SCHEMA.monthly_changelog_id monthly
on monthly.max_chnglog_id = base.id and monthly.issueid = base.issueid and monthly.sourceinstance = base.sourceinstance and monthly.field = base.field

union all

select distinct base.id as changelogid, base.issueid, base.sourceinstance, base.created, base.field, base.fromstring, base.tostring, base.`from`, base.`to`, monthly.n_key, monthly.lagging_count_of_month
from 
(select chnglog.id, chnglog.issueid, chnglog.sourceinstance, chnglog.created, chnglog.field, chnglog.fromstring, chnglog.`from`, chnglog.`to`, chnglog.tostring
from #STG_TABLE_SCHEMA.issue_activity_temp chnglog
where chnglog.field in ('FIX VERSION') and chnglog.primary_sequence_id <> 0 and coalesce(chnglog.`from`, '') <> coalesce(chnglog.`to`, '')
) base

join #STG_TABLE_SCHEMA.monthly_changelog_id monthly
on monthly.min_chnglog_id = base.id and monthly.issueid = base.issueid and monthly.sourceinstance = base.sourceinstance and monthly.field = base.field

union all 

select distinct base.id as changelogid, base.issueid, base.sourceinstance, base.created, base.field, 
case when base.field in ('BUSINESS VALUE') then case when base.fromstring  is null then base.fromstring when base.fromstring = '' then null else convert(base.fromstring,DECIMAL(28,10)) end 
when base.field in ('STORY POINTS') then case when base.fromstring  is null then base.fromstring when base.fromstring = '' then convert(0,DECIMAL(28,10)) else convert(base.fromstring,DECIMAL(28,10)) end
else base.fromstring end as fromstring, 
case when base.field in ('BUSINESS VALUE') then case when base.tostring is null then base.tostring when base.tostring = '' then null else cast(base.tostring as DECIMAL(28,10)) end 
when base.field in ('STORY POINTS') then case when base.tostring is null then base.tostring when base.tostring = '' then convert(0,DECIMAL(28,10)) else cast(base.tostring as DECIMAL(28,10)) end
else base.tostring end as tostring, 
base.`from`, base.`to`, monthly.n_key, monthly.lagging_count_of_month
from 
(select chnglog.id, chnglog.issueid, chnglog.sourceinstance, chnglog.created, chnglog.field, chnglog.fromstring, chnglog.`from`, chnglog.`to`, chnglog.tostring
from #STG_TABLE_SCHEMA.issue_activity_temp chnglog
where chnglog.field in ('BUSINESS VALUE', 'STORY POINTS', 'SUMMARY') and chnglog.primary_sequence_id <> 0 and coalesce(chnglog.fromstring, '') <> coalesce(chnglog.tostring, '')
) base

join #STG_TABLE_SCHEMA.monthly_changelog_id monthly
on monthly.max_chnglog_id = base.id and monthly.issueid = base.issueid and monthly.sourceinstance = base.sourceinstance and monthly.field = base.field;

-- Monthly next changelog table creation --

drop table if exists #STG_TABLE_SCHEMA.next_changelog_val_month;

create table if not exists #STG_TABLE_SCHEMA.next_changelog_val_month 

select chnglog.id AS changelogid, chnglog.issueid, chnglog.sourceinstance, chnglog.field, chnglog.fromstring as next_fromstring, chnglog.`from` as next_from, next_id.n_key, next_id.lagging_count_of_month
from #STG_TABLE_SCHEMA.issue_activity_temp chnglog
join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, chnglog.field, min(chnglog.issuechangelogid) as nxt_chnglog_id
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp chnglog
on SRC.issueid=chnglog.issueid and SRC.sourceinstance=chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where chnglog.field in ('STATUS', 'ASSIGNEE', 'PRIORITY', 'ITERATION', 'DUEDATE', 'PROJECT', 'RESOLUTION') and chnglog.primary_sequence_id <> 0 and
date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') > date_format(cal.month_end_date, '%Y-%m-%d') and coalesce(chnglog.`from`, '') <> coalesce(chnglog.`to`, '')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, chnglog.field) next_id
on next_id.nxt_chnglog_id = chnglog.id and next_id.sourceinstance = chnglog.sourceinstance and next_id.issueid = chnglog.issueid and next_id.field = chnglog.field
where chnglog.field in ('STATUS', 'ASSIGNEE', 'PRIORITY', 'ITERATION', 'DUEDATE', 'PROJECT', 'RESOLUTION') and chnglog.primary_sequence_id <> 0

union all

select cnglg.id AS changelogid, base.issueid, base.sourceinstance, base.field, cnglg.fromstring as next_fromstring, cnglg.`from` as next_from, base.n_key, base.lagging_count_of_month
from (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, chnglog.field, min(chnglog.`from`) as min_chnglog_id
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp chnglog
on SRC.issueid=chnglog.issueid and SRC.sourceinstance=chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where chnglog.field in ('FIX VERSION') and chnglog.primary_sequence_id <> 0 and
date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') > date_format(cal.month_end_date, '%Y-%m-%d') and coalesce(chnglog.`from`, '') <> coalesce(chnglog.`to`, '')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, chnglog.field
) base
join 
(
select chnglog.id, chnglog.issueid, chnglog.sourceinstance, chnglog.field, chnglog.`to`, chnglog.`from`, chnglog.fromstring
from #STG_TABLE_SCHEMA.issue_activity_temp chnglog
where chnglog.field in ('FIX VERSION')  and chnglog.primary_sequence_id <> 0
) cnglg
on coalesce(cnglg.`from`, '') = base.min_chnglog_id and cnglg.issueid = base.issueid 
and cnglg.sourceinstance = base.sourceinstance and cnglg.field = base.field
where cnglg.id is not null

union all

select chnglog.id AS changelogid, chnglog.issueid, chnglog.sourceinstance, chnglog.field, 
case when chnglog.field in ('BUSINESS VALUE') then case when chnglog.fromstring  is null then chnglog.fromstring when chnglog.fromstring = '' then null else convert(chnglog.fromstring,DECIMAL(28,10)) end 
when chnglog.field in ('STORY POINTS') then case when chnglog.fromstring  is null then chnglog.fromstring when chnglog.fromstring = '' then convert(0,DECIMAL(28,10)) else convert(chnglog.fromstring,DECIMAL(28,10)) end
else chnglog.fromstring end as next_fromstring, 
chnglog.`from` as next_from, next_id.n_key, next_id.lagging_count_of_month
from #STG_TABLE_SCHEMA.issue_activity_temp chnglog
join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, chnglog.field, min(chnglog.issuechangelogid) as nxt_chnglog_id
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp chnglog
on SRC.issueid=chnglog.issueid and SRC.sourceinstance=chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where chnglog.field in ('BUSINESS VALUE', 'STORY POINTS', 'SUMMARY') and chnglog.primary_sequence_id <> 0 and
date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') > date_format(cal.month_end_date, '%Y-%m-%d') and coalesce(chnglog.fromstring, '') <> coalesce(chnglog.tostring, '')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, chnglog.field) next_id
on next_id.nxt_chnglog_id = chnglog.id and next_id.sourceinstance = chnglog.sourceinstance and next_id.issueid = chnglog.issueid and next_id.field = chnglog.field
where chnglog.field in ('BUSINESS VALUE', 'STORY POINTS', 'SUMMARY') and chnglog.primary_sequence_id <> 0;

alter table #STG_TABLE_SCHEMA.next_changelog_val_month
ADD PRIMARY KEY (changelogid, field, sourceinstance, n_key),
ADD INDEX first_idx (issueid, sourceinstance, field, n_key) USING BTREE,
ADD INDEX second_idx (field) USING BTREE,
ADD INDEX third_idx (changelogid, issueid, sourceinstance, field) USING BTREE,
ADD INDEX fourth_idx (changelogid, sourceinstance) USING BTREE;