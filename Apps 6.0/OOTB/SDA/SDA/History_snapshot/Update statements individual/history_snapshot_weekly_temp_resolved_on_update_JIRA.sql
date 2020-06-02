-- Weekly base table resolved_on update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC

left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key

join #MDS_TABLE_SCHEMA.issue_final issue
on issue.id = SRC.issueid and issue.sourceinstance = SRC.sourceinstance

left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id and LM.dimension_wh_code IN ('RESOLVED' , 'COMPLETED')

left join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, max(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as resolved_on
from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp LKP
on SRC.issueid=LKP.issueid and SRC.sourceinstance=LKP.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(LKP.`to`))=LM.src_rowid
and LKP.sourceinstance=LM.source_id
where LKP.field = 'STATUS' and LM.dimension_wh_code IN ('RESOLVED') and date_format(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.week_end_date, '%Y-%m-%d') and coalesce(LKP.`from`,'') <> coalesce(LKP.`to`,'')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_res
on tmp_res.issueid = SRC.issueid and tmp_res.sourceinstance = SRC.sourceinstance and tmp_res.n_key = SRC.n_key

set SRC.resolved_on = coalesce(case when date_format(convert_tz(issue.resolutiondate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.week_end_date, '%Y-%m-%d') then convert_tz(issue.resolutiondate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') else null end, tmp_res.resolved_on, SRC.completed_on), SRC.updated_on = current_timestamp;