-- Weekly base table invalid_flag update -- wi_type

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC

join #DWH_TABLE_SCHEMA.d_lov_map TYP
on concat('TYPE~WORK_ITEM~',upper(SRC.wi_type))=TYP.src_rowid and SRC.sourceinstance = TYP.source_id
 
 left join #DWH_TABLE_SCHEMA.d_lov_map DM
on concat('STATUS~WORK_ITEM~',upper(SRC.work_item_status))=DM.src_rowid and SRC.sourceinstance = DM.source_id

left join #DWH_TABLE_SCHEMA.d_lov_map RES
on concat('RESOLUTION~WORK_ITEM~',upper(SRC.work_item_resolution))=RES.src_rowid and SRC.sourceinstance = RES.source_id

-- set SRC.invalid_flag = coalesce(CASE when ((DM.dimension_wh_code in ('COMPLETED', 'RESOLVED','CANCELLED') and RES.dimension_wh_code in ('CANCELLED')) or DM.dimension_wh_code in ('CANCELLED')) then 'Y' ELSE 'N' end,'N' ), SRC.updated_on = current_timestamp;
set SRC.invalid_flag = coalesce(CASE when (DM.dimension_wh_code in ('CANCELLED')) then 'Y' ELSE 'N' end,'N' ), SRC.updated_on = current_timestamp;