-- Weekly base table age_since_creation update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on CAL.row_key = SRC.n_key
set SRC.age_since_creation =  coalesce(case when date_format(convert_tz(SRC.created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') > CAL.week_end_date then 0 
when LM.dimension_wh_code in ('RESOLVED', 'COMPLETED') then timestampdiff(second,coalesce(SRC.created_on,0),coalesce(convert_tz(SRC.resolved_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>') , case when LM.dimension_wh_code in ('COMPLETED','RESOLVED') then convert_tz(SRC.completed_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>') else null end, convert_tz(SRC.cancelled_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>')))
when LM.dimension_wh_code in ('CANCELLED') then timestampdiff(second,coalesce(SRC.created_on,0),convert_tz(coalesce(SRC.resolved_on, SRC.cancelled_on),'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'))
else timestampdiff(second,coalesce(SRC.created_on,0),coalesce(convert_tz(timestamp(CAL.week_end_date),'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),0)) + 86400 end,0), SRC.updated_on = current_timestamp;