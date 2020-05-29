use #STG_TABLE_SCHEMA;

delete SRC 
from #STG_TABLE_SCHEMA.issue_activity_temp as SRC
join #STG_TABLE_SCHEMA.issue_activity_temp SRC_B
on SRC.issueid = SRC_B.issueid and SRC.field = SRC_B.field and SRC.`from` = SRC_B.`from` 
and SRC.`to` = SRC_B.`to` 
and SRC.issuechangelogid > SRC_B.issuechangelogid 
and SRC.primary_sequence_id = SRC_B.primary_sequence_id + 1
where SRC.field <> 'ITERATION';