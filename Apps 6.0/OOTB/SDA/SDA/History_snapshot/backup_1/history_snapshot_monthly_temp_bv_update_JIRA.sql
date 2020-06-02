use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.business_value = coalesce(LKP.`to`, LKP.`from`, SRC.business_value), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('business value');