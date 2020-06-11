use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.work_item_priority = coalesce(LKP.`to`, LKP.`from`, SRC.work_item_priority), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('priority');