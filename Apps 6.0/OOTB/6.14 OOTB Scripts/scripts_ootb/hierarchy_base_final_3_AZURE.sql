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

delete SRC 
from #STG_TABLE_SCHEMA.flat_hier_temp SRC
where SRC.child_id = SRC.parent_id;