use #STG_TABLE_SCHEMA;

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
where lower(chnglogitems.field) = 'assignee' and convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') <= cal.week_end_date and (chnglogitems.fromstring is not null or chnglogitems.`from` is not null)
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_reasgn
on tmp_reasgn.issueid = SRC.issueid and tmp_reasgn.sourceinstance = SRC.sourceinstance and tmp_reasgn.n_key = SRC.n_key

set SRC.reassignment_count = tmp_reasgn.reassignment_count, SRC.updated_on = current_timestamp;