use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.issue_activity_azure_base SRC
join (
 select main.issueid, main.sequence_id, main.field, main.created,main.sourceinstance,
 (
 select count(*)+1
 from (
 SELECT tmp.sys_id, tmp.issueid issueid, tmp.id, tmp.sequence_id, tmp.field, tmp.created, tmp.sourceinstance sourceinstance
 from #STG_TABLE_SCHEMA.issue_activity_azure_base tmp
 ) base
 where base.issueid = main.issueid and base.field = main.field and base.sourceinstance = main.sourceinstance and (coalesce(main.created, '') > coalesce(base.created, '') or (coalesce(main.created, '') = coalesce(base.created, '') and main.sequence_id > base.sequence_id))
 ) primary_sequence_id1
 from 
 (
 SELECT tmp.sys_id, tmp.issueid issueid, tmp.id, tmp.sequence_id, tmp.field, tmp.created, tmp.sourceinstance sourceinstance
 from #STG_TABLE_SCHEMA.issue_activity_azure_base tmp
 ) main
order by main.field, main.issueid, main.sequence_id
) SQ
on SRC.issueid = SQ.issueid and SRC.field = SQ.field and SRC.sequence_id = SQ.sequence_id and SRC.sourceinstance = SQ.sourceinstance
set SRC.primary_sequence_id = SQ.primary_sequence_id1;