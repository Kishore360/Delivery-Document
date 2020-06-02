use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.issue_activity_temp SRC
join (
 select main.issueid, main.issuechangelogid, main.field, main.created,main.sourceinstance,
 (
 select count(*) + 1
 from (
 SELECT tmp.sys_id, tmp.issue_changelog_issueid issueid, tmp.id, tmp.issuechangelogid, tmp.field, tmp.created, tmp.issue_changelog_sourceinstance sourceinstance
 FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp
 ) base
 where base.issueid = main.issueid and base.field = main.field and base.sourceinstance = main.sourceinstance and (main.created > base.created or (main.created = base.created and main.issuechangelogid > base.issuechangelogid))
 ) primary_sequence_id1
 from 
 (
 SELECT tmp.sys_id, tmp.issue_changelog_issueid issueid, tmp.id, tmp.issuechangelogid, tmp.field, tmp.created, tmp.issue_changelog_sourceinstance sourceinstance
 FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp
 ) main
order by main.field, main.issueid, main.issuechangelogid
) SQ
on SRC.issue_changelog_issueid = SQ.issueid and SRC.field = SQ.field and SRC.issuechangelogid = SQ.issuechangelogid and SRC.issue_changelog_sourceinstance = SQ.sourceinstance
set SRC.primary_sequence_id = SQ.primary_sequence_id1;