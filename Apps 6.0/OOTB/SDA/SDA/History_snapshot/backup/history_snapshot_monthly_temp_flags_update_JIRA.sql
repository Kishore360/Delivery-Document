use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
 
join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id

set SRC.overdue_flag = coalesce(case when SRC.due_on is null then 'N' when LM.dimension_wh_code IN ('PROPOSED','IN PROGRESS') and coalesce(SRC.due_on,0) < SRC.n_date THEN 'Y' ELSE 'N' END, 'N'), SRC.updated_on = current_timestamp;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
 
join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id

set SRC.proposed_flag = coalesce(case when LM.dimension_wh_code IN ('PROPOSED') THEN 'Y' ELSE 'N' END, 'N'), SRC.updated_on = current_timestamp;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id

set SRC.in_progress_flag = coalesce(case when LM.dimension_wh_code IN ('IN PROGRESS') THEN 'Y' ELSE 'N' END, 'N'), SRC.updated_on = current_timestamp;