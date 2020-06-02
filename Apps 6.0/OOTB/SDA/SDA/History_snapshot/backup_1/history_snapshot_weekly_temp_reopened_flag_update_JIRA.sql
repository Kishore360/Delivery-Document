use #STG_TABLE_SCHEMA;

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