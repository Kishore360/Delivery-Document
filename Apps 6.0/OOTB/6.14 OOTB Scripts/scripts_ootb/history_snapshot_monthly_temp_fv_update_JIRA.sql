use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
left join #DWH_TABLE_SCHEMA.d_work_item_version DFV
on coalesce(LKP.`to`, LKP.`from`)=DFV.row_id and LKP.sourceinstance=DFV.source_id
set SRC.work_item_earliest_fixed_version_key = coalesce(DFV.row_key,case when coalesce(LKP.`to`, LKP.`from`) is null then 0 else -1 end), SRC.updated_on = current_timestamp
where LKP.field in ('FIX VERSION');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_month LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
left join #DWH_TABLE_SCHEMA.d_work_item_version DFV
on coalesce(LKP2.next_from, '') = DFV.row_id and LKP2.sourceinstance=DFV.source_id
set SRC.work_item_earliest_fixed_version_key = coalesce(DFV.row_key,case when LKP2.next_from is null then 0 else -1 end), SRC.updated_on = current_timestamp
where LKP2.field in ('FIX VERSION') and DFV.row_key <> SRC.work_item_earliest_fixed_version_key;