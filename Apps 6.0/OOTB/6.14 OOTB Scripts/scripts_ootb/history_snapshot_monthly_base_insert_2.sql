use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM_ST
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM_ST.src_rowid
and SRC.sourceinstance=LM_ST.source_id

left join #DWH_TABLE_SCHEMA.d_lov_map LM_RES
on concat('RESOLUTION~WORK_ITEM','~',upper(SRC.work_item_resolution)) = LM_RES.src_rowid
and SRC.sourceinstance=LM_RES.source_id

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
where lower(chnglogitems.field) = 'status' and (LM.dimension_wh_code = 'CANCELLED' or LM_RES.dimension_wh_code in ('CANCELLED')) and convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') <= cal.month_end_date
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_cncl
on tmp_cncl.issueid = SRC.issueid and tmp_cncl.sourceinstance = SRC.sourceinstance and tmp_cncl.n_key = SRC.n_key

set SRC.cancelled_on = case when (LM_ST.dimension_wh_code in ('CANCELLED') AND (LM_RES.dimension_wh_code != 'CANCELLED' OR LM_RES.dimension_wh_code IS NULL)) then tmp_cncl.cancelled_on
 when LM_ST.dimension_wh_code in ('RESOLVED','CANCELLED','COMPLETED') AND LM_RES.dimension_wh_code  in ('CANCELLED') then COALESCE(tmp_res.resolved_on,tmp_cncl.cancelled_on)
 else null end, SRC.updated_on = current_timestamp;