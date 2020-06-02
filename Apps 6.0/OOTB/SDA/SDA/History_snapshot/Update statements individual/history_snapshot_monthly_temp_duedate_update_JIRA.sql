-- Monthly base table duedate update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key and LKP.field in ('DUEDATE')
left join #MDS_TABLE_SCHEMA.issue_final issue
on issue.id = SRC.issueid and SRC.sourceinstance = issue.sourceinstance
set SRC.due_on = convert_tz(coalesce(LKP.tostring, issue.duedate),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), SRC.updated_on = current_timestamp;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_month LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.due_on = coalesce(convert_tz(LKP2.next_from,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), SRC.due_on), SRC.updated_on = current_timestamp
where LKP2.field in ('DUEDATE') and SRC.due_on <> convert_tz(LKP2.next_fromstring,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>');