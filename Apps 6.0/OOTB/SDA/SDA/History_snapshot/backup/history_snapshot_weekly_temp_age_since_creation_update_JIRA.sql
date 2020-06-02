use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id
set SRC.age_since_creation =  coalesce(case when SRC.created_on > SRC.n_date then 0 
when LM.dimension_wh_code in ('RESOLVED', 'COMPLETED') then timestampdiff(second,coalesce(SRC.created_on,0),coalesce(convert_tz(SRC.resolved_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>') , case when LM.dimension_wh_code in ('COMPLETED','RESOLVED') then convert_tz(SRC.completed_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>') else null end, convert_tz(SRC.cancelled_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>')))
when LM.dimension_wh_code in ('CANCELLED') then timestampdiff(second,coalesce(SRC.created_on,0),convert_tz(coalesce(SRC.resolved_on, SRC.cancelled_on),'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'))
else timestampdiff(second,coalesce(SRC.created_on,0),coalesce(convert_tz(SRC.n_date,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),0)) end,0), SRC.updated_on = current_timestamp;