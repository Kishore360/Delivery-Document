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