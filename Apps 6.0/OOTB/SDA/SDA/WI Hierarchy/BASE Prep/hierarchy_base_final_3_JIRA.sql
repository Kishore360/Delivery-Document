drop table if exists #STG_TABLE_SCHEMA.parent_removed_temp;

create table if not exists #STG_TABLE_SCHEMA.parent_removed_temp (
  log_key int(15) DEFAULT NULL,
  old_parent_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  old_parent_wi_number varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  child_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  child_wi_number varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  sourceinstance bigint(20) NOT NULL DEFAULT '0',
  link_type varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  link_val varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL ,
  issue_field varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  link_created datetime DEFAULT NULL,
  inserted_on datetime DEFAULT NULL,
    
  PRIMARY KEY (log_key, sourceinstance)
);

insert into #STG_TABLE_SCHEMA.parent_removed_temp
(log_key, child_id, child_wi_number, old_parent_id, old_parent_wi_number, sourceinstance, link_type, link_val, issue_field, link_created, inserted_on)

select chnglogitems.issuechangelogid as log_key, issue.id child_id, issue.`key` child_wi_number, coalesce(issue_from_id.id, issue_from_key.id) parent_id, coalesce(issue_from_id.`key`, SUBSTRING_INDEX(chnglogitems.tostring, ' ', -1)) parent_wi_number, 
coalesce(issue_from_id.sourceinstance, issue_from_key.sourceinstance, issue.sourceinstance) sourceinstance, chnglogitems.field as link_type, null as link_val, chnglogitems.`field` as issue_field, chnglog.created as link_created, current_timestamp as inserted_on
from #MDS_TABLE_SCHEMA.issue_final issue
join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on chnglog.issueid = issue.id and chnglog.sourceinstance = issue.sourceinstance
join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_final issue_from_key
on COALESCE(chnglogitems.tostring, '') = issue_from_key.`key` and chnglogitems.sourceinstance = issue_from_key.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_final issue_from_id
on COALESCE(chnglogitems.`to`, '') = issue_from_id.id and chnglogitems.sourceinstance = issue_from_id.sourceinstance
left join #DWH_TABLE_SCHEMA.d_lov_map link_type
on concat('LINK_TYPE~WORK_ITEM~', chnglogitems.field) = link_type.src_rowid and chnglogitems.sourceinstance=link_type.source_id and link_type.dimension_class = 'LINK_TYPE~WORK_ITEM'
where chnglogitems.`field` in ('Epic Link', 'Parent')
and link_type.dimension_wh_code in ('EPIC', 'PARENT')
and issue.id is not null and (chnglogitems.tostring is null or chnglogitems.`to` is null)

union all

select chnglogitems.issuechangelogid as log_key, issue_child.id child_id, SUBSTRING_INDEX(COALESCE(chnglogitems.tostring, chnglogitems.fromstring), ' ', -1) child_wi_number, 
issue.id parent_id, issue.`key` parent_wi_number, issue.sourceinstance sourceinstance,
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(COALESCE(chnglogitems.tostring, chnglogitems.fromstring), 'This issue ', ''), issue_child.`key`, ''), SUBSTRING_INDEX( COALESCE(chnglogitems.tostring, chnglogitems.fromstring), ' ', -1 ), 1)) as link_type, null as link_val, 
chnglogitems.`field` as issue_field, 
chnglog.created as link_created,
current_timestamp as inserted_on
from #MDS_TABLE_SCHEMA.issue_final issue
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on chnglog.issueid = issue.id and chnglog.sourceinstance = issue.sourceinstance
join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_final issue_child
on COALESCE(chnglogitems.`to`, chnglogitems.`from`) = issue_child.`key` and chnglogitems.sourceinstance = issue_child.sourceinstance
left join #DWH_TABLE_SCHEMA.d_lov_map link_type
on concat('LINK_TYPE~WORK_ITEM~', case when chnglogitems.field = 'link' then 
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(COALESCE(chnglogitems.tostring, chnglogitems.fromstring), 'This issue ', ''), issue_child.`key`, ''), SUBSTRING_INDEX( COALESCE(chnglogitems.tostring, chnglogitems.fromstring), ' ', -1 ), 1))
else chnglogitems.field end) = link_type.src_rowid and chnglogitems.sourceinstance=link_type.source_id and link_type.dimension_class = 'LINK_TYPE~WORK_ITEM'
where chnglogitems.`field` in ('Link')
and link_type.dimension_wh_code in ('IMPLEMENTED_BY')
and issue_child.id is not null and (chnglogitems.tostring is null or chnglogitems.`to` is null)

union all

select chnglogitems.issuechangelogid as log_key, issue.id child_id, issue.`key` child_wi_number, issue_parent.id parent_id, SUBSTRING_INDEX(COALESCE(chnglogitems.fromstring, ''), ' ', -1) parent_wi_number, issue_parent.sourceinstance sourceinstance,
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(chnglogitems.fromstring, 'This issue ', ''), issue_parent.`key`, ''), SUBSTRING_INDEX( chnglogitems.fromstring, ' ', -1 ), 1)) as link_type, null as link_val, chnglogitems.`field` as issue_field,
chnglog.created as link_created,
current_timestamp as inserted_on
from #MDS_TABLE_SCHEMA.issue_final issue
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on chnglog.issueid = issue.id and chnglog.sourceinstance = issue.sourceinstance
join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_final issue_parent
on COALESCE(chnglogitems.`from`, '') = issue_parent.`key` and chnglogitems.sourceinstance = issue_parent.sourceinstance
left join #DWH_TABLE_SCHEMA.d_lov_map link_type
on concat('LINK_TYPE~WORK_ITEM~', case when chnglogitems.field = 'link' then 
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(chnglogitems.fromstring, 'This issue ', ''), issue_parent.`key`, ''), SUBSTRING_INDEX( chnglogitems.fromstring, ' ', -1 ), 1))
else chnglogitems.field end) = link_type.src_rowid and chnglogitems.sourceinstance=link_type.source_id and link_type.dimension_class = 'LINK_TYPE~WORK_ITEM'
where chnglogitems.`field` in ('Link')
and link_type.dimension_wh_code in ('PARENT')
and issue_parent.id is not null and (chnglogitems.tostring is null or chnglogitems.`to` is null)
order by child_id, child_wi_number, issue_field;

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.parent_removed_temp base
left join #DWH_TABLE_SCHEMA.d_lov_map link_type
on concat('LINK_TYPE~WORK_ITEM~',base.link_type) = link_type.src_rowid 
and base.sourceinstance=link_type.source_id and link_type.dimension_class = 'LINK_TYPE~WORK_ITEM'
set base.link_val = link_type.dimension_wh_code;

use #STG_TABLE_SCHEMA;

delete hier
from #STG_TABLE_SCHEMA.issue_changelog_link_temp hier
join #STG_TABLE_SCHEMA.parent_removed_temp removed_parent
on hier.child_id = removed_parent.child_id and hier.parent_id = removed_parent.old_parent_id and coalesce(hier.link_type, hier.link_val) = coalesce(removed_parent.link_type, removed_parent.link_val) and hier.sourceinstance = removed_parent.sourceinstance
and removed_parent.link_created > hier.link_created and removed_parent.log_key > hier.log_key;

use #STG_TABLE_SCHEMA;

delete SRC
from #STG_TABLE_SCHEMA.issue_changelog_link_temp SRC
join (
select tmp.child_id, tmp.child_wi_number, tmp.link_type, tmp.link_val, max(tmp.sequence_id) max_sequence_id
from #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp 
where tmp.link_type = 'Epic Link'
group by tmp.child_id, tmp.child_wi_number, tmp.link_type, tmp.link_val
) SQ
on SRC.child_id = SQ.child_id and SRC.child_wi_number = SQ.child_wi_number and SRC.link_type = SQ.link_type and SRC.sequence_id < SQ.max_sequence_id
where SRC.link_type = 'Epic Link';

use #STG_TABLE_SCHEMA;

delete SRC 
from #STG_TABLE_SCHEMA.issue_changelog_link_temp SRC
join (
select tmp.child_id, tmp.child_wi_number, tmp.link_type, tmp.link_val, min(tmp.sequence_id) max_sequence_id
from #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp 
where tmp.issue_field = 'Parent'
group by tmp.child_id, tmp.child_wi_number, tmp.link_type, tmp.link_val
) SQ
on SRC.child_id = SQ.child_id and SRC.child_wi_number = SQ.child_wi_number and SRC.link_type = SQ.link_type and SRC.link_val = SQ.link_val and SRC.sequence_id > SQ.max_sequence_id
where SRC.issue_field = 'Parent';

drop table if exists #STG_TABLE_SCHEMA.issue_changelog_link_temp_bkp;

create table #STG_TABLE_SCHEMA.issue_changelog_link_temp_bkp select * from #STG_TABLE_SCHEMA.issue_changelog_link_temp;

use #STG_TABLE_SCHEMA;

delete SRC 
from #STG_TABLE_SCHEMA.issue_changelog_link_temp SRC
join (
select SRC.child_id, SRC.link_type
from #STG_TABLE_SCHEMA.issue_changelog_link_temp SRC
join (
select child_id, link_type, max(sequence_id) as max_sequence_id
from #STG_TABLE_SCHEMA.issue_changelog_link_temp
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
from #STG_TABLE_SCHEMA.issue_changelog_link_temp SRC
where SRC.child_id = SRC.parent_id;