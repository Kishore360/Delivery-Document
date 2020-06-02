use #STG_TABLE_SCHEMA;

delete SRC 
from #STG_TABLE_SCHEMA.issue_activity_azure_base as SRC
join #STG_TABLE_SCHEMA.issue_activity_azure_base SRC_B
on SRC.issueid = SRC_B.issueid and SRC.field = SRC_B.field and SRC.`from` = SRC_B.`from` 
and SRC.`to` = SRC_B.`to` 
and SRC.sequence_id > SRC_B.sequence_id 
and SRC.primary_sequence_id = SRC_B.primary_sequence_id + 1;