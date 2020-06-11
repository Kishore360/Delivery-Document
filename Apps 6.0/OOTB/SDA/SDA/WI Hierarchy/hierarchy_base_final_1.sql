-- Entire script for HIERARCHY

drop table if exists #STG_TABLE_SCHEMA.flat_hier_temp;

create table if not exists #STG_TABLE_SCHEMA.flat_hier_temp (
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
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
  source_table varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  inserted_on datetime DEFAULT NULL,
    
  PRIMARY KEY (sys_id, child_sourceinstance)
);

insert into #STG_TABLE_SCHEMA.flat_hier_temp
(sys_id, log_key, child_id, child_wi_number, child_type, child_sourceinstance, parent_id, parent_wi_number, parent_type, parent_sourceinstance, parent_precedence, 
link_type, link_val, issue_field, textval, link_created, source_table, inserted_on)

select concat(issue.id, '~', coalesce(chnglogitems.issuechangelogid, 0), '~', link_type.dimension_wh_code) as sys_id,
chnglogitems.issuechangelogid as log_key, issue.id child_id, issue.`key` child_wi_number, child_wi_type.dimension_wh_code child_type, issue.sourceinstance child_sourceinstance,
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
'issue_changelog' as source_table,
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

select concat(issue.id, '~', coalesce(chnglogitems.issuechangelogid, 0), '~', link_type.dimension_wh_code) as sys_id,
chnglogitems.issuechangelogid as log_key, issue.id child_id, issue.`key` child_wi_number, child_wi_type.dimension_wh_code child_type, coalesce(issue.sourceinstance, 2) child_sourceinstance,
coalesce(issue_to_id.id, issue_to_key.id) parent_id, coalesce(issue_to_id.`key`, SUBSTRING_INDEX(chnglogitems.tostring, ' ', -1)) parent_wi_number, parent_wi_type.dimension_wh_code parent_type, coalesce(issue_to_id.sourceinstance, issue_to_key.sourceinstance, 2) parent_sourceinstance,
parent_wi_precedence.dimension_wh_code parent_precedence,
chnglogitems.field as link_type, 
link_type.dimension_wh_code as link_val,
chnglogitems.`field` as issue_field, 
chnglogitems.field textval,
chnglog.created as link_created,
'issue_changelog' as source_table,
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
on concat('LINK_TYPE~WORK_ITEM~', chnglogitems.field) = link_type.src_rowid
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
where chnglogitems.`field` in ('Parent')
and link_type.dimension_wh_code in ('PARENT')
and issue.id is not null

union all

select concat(issue_child.id, '~', coalesce(chnglogitems.issuechangelogid, 0), '~', link_type.dimension_wh_code) as sys_id,
chnglogitems.issuechangelogid as log_key, issue_child.id child_id, SUBSTRING_INDEX(COALESCE(chnglogitems.tostring, chnglogitems.fromstring), ' ', -1) child_wi_number, child_wi_type.dimension_wh_code child_type, coalesce(issue_child.sourceinstance, 2) child_sourceinstance, 
issue.id parent_id, issue.`key` parent_wi_number, parent_wi_type.dimension_wh_code parent_type, coalesce(issue.sourceinstance, 2) parent_sourceinstance,
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
'issue_changelog' as source_table,
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

select concat(issue.id, '~', coalesce(chnglogitems.issuechangelogid, 0), '~', link_type.dimension_wh_code) as sys_id,
chnglogitems.issuechangelogid as log_key, issue.id child_id, issue.`key` child_wi_number, child_wi_type.dimension_wh_code child_type, coalesce(issue.sourceinstance, 2) child_sourceinstance, 
issue_parent.id parent_id, SUBSTRING_INDEX(COALESCE(chnglogitems.tostring, ''), ' ', -1) parent_wi_number, parent_wi_type.dimension_wh_code parent_type, coalesce(issue_parent.sourceinstance, 2) parent_sourceinstance,
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
'issue_changelog' as source_table,
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

insert into #STG_TABLE_SCHEMA.flat_hier_temp
(sys_id, log_key, child_id, child_wi_number, child_type, child_sourceinstance, parent_id, parent_wi_number, parent_type, parent_sourceinstance, parent_precedence, 
link_type, link_val, issue_field, textval, link_created, source_table, inserted_on)

select concat(issue.id, '~', 0, '~', link_type.dimension_wh_code) as sys_id,
1 as log_key, issue.id child_id, issue.`key` child_wi_number, child_wi_type.dimension_wh_code child_type, coalesce(issue.sourceinstance, 2) child_sourceinstance,
issue_parent.id parent_id, issue_parent.`key` parent_wi_number, parent_wi_type.dimension_wh_code parent_type, coalesce(issue_parent.sourceinstance, 2) parent_sourceinstance,
parent_wi_precedence.dimension_wh_code parent_precedence,
'Epic Link' as link_type, 
link_type.dimension_wh_code link_val,
'Epic Link' as issue_field, 
'Epic Link' as textval,
coalesce(chnglog.created, issue.created) as link_created,
'issue' as source_table,
current_timestamp as inserted_on

from #MDS_TABLE_SCHEMA.issue_final issue
left join #MDS_TABLE_SCHEMA.issue_final issue_parent
on issue.epic_link = issue_parent.`key` and issue.sourceinstance = issue_parent.sourceinstance
left join (
select max(chnglogitems.issuechangelogid) as issuechangelogid, chnglog.issueid, chnglog.sourceinstance, max(chnglog.created) as created, chnglogitems.`field`, chnglogitems.`to`
from #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance 
where chnglogitems.`field` in ('Epic Link') and (chnglogitems.`to` is not null or chnglogitems.tostring is not null)
group by chnglog.issueid, chnglog.sourceinstance, chnglogitems.`field`
) chnglog
on chnglog.issueid = issue.id and chnglog.sourceinstance = issue.sourceinstance and chnglog.`to` = issue_parent.id
left join #DWH_TABLE_SCHEMA.d_lov_map link_type
on concat('LINK_TYPE~WORK_ITEM~', 'Epic Link') = link_type.src_rowid
and issue_parent.sourceinstance=link_type.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map child_wi_type
on concat('TYPE~WORK_ITEM','~',upper(issue.IssueTypeId)) = child_wi_type.src_rowid
and issue.sourceinstance=child_wi_type.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map parent_wi_type
on concat('TYPE~WORK_ITEM','~',upper(issue_parent.IssueTypeId)) = parent_wi_type.src_rowid
and issue_parent.sourceinstance=parent_wi_type.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map parent_wi_precedence
on concat('TYPE_LINK_PRECEDENCE~WORK_ITEM','~',upper(issue_parent.IssueTypeId)) = parent_wi_precedence.src_rowid
and issue_parent.sourceinstance=parent_wi_precedence.source_id
where link_type.dimension_wh_code in ('EPIC')
and issue.id is not null and issue.epic_link is not null
and issue.id not in 
(
select tmp.child_id
from #STG_TABLE_SCHEMA.flat_hier_temp tmp
where tmp.link_type = 'Epic Link' and link_val = 'EPIC'
);

insert into #STG_TABLE_SCHEMA.flat_hier_temp
(sys_id, log_key, child_id, child_wi_number, child_type, child_sourceinstance, parent_id, parent_wi_number, parent_type, parent_sourceinstance, parent_precedence, 
link_type, link_val, issue_field, textval, link_created, source_table, inserted_on)

select concat(issue.id, '~', 0, '~', link_type.dimension_wh_code) as sys_id,
1 as log_key, issue.id child_id, issue.`key` child_wi_number, child_wi_type.dimension_wh_code child_type, coalesce(issue.sourceinstance, 2) child_sourceinstance,
issue_parent.id parent_id, issue_parent.`key` parent_wi_number, 
parent_wi_type.dimension_wh_code parent_type, coalesce(issue_parent.sourceinstance, 2) parent_sourceinstance,
parent_wi_precedence.dimension_wh_code parent_precedence,
coalesce(chnglog.field, 'Parent') as link_type, 
link_type.dimension_wh_code link_val,
coalesce(chnglog.`field`, 'Parent') as issue_field, 
coalesce(chnglog.`field`, 'Parent') textval,
coalesce(chnglog.created, issue.created) as link_created,
'issue' as source_table,
current_timestamp as inserted_on

from #MDS_TABLE_SCHEMA.issue_final issue
left join #MDS_TABLE_SCHEMA.issue_final issue_parent
on issue.parentid = issue_parent.id and issue.sourceinstance = issue_parent.sourceinstance
left join (
select max(chnglogitems.issuechangelogid) as issuechangelogid, chnglog.issueid, chnglog.sourceinstance, max(chnglog.created) as created, chnglogitems.`field`, chnglogitems.`to`, chnglogitems.tostring
from #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance 
where chnglogitems.`field` in ('Parent') and (chnglogitems.`to` is not null or chnglogitems.tostring is not null)
group by chnglog.issueid, chnglog.sourceinstance, chnglogitems.`field`
) chnglog
on chnglog.issueid = issue.id and chnglog.sourceinstance = issue.sourceinstance and chnglog.`to` = issue_parent.id 
left join #DWH_TABLE_SCHEMA.d_lov_map link_type
on concat('LINK_TYPE~WORK_ITEM~', coalesce(chnglog.`field`, 'Parent')) = link_type.src_rowid
and chnglog.sourceinstance=link_type.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map child_wi_type
on concat('TYPE~WORK_ITEM','~',upper(issue.IssueTypeId)) = child_wi_type.src_rowid
and issue.sourceinstance=child_wi_type.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map parent_wi_type
on concat('TYPE~WORK_ITEM','~',upper(issue_parent.IssueTypeId)) = parent_wi_type.src_rowid
and issue_parent.sourceinstance=parent_wi_type.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map parent_wi_precedence
on concat('TYPE_LINK_PRECEDENCE~WORK_ITEM','~',upper(issue_parent.IssueTypeId)) = parent_wi_precedence.src_rowid
and issue_parent.sourceinstance=parent_wi_precedence.source_id
where coalesce(chnglog.`field`, 'Parent') in ('Parent')
and link_type.dimension_wh_code in ('PARENT')
and issue.id is not null
and issue.id not in 
(
select tmp.child_id
from #STG_TABLE_SCHEMA.flat_hier_temp tmp
where tmp.link_type = 'Parent' and link_val = 'PARENT'
)