use #STG_TABLE_SCHEMA;

delete hier
from #STG_TABLE_SCHEMA.flat_hier_temp hier
join #STG_TABLE_SCHEMA.parent_removed_temp removed_parent
on hier.child_id = removed_parent.child_id and hier.parent_id = removed_parent.old_parent_id and hier.link_val = removed_parent.link_val
and removed_parent.link_created > hier.link_created and removed_parent.log_key > hier.log_key

use #STG_TABLE_SCHEMA;

delete SRC
from #STG_TABLE_SCHEMA.flat_hier_temp SRC
join (
select tmp.child_id, tmp.child_wi_number, tmp.link_type, tmp.link_val, max(tmp.sequence_id) max_sequence_id
from #STG_TABLE_SCHEMA.flat_hier_temp tmp 
where tmp.link_val = 'EPIC'
group by tmp.child_id, tmp.child_wi_number, tmp.link_type, tmp.link_val
) SQ
on SRC.child_id = SQ.child_id and SRC.child_wi_number = SQ.child_wi_number and SRC.link_type = SQ.link_type and SRC.link_val = SQ.link_val and SRC.sequence_id < SQ.max_sequence_id
where SRC.link_val = 'EPIC';

use #STG_TABLE_SCHEMA;

delete SRC 
from #STG_TABLE_SCHEMA.flat_hier_temp SRC
join (
select tmp.child_id, tmp.child_wi_number, tmp.link_type, tmp.link_val, max(tmp.sequence_id) max_sequence_id
from #STG_TABLE_SCHEMA.flat_hier_temp tmp 
where tmp.issue_field = 'Parent'
group by tmp.child_id, tmp.child_wi_number, tmp.link_type, tmp.link_val
) SQ
on SRC.child_id = SQ.child_id and SRC.child_wi_number = SQ.child_wi_number and SRC.link_type = SQ.link_type and SRC.link_val = SQ.link_val and SRC.sequence_id < SQ.max_sequence_id
where SRC.issue_field = 'Parent';

drop table if exists #STG_TABLE_SCHEMA.flat_hier_temp_bkp;

create table #STG_TABLE_SCHEMA.flat_hier_temp_bkp select * from #STG_TABLE_SCHEMA.flat_hier_temp;

use #STG_TABLE_SCHEMA;

delete SRC 
from #STG_TABLE_SCHEMA.flat_hier_temp SRC
join (
select SRC.child_id, SRC.link_type
from #STG_TABLE_SCHEMA.flat_hier_temp SRC
join (
select child_id, link_type, max(sequence_id) as max_sequence_id
from #STG_TABLE_SCHEMA.flat_hier_temp
where link_type in ('Epic Link', 'Parent')
group by child_id, link_type
) base
on SRC.child_id = base.child_id and SRC.link_type = base.link_type and SRC.sequence_id = base.max_sequence_id
where SRC.link_type in ('Epic Link', 'Parent') and SRC.parent_id is null
) SQ
on SRC.child_id = SQ.child_id and SRC.link_type = SQ.link_type
where SRC.link_type in ('Epic Link', 'Parent');

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

-- need another update statement to update invalid_flag for multiple parents 

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.flat_hier_temp main
join 
(
select log_key, child_id, invalid_flag from #STG_TABLE_SCHEMA.flat_hier_temp base 
where (child_id, parent_preference_id) in 
(select child_id, min(parent_preference_id) from #STG_TABLE_SCHEMA.flat_hier_temp where invalid_flag = 'Y' group by child_id)
) SQ
on SQ.log_key = main.log_key and SQ.child_id = main.child_id and SQ.invalid_flag = main.invalid_flag
set main.invalid_flag = 'N';

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.flat_hier_temp main
set main.invalid_flag = 'Y'
where main.parent_id is null;