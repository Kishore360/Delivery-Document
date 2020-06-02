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