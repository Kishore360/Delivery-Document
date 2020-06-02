use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.story_points = coalesce(LKP.`to`, LKP.`from`, SRC.story_points), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('story points');