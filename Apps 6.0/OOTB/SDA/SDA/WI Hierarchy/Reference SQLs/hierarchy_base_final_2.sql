use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.flat_hier_temp SRC
join (
select main.log_key, main.child_id,  main.parent_id, main.link_type, main.link_created,main.sourceinstance, main.parent_precedence,
(
select count(*) + 1
from (
SELECT tmp.log_key, tmp.child_id child_id, tmp.parent_id parent_id, tmp.link_type, tmp.link_val, tmp.link_created, tmp.child_sourceinstance sourceinstance, tmp.parent_precedence
FROM #STG_TABLE_SCHEMA.flat_hier_temp tmp
) base
where base.child_id = main.child_id and base.sourceinstance = main.sourceinstance and main.link_type = base.link_type 
 and (main.link_created > base.link_created or (main.link_created = base.link_created and main.log_key > base.log_key))
) sequence_id1
from 
 (
SELECT tmp.log_key, tmp.child_id child_id, tmp.parent_id parent_id, tmp.link_type, tmp.link_val, tmp.link_created, tmp.child_sourceinstance sourceinstance, tmp.parent_precedence
FROM #STG_TABLE_SCHEMA.flat_hier_temp tmp
) main
order by main.child_id,  main.parent_id, main.log_key
) SQ
on SRC.child_id = SQ.child_id and SRC.link_type = SQ.link_type and SRC.log_key = SQ.log_key and SRC.child_sourceinstance = SQ.sourceinstance
set SRC.sequence_id = SQ.sequence_id1;

use #STG_TABLE_SCHEMA;

delete SRC 
from #STG_TABLE_SCHEMA.flat_hier_temp as SRC
join #STG_TABLE_SCHEMA.flat_hier_temp SRC_B
on SRC.child_id = SRC_B.child_id and SRC.parent_id = SRC_B.parent_id and SRC.link_type = SRC_B.link_type 
and SRC.issue_field = SRC_B.issue_field 
and SRC.log_key < SRC_B.log_key
and SRC.sequence_id + 1 = SRC_B.sequence_id;