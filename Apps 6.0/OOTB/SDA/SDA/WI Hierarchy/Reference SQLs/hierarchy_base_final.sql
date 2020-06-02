-- Entire script for HIERARCHY

drop table if exists #STG_TABLE_SCHEMA.flat_hier_temp;

create table if not exists #STG_TABLE_SCHEMA.flat_hier_temp (
  log_key int(15) DEFAULT NULL,
  parent_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  parent_wi_number varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  parent_type varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  parent_sourceinstance bigint(20) NOT NULL DEFAULT '0',
  parent_precedence varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  child_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  child_wi_number varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  child_type varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  child_sourceinstance bigint(20) NOT NULL DEFAULT '0',
  link_type varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  link_val varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  issue_field varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  textval varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  link_created datetime DEFAULT NULL,
  sequence_id int(11) DEFAULT 0,
  parent_preference_id int(11) DEFAULT 0,
  invalid_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  inserted_on datetime DEFAULT NULL,
    
  PRIMARY KEY (log_key, child_sourceinstance)
);

insert into #STG_TABLE_SCHEMA.flat_hier_temp
(log_key, child_id, child_wi_number, child_type, child_sourceinstance, parent_id, parent_wi_number, parent_type, parent_sourceinstance, parent_precedence, 
link_type, link_val, issue_field, textval, link_created, inserted_on)

select chnglogitems.issuechangelogid as log_key, issue.id child_id, issue.`key` child_wi_number, child_wi_type.dimension_wh_code child_type, issue.sourceinstance child_sourceinstance,
coalesce(issue_to_id.id, issue_to_key.id) parent_id, coalesce(issue_to_id.`key`, SUBSTRING_INDEX(chnglogitems.tostring, ' ', -1)) parent_wi_number, parent_wi_type.dimension_wh_code parent_type, coalesce(issue_to_id.sourceinstance, issue_to_key.sourceinstance) parent_sourceinstance,
parent_wi_precedence.dimension_wh_code parent_precedence,
case when chnglogitems.field = 'link' then 
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(chnglogitems.tostring, 'This issue ', ''), issue.`key`, ''), SUBSTRING_INDEX( chnglogitems.tostring, ' ', -1 ), 1))
else chnglogitems.field end as link_type, 
link_type.dimension_wh_code link_val,
chnglogitems.`field` as issue_field, 
CASE WHEN chnglogitems.field = 'link' 
THEN TRIM(REPLACE(REPLACE(chnglogitems.tostring, 'This issue ', ''), issue.`key`, '')) 
ELSE chnglogitems.field END textval,
chnglog.created as link_created,
current_timestamp as inserted_on
from #MDS_TABLE_SCHEMA.issue_final issue
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on chnglog.issueid = issue.id and chnglog.sourceinstance = issue.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_final issue_to_key
on COALESCE(chnglogitems.tostring, '') = issue_to_key.`key` and chnglogitems.sourceinstance = issue_to_key.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_final issue_to_id
on COALESCE(chnglogitems.`to`, '') = issue_to_id.id and chnglogitems.sourceinstance = issue_to_id.sourceinstance
left join #DWH_TABLE_SCHEMA.d_lov_map link_type
on concat('LINK_TYPE~WORK_ITEM~', case when chnglogitems.field = 'link' then 
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(chnglogitems.tostring, 'This issue ', ''), issue.`key`, ''), SUBSTRING_INDEX(chnglogitems.tostring, ' ', -1 ), 1))
else chnglogitems.field end) = link_type.src_rowid
and chnglogitems.sourceinstance=link_type.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map child_wi_type
on concat('TYPE~WORK_ITEM','~',upper(issue.IssueTypeId)) = child_wi_type.src_rowid
and issue.sourceinstance=child_wi_type.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map parent_wi_type
on concat('TYPE~WORK_ITEM','~',upper(coalesce(issue_to_id.IssueTypeId, issue_to_key.IssueTypeId))) = parent_wi_type.src_rowid
and coalesce(issue_to_id.sourceinstance, issue_to_key.sourceinstance)=parent_wi_type.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map parent_wi_precedence
on concat('TYPE_LINK_PRECEDENCE~WORK_ITEM','~',upper(coalesce(issue_to_id.IssueTypeId, issue_to_key.IssueTypeId))) = parent_wi_precedence.src_rowid
and coalesce(issue_to_id.sourceinstance, issue_to_key.sourceinstance)=parent_wi_precedence.source_id
where chnglogitems.`field` in ('Epic Link', 'Parent')
and link_type.dimension_wh_code in ('EPIC', 'PARENT')
and issue.id is not null

union all

select chnglogitems.issuechangelogid as log_key, issue_child.id child_id, SUBSTRING_INDEX(COALESCE(chnglogitems.tostring, chnglogitems.fromstring), ' ', -1) child_wi_number, child_wi_type.dimension_wh_code child_type, issue_child.sourceinstance child_sourceinstance, 
issue.id parent_id, issue.`key` parent_wi_number, parent_wi_type.dimension_wh_code parent_type, issue.sourceinstance parent_sourceinstance,
parent_wi_precedence.dimension_wh_code parent_precedence,
case when chnglogitems.field = 'link' then 
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(COALESCE(chnglogitems.tostring, chnglogitems.fromstring), 'This issue ', ''), issue_child.`key`, ''), SUBSTRING_INDEX( COALESCE(chnglogitems.tostring, chnglogitems.fromstring), ' ', -1 ), 1))
else chnglogitems.field end as link_type, 
link_type.dimension_wh_code link_val,
chnglogitems.`field` as issue_field, 
CASE WHEN chnglogitems.field = 'link' 
THEN TRIM(REPLACE(REPLACE(COALESCE(chnglogitems.tostring, chnglogitems.fromstring), 'This issue ', ''), issue_child.`key`, '')) 
ELSE chnglogitems.field END textval,
chnglog.created as link_created,
current_timestamp as inserted_on
from #MDS_TABLE_SCHEMA.issue_final issue
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on chnglog.issueid = issue.id and chnglog.sourceinstance = issue.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_final issue_child
on COALESCE(chnglogitems.`to`, chnglogitems.`from`) = issue_child.`key` and chnglogitems.sourceinstance = issue_child.sourceinstance
left join #DWH_TABLE_SCHEMA.d_lov_map link_type
on concat('LINK_TYPE~WORK_ITEM~', case when chnglogitems.field = 'link' then 
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(COALESCE(chnglogitems.tostring, chnglogitems.fromstring), 'This issue ', ''), issue_child.`key`, ''), SUBSTRING_INDEX( COALESCE(chnglogitems.tostring, chnglogitems.fromstring), ' ', -1 ), 1))
else chnglogitems.field end) = link_type.src_rowid
and chnglogitems.sourceinstance=link_type.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map parent_wi_type
on concat('TYPE~WORK_ITEM','~',upper(issue.IssueTypeId)) = parent_wi_type.src_rowid
and issue.sourceinstance=parent_wi_type.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map parent_wi_precedence
on concat('TYPE_LINK_PRECEDENCE~WORK_ITEM','~',upper(issue.IssueTypeId)) = parent_wi_precedence.src_rowid
and issue.sourceinstance=parent_wi_precedence.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map child_wi_type
on concat('TYPE~WORK_ITEM','~',upper(issue_child.IssueTypeId)) = child_wi_type.src_rowid
and issue_child.sourceinstance=child_wi_type.source_id
where chnglogitems.`field` in ('Link')
and link_type.dimension_wh_code in ('IMPLEMENTED_BY')
and issue_child.id is not null and (chnglogitems.tostring is not null or chnglogitems.`to` is not null)

union all

select chnglogitems.issuechangelogid as log_key, issue.id child_id, issue.`key` child_wi_number, child_wi_type.dimension_wh_code child_type, issue.sourceinstance child_sourceinstance, 
issue_parent.id parent_id, SUBSTRING_INDEX(COALESCE(chnglogitems.tostring, ''), ' ', -1) parent_wi_number, parent_wi_type.dimension_wh_code parent_type, issue_parent.sourceinstance parent_sourceinstance,
parent_wi_precedence.dimension_wh_code parent_precedence,
case when chnglogitems.field = 'link' then 
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(COALESCE(chnglogitems.tostring, chnglogitems.fromstring), 'This issue ', ''), issue_parent.`key`, ''), SUBSTRING_INDEX( COALESCE(chnglogitems.tostring, chnglogitems.fromstring), ' ', -1 ), 1))
else chnglogitems.field end as link_type, 
link_type.dimension_wh_code link_val,
chnglogitems.`field` as issue_field, 
CASE WHEN chnglogitems.field = 'link' 
THEN TRIM(REPLACE(REPLACE(COALESCE(chnglogitems.tostring, chnglogitems.fromstring), 'This issue ', ''), issue_parent.`key`, '')) 
ELSE chnglogitems.field END textval,
chnglog.created as link_created,
current_timestamp as inserted_on
from #MDS_TABLE_SCHEMA.issue_final issue
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on chnglog.issueid = issue.id and chnglog.sourceinstance = issue.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_final issue_parent
on COALESCE(chnglogitems.`to`, '') = issue_parent.`key` and chnglogitems.sourceinstance = issue_parent.sourceinstance
left join #DWH_TABLE_SCHEMA.d_lov_map link_type
on concat('LINK_TYPE~WORK_ITEM~', case when chnglogitems.field = 'link' then 
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(COALESCE(chnglogitems.tostring, chnglogitems.fromstring), 'This issue ', ''), issue_parent.`key`, ''), SUBSTRING_INDEX( COALESCE(chnglogitems.tostring, chnglogitems.fromstring), ' ', -1 ), 1))
else chnglogitems.field end) = link_type.src_rowid
and chnglogitems.sourceinstance=link_type.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map child_wi_type
on concat('TYPE~WORK_ITEM','~',upper(issue.IssueTypeId)) = child_wi_type.src_rowid
and issue.sourceinstance=child_wi_type.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map parent_wi_type
on concat('TYPE~WORK_ITEM','~',upper(issue_parent.IssueTypeId)) = parent_wi_type.src_rowid
and issue_parent.sourceinstance=parent_wi_type.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map parent_wi_precedence
on concat('TYPE_LINK_PRECEDENCE~WORK_ITEM','~',upper(issue_parent.IssueTypeId)) = parent_wi_precedence.src_rowid
and issue_parent.sourceinstance=parent_wi_precedence.source_id
where chnglogitems.`field` in ('Link')
and link_type.dimension_wh_code in ('PARENT')
and issue_parent.id is not null and (chnglogitems.tostring is not null or chnglogitems.`to` is not null)
order by child_id, child_wi_number, issue_field;

alter table #STG_TABLE_SCHEMA.flat_hier_temp
ADD INDEX first_idx (child_id,child_sourceinstance),
ADD INDEX second_idx (parent_id,parent_sourceinstance);

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
  log_key int(15) DEFAULT NULL,
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

select chnglogitems.issuechangelogid as log_key, issue.id child_id, issue.`key` child_wi_number, child_wi_type.dimension_wh_code child_type, issue.sourceinstance child_sourceinstance,
coalesce(issue_from_id.id, issue_from_key.id) parent_id, coalesce(issue_from_id.`key`, SUBSTRING_INDEX(chnglogitems.tostring, ' ', -1)) parent_wi_number, parent_wi_type.dimension_wh_code parent_type, coalesce(issue_from_id.sourceinstance, issue_from_key.sourceinstance) parent_sourceinstance,
case when chnglogitems.field = 'link' then 
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(chnglogitems.fromstring, 'This issue ', ''), issue.`key`, ''), SUBSTRING_INDEX( chnglogitems.fromstring, ' ', -1 ), 1))
else chnglogitems.field end as link_type, 
link_type.dimension_wh_code link_val,
chnglogitems.`field` as issue_field, 
CASE WHEN chnglogitems.field = 'link' 
THEN TRIM(REPLACE(REPLACE(chnglogitems.fromstring, 'This issue ', ''), issue.`key`, '')) 
ELSE chnglogitems.field END textval,
chnglog.created as link_created,
current_timestamp as inserted_on
from #MDS_TABLE_SCHEMA.issue_final issue
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on chnglog.issueid = issue.id and chnglog.sourceinstance = issue.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_final issue_from_key
on COALESCE(chnglogitems.tostring, '') = issue_from_key.`key` and chnglogitems.sourceinstance = issue_from_key.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_final issue_from_id
on COALESCE(chnglogitems.`to`, '') = issue_from_id.id and chnglogitems.sourceinstance = issue_from_id.sourceinstance
left join #DWH_TABLE_SCHEMA.d_lov_map link_type
on concat('LINK_TYPE~WORK_ITEM~', case when chnglogitems.field = 'link' then 
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(chnglogitems.fromstring, 'This issue ', ''), issue.`key`, ''), SUBSTRING_INDEX(chnglogitems.fromstring, ' ', -1 ), 1))
else chnglogitems.field end) = link_type.src_rowid
and chnglogitems.sourceinstance=link_type.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map child_wi_type
on concat('TYPE~WORK_ITEM','~',upper(issue.IssueTypeId)) = child_wi_type.src_rowid
and issue.sourceinstance=child_wi_type.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map parent_wi_type
on concat('TYPE~WORK_ITEM','~',upper(coalesce(issue_from_id.IssueTypeId, issue_from_key.IssueTypeId))) = parent_wi_type.src_rowid
and coalesce(issue_from_id.sourceinstance, issue_from_key.sourceinstance)=parent_wi_type.source_id
where chnglogitems.`field` in ('Epic Link', 'Parent')
and link_type.dimension_wh_code in ('EPIC', 'PARENT')
and issue.id is not null and (chnglogitems.tostring is null or chnglogitems.`to` is null)

union all

select chnglogitems.issuechangelogid as log_key, issue_child.id child_id, SUBSTRING_INDEX(COALESCE(chnglogitems.tostring, chnglogitems.fromstring), ' ', -1) child_wi_number, child_wi_type.dimension_wh_code child_type, issue_child.sourceinstance child_sourceinstance, 
issue.id parent_id, issue.`key` parent_wi_number, parent_wi_type.dimension_wh_code parent_type, issue.sourceinstance parent_sourceinstance,
case when chnglogitems.field = 'link' then 
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(COALESCE(chnglogitems.tostring, chnglogitems.fromstring), 'This issue ', ''), issue_child.`key`, ''), SUBSTRING_INDEX( COALESCE(chnglogitems.tostring, chnglogitems.fromstring), ' ', -1 ), 1))
else chnglogitems.field end as link_type, 
link_type.dimension_wh_code link_val,
chnglogitems.`field` as issue_field, 
CASE WHEN chnglogitems.field = 'link' 
THEN TRIM(REPLACE(REPLACE(COALESCE(chnglogitems.tostring, chnglogitems.fromstring), 'This issue ', ''), issue_child.`key`, '')) 
ELSE chnglogitems.field END textval,
chnglog.created as link_created,
current_timestamp as inserted_on
from #MDS_TABLE_SCHEMA.issue_final issue
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on chnglog.issueid = issue.id and chnglog.sourceinstance = issue.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_final issue_child
on COALESCE(chnglogitems.`to`, chnglogitems.`from`) = issue_child.`key` and chnglogitems.sourceinstance = issue_child.sourceinstance
left join #DWH_TABLE_SCHEMA.d_lov_map link_type
on concat('LINK_TYPE~WORK_ITEM~', case when chnglogitems.field = 'link' then 
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(COALESCE(chnglogitems.tostring, chnglogitems.fromstring), 'This issue ', ''), issue_child.`key`, ''), SUBSTRING_INDEX( COALESCE(chnglogitems.tostring, chnglogitems.fromstring), ' ', -1 ), 1))
else chnglogitems.field end) = link_type.src_rowid
and chnglogitems.sourceinstance=link_type.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map parent_wi_type
on concat('TYPE~WORK_ITEM','~',upper(issue.IssueTypeId)) = parent_wi_type.src_rowid
and issue.sourceinstance=parent_wi_type.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map child_wi_type
on concat('TYPE~WORK_ITEM','~',upper(issue_child.IssueTypeId)) = child_wi_type.src_rowid
and issue_child.sourceinstance=child_wi_type.source_id
where chnglogitems.`field` in ('Link')
and link_type.dimension_wh_code in ('IMPLEMENTED_BY')
and issue_child.id is not null and (chnglogitems.tostring is null or chnglogitems.`to` is null)

union all

select chnglogitems.issuechangelogid as log_key, issue.id child_id, issue.`key` child_wi_number, child_wi_type.dimension_wh_code child_type, issue.sourceinstance child_sourceinstance, 
issue_parent.id parent_id, SUBSTRING_INDEX(COALESCE(chnglogitems.fromstring, ''), ' ', -1) parent_wi_number, parent_wi_type.dimension_wh_code parent_type, issue_parent.sourceinstance parent_sourceinstance,
case when chnglogitems.field = 'link' then 
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(chnglogitems.fromstring, 'This issue ', ''), issue_parent.`key`, ''), SUBSTRING_INDEX( chnglogitems.fromstring, ' ', -1 ), 1))
else chnglogitems.field end as link_type, 
link_type.dimension_wh_code link_val,
chnglogitems.`field` as issue_field, 
CASE WHEN chnglogitems.field = 'link' 
THEN TRIM(REPLACE(REPLACE(chnglogitems.fromstring, 'This issue ', ''), issue_parent.`key`, '')) 
ELSE chnglogitems.field END textval,
chnglog.created as link_created,
current_timestamp as inserted_on
from #MDS_TABLE_SCHEMA.issue_final issue
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on chnglog.issueid = issue.id and chnglog.sourceinstance = issue.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_final issue_parent
on COALESCE(chnglogitems.`from`, '') = issue_parent.`key` and chnglogitems.sourceinstance = issue_parent.sourceinstance
left join #DWH_TABLE_SCHEMA.d_lov_map link_type
on concat('LINK_TYPE~WORK_ITEM~', case when chnglogitems.field = 'link' then 
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(chnglogitems.fromstring, 'This issue ', ''), issue_parent.`key`, ''), SUBSTRING_INDEX( chnglogitems.fromstring, ' ', -1 ), 1))
else chnglogitems.field end) = link_type.src_rowid
and chnglogitems.sourceinstance=link_type.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map child_wi_type
on concat('TYPE~WORK_ITEM','~',upper(issue.IssueTypeId)) = child_wi_type.src_rowid
and issue.sourceinstance=child_wi_type.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map parent_wi_type
on concat('TYPE~WORK_ITEM','~',upper(issue_parent.IssueTypeId)) = parent_wi_type.src_rowid
and issue_parent.sourceinstance=parent_wi_type.source_id
where chnglogitems.`field` in ('Link')
and link_type.dimension_wh_code in ('PARENT')
and issue_parent.id is not null and (chnglogitems.tostring is null or chnglogitems.`to` is null)
order by child_id, child_wi_number, issue_field;


use #STG_TABLE_SCHEMA;

delete hier
from #STG_TABLE_SCHEMA.flat_hier_temp hier
join #STG_TABLE_SCHEMA.parent_removed_temp removed_parent
on hier.child_id = removed_parent.child_id and hier.parent_id = removed_parent.old_parent_id and hier.link_val = removed_parent.link_val and hier.parent_sourceinstance = removed_parent.old_parent_sourceinstance
and removed_parent.link_created > hier.link_created and removed_parent.log_key > hier.log_key;

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

delete SRC 
from #STG_TABLE_SCHEMA.flat_hier_temp SRC
where SRC.child_id = SRC.parent_id;

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

drop table if exists #STG_TABLE_SCHEMA.hier_base;

create table if not exists #STG_TABLE_SCHEMA.hier_base (
  log_key int(15) DEFAULT NULL,
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_0_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_1_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_2_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_3_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_4_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_5_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_6_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_7_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  is_top_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  is_cyclic_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  cyclic_level int(15) DEFAULT 0,
  from_cyclic_level int(15) DEFAULT 99,
  sourceinstance bigint(20) NOT NULL DEFAULT 0,
  link_type varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  link_created datetime DEFAULT NULL,
  curr_level int(15) DEFAULT 0,
  inserted_on datetime DEFAULT NULL,
  
  PRIMARY KEY (log_key, sourceinstance)
);

-- Lev 0 & 1 -- 
insert into #STG_TABLE_SCHEMA.hier_base
(log_key, sys_id, lev_0_id, lev_1_id, lev_2_id, lev_3_id, lev_4_id, lev_5_id, lev_6_id, is_top_flag, sourceinstance, link_type, link_created, curr_level, inserted_on)

select log_key, CONCAT(tmp.child_id, '~WORK_ITEM'), tmp.child_id, tmp.child_id, tmp.child_id, tmp.child_id, tmp.child_id, tmp.child_id, tmp.parent_id,
'N', tmp.child_sourceinstance, tmp.link_type, link_created, 1 as curr_level, current_timestamp as inserted_on
from #STG_TABLE_SCHEMA.flat_hier_temp tmp
where tmp.invalid_flag = 'N';


drop table if exists #STG_TABLE_SCHEMA.hier_data_temp;

create table if not exists #STG_TABLE_SCHEMA.hier_data_temp (
  log_key int(15) DEFAULT NULL,
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_0_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_1_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_2_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_3_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_4_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_5_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_6_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_7_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  is_cyclic_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  sourceinstance bigint(20) NOT NULL DEFAULT 0,
  inserted_on datetime DEFAULT NULL,
  
  PRIMARY KEY (log_key, sourceinstance)
);

insert into #STG_TABLE_SCHEMA.hier_data_temp
(log_key, sys_id, lev_0_id, lev_1_id, lev_2_id, lev_3_id, lev_4_id, lev_5_id, lev_6_id, sourceinstance, inserted_on)

select tmp_lev1.log_key, CONCAT(tmp_lev1.child_id, '~WORK_ITEM') as sys_id, tmp_lev1.child_id lev_0_id, tmp_lev1.parent_id lev_1_id, tmp_lev2.parent_id lev_2_id, tmp_lev3.parent_id lev_3_id, 
tmp_lev4.parent_id lev_4_id, tmp_lev5.parent_id lev_5_id, tmp_lev6.parent_id lev_6_id, 
tmp_lev1.child_sourceinstance, current_timestamp as inserted_on
from #STG_TABLE_SCHEMA.flat_hier_temp tmp_lev1
left join #STG_TABLE_SCHEMA.flat_hier_temp tmp_lev2
on tmp_lev1.parent_id = tmp_lev2.child_id and tmp_lev1.invalid_flag = 'N' and tmp_lev2.invalid_flag = 'N'
left join #STG_TABLE_SCHEMA.flat_hier_temp tmp_lev3
on tmp_lev2.parent_id = tmp_lev3.child_id and tmp_lev3.invalid_flag = 'N'
left join #STG_TABLE_SCHEMA.flat_hier_temp tmp_lev4
on tmp_lev3.parent_id = tmp_lev4.child_id and tmp_lev4.invalid_flag = 'N'
left join #STG_TABLE_SCHEMA.flat_hier_temp tmp_lev5
on tmp_lev4.parent_id = tmp_lev5.child_id and tmp_lev5.invalid_flag = 'N'
left join #STG_TABLE_SCHEMA.flat_hier_temp tmp_lev6
on tmp_lev5.parent_id = tmp_lev6.child_id and tmp_lev6.invalid_flag = 'N'
where tmp_lev1.invalid_flag = 'N' 
order by tmp_lev1.log_key;

-- base lev 0 --

set @base_id := null, @parent_id := null, @cyclic_level := 0, @grandparent_id := null, @store_data := null;
update #STG_TABLE_SCHEMA.hier_base hier_base
join (
select base.sys_id, base.sourceinstance, @base_id := base.lev_0_id, @parent_id := base.lev_2_id, @grandparent_id := base.lev_3_id,
@cyclic_level := 
case when @base_id = (@parent_id := base.lev_2_id) then 2
else case when @base_id = (@parent_id := base.lev_3_id) then 3
     else case when @base_id = (@parent_id := base.lev_4_id) then 4
          else case when @base_id = (@parent_id := base.lev_5_id) then 5
               else case when @base_id = (@parent_id := base.lev_6_id) then 6
                    else 0 end
               end
          end
     end
end 
level_cycle

from #STG_TABLE_SCHEMA.hier_data_temp base
) SQ
on SQ.sys_id = hier_base.sys_id and SQ.sourceinstance = hier_base.sourceinstance
set hier_base.is_cyclic_flag = case when SQ.level_cycle > 0 then 'Y' else 'N' end, hier_base.cyclic_level = SQ.level_cycle, from_cyclic_level = 0;

-- base lev 1 --

set @base_id := null, @parent_id := null, @cyclic_level := 0, @grandparent_id := null, @store_data := null;
update #STG_TABLE_SCHEMA.hier_base hier_base
join (
select base.sys_id, base.sourceinstance, @base_id := base.lev_1_id, @parent_id := base.lev_3_id, @grandparent_id := base.lev_4_id,
@cyclic_level := 
case when @base_id = (@parent_id := base.lev_3_id) then 3
else case when @base_id = (@parent_id := base.lev_4_id) then 4
     else case when @base_id = (@parent_id := base.lev_5_id) then 5
          else case when @base_id = (@parent_id := base.lev_6_id) then 6
               else 0 end
          end
     end
end
level_cycle

from #STG_TABLE_SCHEMA.hier_data_temp base
) SQ
on SQ.sys_id = hier_base.sys_id and SQ.sourceinstance = hier_base.sourceinstance and hier_base.is_cyclic_flag = 'N'
set hier_base.is_cyclic_flag = case when SQ.level_cycle > 0 then 'Y' else 'N' end, hier_base.cyclic_level = SQ.level_cycle, from_cyclic_level = 1;

-- base lev 2 --

set @base_id := null, @parent_id := null, @cyclic_level := 0, @grandparent_id := null, @store_data := null;
update #STG_TABLE_SCHEMA.hier_base hier_base
join (
select base.sys_id, base.sourceinstance, @base_id := base.lev_2_id, @parent_id := base.lev_4_id, @grandparent_id := base.lev_5_id,
@cyclic_level := 
case when @base_id = (@parent_id := base.lev_4_id) then 4
else case when @base_id = (@parent_id := base.lev_5_id) then 5
     else case when @base_id = (@parent_id := base.lev_6_id) then 6
          else 0 end
     end
end
level_cycle

from #STG_TABLE_SCHEMA.hier_data_temp base
) SQ
on SQ.sys_id = hier_base.sys_id and SQ.sourceinstance = hier_base.sourceinstance and hier_base.is_cyclic_flag = 'N'
set hier_base.is_cyclic_flag = case when SQ.level_cycle > 0 then 'Y' else 'N' end, hier_base.cyclic_level = SQ.level_cycle, from_cyclic_level = 2;

-- base lev 3 --

set @base_id := null, @parent_id := null, @cyclic_level := 0, @grandparent_id := null, @store_data := null;
update #STG_TABLE_SCHEMA.hier_base hier_base
join (
select base.sys_id, base.sourceinstance, @base_id := base.lev_3_id, @parent_id := base.lev_5_id, @grandparent_id := base.lev_6_id,
@cyclic_level := 
case when @base_id = (@parent_id := base.lev_5_id) then 5
else case when @base_id = (@parent_id := base.lev_6_id) then 6
     else 0 end
end
level_cycle

from #STG_TABLE_SCHEMA.hier_data_temp base
) SQ
on SQ.sys_id = hier_base.sys_id and SQ.sourceinstance = hier_base.sourceinstance and hier_base.is_cyclic_flag = 'N'
set hier_base.is_cyclic_flag = case when SQ.level_cycle > 0 then 'Y' else 'N' end, hier_base.cyclic_level = SQ.level_cycle, from_cyclic_level = 3;

-- base lev 4 --

set @base_id := null, @parent_id := null, @cyclic_level := 0, @grandparent_id := null, @store_data := null;
update #STG_TABLE_SCHEMA.hier_base hier_base
join (
select base.sys_id, base.sourceinstance, @base_id := base.lev_4_id, @parent_id := base.lev_6_id, @grandparent_id := base.lev_7_id,
@cyclic_level := 
case when @base_id = (@parent_id := base.lev_6_id) then 6
else 0 
end
level_cycle

from #STG_TABLE_SCHEMA.hier_data_temp base
) SQ
on SQ.sys_id = hier_base.sys_id and SQ.sourceinstance = hier_base.sourceinstance and hier_base.is_cyclic_flag = 'N'
set hier_base.is_cyclic_flag = case when SQ.level_cycle > 0 then 'Y' else 'N' end, hier_base.cyclic_level = SQ.level_cycle, from_cyclic_level = 4;

-- Lev 2 -- 
update #STG_TABLE_SCHEMA.hier_base bs
join #STG_TABLE_SCHEMA.flat_hier_temp tmp
on tmp.child_id = bs.lev_6_id and tmp.child_sourceinstance = bs.sourceinstance and bs.curr_level = 1
set bs.lev_5_id = bs.lev_6_id, bs.lev_6_id = tmp.parent_id, bs.curr_level = bs.curr_level + 1, bs.inserted_on = current_timestamp
where tmp.invalid_flag = 'N';

-- Lev 3 -- 
update #STG_TABLE_SCHEMA.hier_base bs
join #STG_TABLE_SCHEMA.flat_hier_temp tmp
on tmp.child_id = bs.lev_6_id and tmp.child_sourceinstance = bs.sourceinstance and bs.curr_level = 2
set bs.lev_4_id = bs.lev_5_id, bs.lev_5_id = bs.lev_6_id, bs.lev_6_id = tmp.parent_id, bs.curr_level = bs.curr_level + 1, bs.inserted_on = current_timestamp
where tmp.invalid_flag = 'N';

-- Lev 4 -- 
update #STG_TABLE_SCHEMA.hier_base bs
join #STG_TABLE_SCHEMA.flat_hier_temp tmp
on tmp.child_id = bs.lev_6_id and tmp.child_sourceinstance = bs.sourceinstance and bs.curr_level = 3
set bs.lev_3_id = bs.lev_4_id, bs.lev_4_id = bs.lev_5_id, bs.lev_5_id = bs.lev_6_id, bs.lev_6_id = tmp.parent_id, bs.curr_level = bs.curr_level + 1, bs.inserted_on = current_timestamp
where tmp.invalid_flag = 'N';

-- Lev 5 -- 
update #STG_TABLE_SCHEMA.hier_base bs
join #STG_TABLE_SCHEMA.flat_hier_temp tmp
on tmp.child_id = bs.lev_6_id and tmp.child_sourceinstance = bs.sourceinstance and bs.curr_level = 4
set bs.lev_2_id = bs.lev_3_id, bs.lev_3_id = bs.lev_4_id, bs.lev_4_id = bs.lev_5_id, bs.lev_5_id = bs.lev_6_id, bs.lev_6_id = tmp.parent_id, bs.curr_level = bs.curr_level + 1, bs.inserted_on = current_timestamp
where tmp.invalid_flag = 'N';

-- Lev 6 -- 
update #STG_TABLE_SCHEMA.hier_base bs
join #STG_TABLE_SCHEMA.flat_hier_temp tmp
on tmp.child_id = bs.lev_6_id and tmp.child_sourceinstance = bs.sourceinstance and bs.curr_level = 5
set bs.lev_1_id = bs.lev_2_id, bs.lev_2_id = bs.lev_3_id, bs.lev_3_id = bs.lev_4_id, bs.lev_4_id = bs.lev_5_id, bs.lev_5_id = bs.lev_6_id, bs.lev_6_id = tmp.parent_id, bs.curr_level = bs.curr_level + 1, bs.inserted_on = current_timestamp
where tmp.invalid_flag = 'N';


-- Cyclic --
-- Lev 2 -- 
update #STG_TABLE_SCHEMA.hier_base bs
set bs.lev_6_id = bs.lev_0_id, bs.lev_5_id = bs.lev_0_id, bs.lev_4_id = bs.lev_0_id, bs.lev_3_id = bs.lev_0_id, bs.lev_2_id = bs.lev_0_id, bs.lev_1_id = bs.lev_0_id, bs.inserted_on = current_timestamp
where bs.is_cyclic_flag = 'Y' and bs.cyclic_level = 1;

-- Lev 3 -- 
update #STG_TABLE_SCHEMA.hier_base bs
set bs.lev_6_id = bs.lev_1_id, bs.lev_5_id = bs.lev_0_id, bs.lev_4_id = bs.lev_0_id, bs.lev_3_id = bs.lev_0_id, bs.lev_2_id = bs.lev_0_id, bs.lev_1_id = bs.lev_0_id, bs.inserted_on = current_timestamp
where bs.is_cyclic_flag = 'Y' and bs.cyclic_level = 2;

-- Lev 4 -- 
update #STG_TABLE_SCHEMA.hier_base bs
set bs.lev_6_id = bs.lev_2_id, bs.lev_5_id = bs.lev_1_id, bs.lev_4_id = bs.lev_0_id, bs.lev_3_id = bs.lev_0_id, bs.lev_2_id = bs.lev_0_id, bs.lev_1_id = bs.lev_0_id, bs.inserted_on = current_timestamp
where bs.is_cyclic_flag = 'Y' and bs.cyclic_level = 3;

-- Lev 5 -- 
update #STG_TABLE_SCHEMA.hier_base bs
set bs.lev_6_id = bs.lev_3_id, bs.lev_5_id = bs.lev_2_id, bs.lev_4_id = bs.lev_1_id, bs.lev_3_id = bs.lev_0_id, bs.lev_2_id = bs.lev_0_id, bs.lev_1_id = bs.lev_0_id, bs.inserted_on = current_timestamp
where bs.is_cyclic_flag = 'Y' and bs.cyclic_level = 4;

-- Lev 6 -- 
update #STG_TABLE_SCHEMA.hier_base bs
set bs.lev_6_id = bs.lev_4_id, bs.lev_5_id = bs.lev_3_id, bs.lev_4_id = bs.lev_2_id, bs.lev_3_id = bs.lev_1_id, bs.lev_2_id = bs.lev_0_id, bs.lev_1_id = bs.lev_0_id, bs.inserted_on = current_timestamp
where bs.is_cyclic_flag = 'Y' and bs.cyclic_level = 5;

-- breaking hierarchy if cyclic is forming same precedence hierarchy or lower precedence hierarchy --

update #STG_TABLE_SCHEMA.hier_base hier
join (
select distinct hier.log_key, hier.sys_id, hier.lev_5_id, CAST(lev_5_parent_prec.parent_precedence AS UNSIGNED) lev_5_parent_precedence, hier.lev_6_id, CAST(lev_6_parent_prec.parent_precedence AS UNSIGNED) lev_6_parent_precedence, 
case when hier.cyclic_level = 2 then base.lev_2_id 
     when hier.cyclic_level = 3 then base.lev_3_id
     when hier.cyclic_level = 4 then base.lev_4_id
     when hier.cyclic_level = 5 then base.lev_5_id
     when hier.cyclic_level = 6 then base.lev_6_id
end as cyclic_lev_id, CAST(cyclic_lev_parent_prec.parent_precedence AS UNSIGNED) cyclic_lev_parent_precedence
from #STG_TABLE_SCHEMA.hier_base hier
join #STG_TABLE_SCHEMA.flat_hier_temp lev_6_parent_prec
on lev_6_parent_prec.parent_id = hier.lev_6_id and lev_6_parent_prec.child_sourceinstance = hier.sourceinstance
join #STG_TABLE_SCHEMA.flat_hier_temp lev_5_parent_prec
on lev_5_parent_prec.parent_id = hier.lev_5_id and lev_5_parent_prec.child_sourceinstance = hier.sourceinstance
join #STG_TABLE_SCHEMA.hier_data_temp base
on hier.sys_id = base.sys_id and hier.sourceinstance = base.sourceinstance
join #STG_TABLE_SCHEMA.flat_hier_temp cyclic_lev_parent_prec
on cyclic_lev_parent_prec.parent_id = 
case when hier.cyclic_level = 2 then base.lev_2_id 
     when hier.cyclic_level = 3 then base.lev_3_id
     when hier.cyclic_level = 4 then base.lev_4_id
     when hier.cyclic_level = 5 then base.lev_5_id
     when hier.cyclic_level = 6 then base.lev_6_id
end
 and cyclic_lev_parent_prec.child_sourceinstance = hier.sourceinstance
where hier.is_cyclic_flag = 'Y'
) SQ
on SQ.log_key = hier.log_key and SQ.sys_id = hier.sys_id
set hier.lev_6_id = hier.lev_5_id, hier.lev_5_id = hier.lev_4_id, hier.lev_4_id = hier.lev_3_id, hier.lev_3_id = hier.lev_2_id, hier.lev_2_id = hier.lev_1_id, hier.lev_1_id = hier.lev_0_id
where (SQ.lev_5_parent_precedence = SQ.lev_6_parent_precedence = SQ.cyclic_lev_parent_precedence) 
or ((SQ.lev_5_parent_precedence <= SQ.lev_6_parent_precedence) and (SQ.lev_6_parent_precedence >= SQ.cyclic_lev_parent_precedence));

use #STG_TABLE_SCHEMA;

delete hier 
from #STG_TABLE_SCHEMA.hier_base hier
where cyclic_level = 2 and from_cyclic_level = 0 and is_cyclic_flag = 'Y';