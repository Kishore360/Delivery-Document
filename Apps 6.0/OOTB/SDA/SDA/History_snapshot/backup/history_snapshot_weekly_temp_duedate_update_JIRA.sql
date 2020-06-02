use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key and lower(LKP.field) in ('duedate')
left join #MDS_TABLE_SCHEMA.issue_final issue
on issue.id = SRC.issueid and SRC.sourceinstance = issue.sourceinstance
set SRC.due_on = convert_tz(coalesce(LKP.`to`, case when SRC.n_date < LKP.created then LKP.`from` else null end, issue.duedate),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), SRC.updated_on = current_timestamp;