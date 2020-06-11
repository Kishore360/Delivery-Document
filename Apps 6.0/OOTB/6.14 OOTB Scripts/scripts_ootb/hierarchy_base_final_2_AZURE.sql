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

drop table if exists #STG_TABLE_SCHEMA.parent_removed_temp;

create table if not exists #STG_TABLE_SCHEMA.parent_removed_temp (
  log_key varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  old_parent_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  old_parent_wi_number varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  old_parent_type varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  old_parent_sourceinstance bigint(20) NOT NULL DEFAULT '0',
  child_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  child_wi_number varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  child_type varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  child_sourceinstance bigint(20) NOT NULL DEFAULT '0',
  link_type varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  link_val varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  issue_field varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  textval varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  link_created datetime DEFAULT NULL,
  inserted_on datetime DEFAULT NULL,
    
  PRIMARY KEY (log_key, child_sourceinstance)
);

insert into #STG_TABLE_SCHEMA.parent_removed_temp
(log_key, child_id, child_wi_number, child_type, child_sourceinstance, old_parent_id, old_parent_wi_number, old_parent_type, old_parent_sourceinstance, 
link_type, link_val, issue_field, textval, link_created, inserted_on)

select distinct lnk.__numerify__primary_key as log_key, child_wi.__numerify__primary_key child_id, child_wi.id child_wi_number, child_wi_type.dimension_wh_code child_type, coalesce(child_wi.sourceinstance, 25) child_sourceinstance,
parent_wi.__numerify__primary_key old_parent_id, parent_wi.id old_parent_wi_number, parent_wi_type.dimension_wh_code old_parent_type, coalesce(parent_wi.sourceinstance, 25) old_parent_sourceinstance,
lnk.linkType link_type, 
lnk_typ.name link_val,
'PARENT' as issue_field, 
'Parent' as textval,
lnk.changedDate as link_created,
current_timestamp as inserted_on
from #MDS_TABLE_SCHEMA.azure_workitem_link_final lnk
left join #MDS_TABLE_SCHEMA.azure_workitem_relation_type_final lnk_typ
on lnk.linkType = lnk_typ.oppositeEndReferenceName and lnk.sourceinstance = lnk_typ.sourceinstance
left join #STG_TABLE_SCHEMA.workitem_temp_azure child_wi
on child_wi.__numerify__primary_key = lnk.targetKey and child_wi.sourceinstance = lnk.sourceinstance
left join #DWH_TABLE_SCHEMA.d_lov_map child_wi_type
on child_wi_type.src_rowid=coalesce(concat('TYPE~WORK_ITEM~',child_wi.workItemType),'UNSPECIFIED') and child_wi_type.source_id=child_wi.sourceinstance
left join #STG_TABLE_SCHEMA.workitem_temp_azure parent_wi
on parent_wi.__numerify__primary_key = lnk.sourceKey and parent_wi.sourceinstance = lnk.sourceinstance
left join #DWH_TABLE_SCHEMA.d_lov_map parent_wi_type
on parent_wi_type.src_rowid=coalesce(concat('TYPE~WORK_ITEM~',parent_wi.workItemType),'UNSPECIFIED') and parent_wi_type.source_id=parent_wi.sourceinstance
where lnk_typ.name = 'Parent' AND lnk.changedOperation = 'remove';

use #STG_TABLE_SCHEMA;

delete hier
from #STG_TABLE_SCHEMA.flat_hier_temp hier
join #STG_TABLE_SCHEMA.parent_removed_temp removed_parent
on hier.child_id = removed_parent.child_id and hier.parent_id = removed_parent.old_parent_id and hier.link_val = removed_parent.link_val and hier.parent_sourceinstance = removed_parent.old_parent_sourceinstance
and removed_parent.link_created > hier.link_created ;
-- and removed_parent.log_key > hier.log_key;

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