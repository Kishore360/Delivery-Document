-- Weekly base table last_updated_on update --
use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join 
(
select SQ.issueid, SQ.sourceinstance, SQ.n_key, max(SQ.last_updated_on) as last_updated_on
from
(
select base.issueid, base.sourceinstance, base.n_key, max(convert_tz(SRC.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as last_updated_on
FROM #STG_TABLE_SCHEMA.history_snapshot_weekly_temp base
left join #MDS_TABLE_SCHEMA.issue_changelog_final SRC
on base.issueid=SRC.issueid and base.sourceinstance=SRC.sourceinstance
join #MDS_TABLE_SCHEMA.issue_changelog_items_final SRC2
on SRC.id = SRC2.issuechangelogid and SRC.sourceinstance=SRC2.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on base.n_key = cal.row_key
where date_format(convert_tz(SRC.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.week_end_date, '%Y-%m-%d')
group by base.issueid, base.sourceinstance, base.n_key
union all
select base.issueid, base.sourceinstance, base.n_key, max(convert_tz(comments.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as last_updated_on
FROM #STG_TABLE_SCHEMA.history_snapshot_weekly_temp base
left join #MDS_TABLE_SCHEMA.issue_comments_final comments
on base.issueid=comments.issueid
and base.sourceinstance=comments.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on base.n_key = cal.row_key
where date_format(convert_tz(comments.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.week_end_date, '%Y-%m-%d')
group by base.issueid, base.sourceinstance, base.n_key
) SQ
group by SQ.issueid, SQ.sourceinstance, SQ.n_key
) base
on base.issueid = SRC.issueid and base.sourceinstance = SRC.sourceinstance and base.n_key = SRC.n_key
left join #DWH_TABLE_SCHEMA.d_work_item D
on concat(SRC.issueid, '') = D.row_id and SRC.sourceinstance = D.source_id
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key

set SRC.last_updated_on = case when date_format(D.changed_on, '%Y-%m-%d') <= date_format(cal.week_end_date, '%Y-%m-%d') then D.changed_on else coalesce(base.last_updated_on, D.created_on) end, SRC.updated_on = current_timestamp;

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
set SRC.changed_on = SRC.last_updated_on;

-- SRC.changed_by = base.authorRef