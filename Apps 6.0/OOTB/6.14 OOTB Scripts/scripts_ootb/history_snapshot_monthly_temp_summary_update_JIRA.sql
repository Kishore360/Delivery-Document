-- Monthly base table summary update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.summary = coalesce(LKP.tostring, LKP.fromstring, SRC.summary), SRC.updated_on = current_timestamp
where LKP.field in ('SUMMARY');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_month LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.summary = coalesce(LKP2.next_fromstring, SRC.summary), SRC.updated_on = current_timestamp
where LKP2.field in ('SUMMARY') and SRC.summary <> LKP2.next_fromstring;