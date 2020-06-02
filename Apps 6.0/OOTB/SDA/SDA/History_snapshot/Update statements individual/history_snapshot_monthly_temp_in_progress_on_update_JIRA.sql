-- Monthly base table in_progress_on update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC

join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, min(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as in_prog_on
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp LKP
on SRC.issueid=LKP.issueid and SRC.sourceinstance=LKP.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(LKP.`from`))=LM.src_rowid
and LKP.sourceinstance=LM.source_id
where LKP.field = 'STATUS' and LM.dimension_wh_code IN ('PROPOSED') and date_format(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') and coalesce(LKP.`from`,'') <> coalesce(LKP.`to`,'')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp
on tmp.issueid = SRC.issueid and tmp.sourceinstance = SRC.sourceinstance and tmp.n_key = SRC.n_key

set SRC.in_progress_on = tmp.in_prog_on, SRC.updated_on = current_timestamp;