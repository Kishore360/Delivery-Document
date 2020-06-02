use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
 
join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id

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
where lower(chnglogitems.field) = 'status' and LM.dimension_wh_code='COMPLETED' and date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp
on tmp.issueid = SRC.issueid and tmp.sourceinstance = SRC.sourceinstance and tmp.n_key = SRC.n_key

set SRC.completed_on = case when LM.dimension_wh_code IN ('COMPLETED') then tmp.completed_on else null end, SRC.updated_on = current_timestamp
where LM.dimension_wh_code IN ('COMPLETED');