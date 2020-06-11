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
where base.child_id = main.child_id and base.sourceinstance = main.sourceinstance 
  and (CAST(main.parent_precedence AS UNSIGNED) < CAST(base.parent_precedence AS UNSIGNED) or (CAST(main.parent_precedence AS UNSIGNED) = CAST(base.parent_precedence AS UNSIGNED) and (main.link_created > base.link_created or (main.link_created = base.link_created and main.log_key > base.log_key))))
) parent_preference_id1
from 
 (
SELECT tmp.log_key, tmp.child_id child_id, tmp.parent_id parent_id, tmp.link_type, tmp.link_val, tmp.link_created, tmp.child_sourceinstance sourceinstance, tmp.parent_precedence
FROM #STG_TABLE_SCHEMA.flat_hier_temp tmp
) main
order by main.child_id,  main.parent_id, main.log_key
) SQ
on SRC.child_id = SQ.child_id and SRC.link_type = SQ.link_type and SRC.log_key = SQ.log_key and SRC.child_sourceinstance = SQ.sourceinstance
set SRC.parent_preference_id = SQ.parent_preference_id1;

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.flat_hier_temp SRC
join (
select SRC.child_id, SRC.child_sourceinstance, count(SRC.parent_id) parent_count
from #STG_TABLE_SCHEMA.flat_hier_temp SRC
group by SRC.child_id, SRC.child_sourceinstance
having count(SRC.parent_id) > 1
) base
on SRC.child_id = base.child_id and SRC.child_sourceinstance = base.child_sourceinstance
set SRC.invalid_flag = 'Y';