drop table if exists #STG_TABLE_SCHEMA.issue_changelog_link_temp;
create table if not exists #STG_TABLE_SCHEMA.issue_changelog_link_temp
(
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  log_key int(15) DEFAULT NULL,
  parent_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  parent_wi_number varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  parent_type_id bigint(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  parent_type varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  parent_precedence varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  child_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  child_wi_number varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  child_type_id bigint(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  child_type varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  sourceinstance bigint(20) NOT NULL DEFAULT '0',
  link_type varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  link_val varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL ,
  issue_field varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `from` text COLLATE utf8_unicode_ci,
  fromstring text COLLATE utf8_unicode_ci,
  `to` text COLLATE utf8_unicode_ci,
  tostring text COLLATE utf8_unicode_ci,
  link_created datetime DEFAULT NULL,
  cdctime datetime DEFAULT NULL,
  cdctype varchar(1) COLLATE utf8_unicode_ci DEFAULT 'X',
  sequence_id int(11) DEFAULT 0,
  parent_preference_id int(11) DEFAULT 0,
  invalid_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  inserted_on datetime DEFAULT NULL,
  
  index lnk_typ_idx (link_type, sourceinstance),
  index chld_wi_idx (child_wi_number, sourceinstance),
  index par_wi_idx (parent_wi_number, sourceinstance),
  index chld_wi_typ_idx (child_type_id, sourceinstance),
  index par_wi_typ_idx (parent_type_id, sourceinstance),
  index seq_id_idx (child_id, link_type, log_key, sourceinstance),
  index parent_prec_idx (parent_id, sourceinstance),
  index epic_link_idx (child_id, sourceinstance)
)
;

insert into #STG_TABLE_SCHEMA.issue_changelog_link_temp 
(sys_id, log_key, child_id, child_wi_number, child_type_id, parent_id, parent_wi_number, parent_type_id, sourceinstance, cdctype, issue_field, link_type, cdctime, `from`, fromstring, `to`, tostring, link_created, inserted_on)

select concat(issue.id, '~', coalesce(chnglogitems.issuechangelogid, 0), '~', chnglogitems.field) as sys_id,
chnglogitems.issuechangelogid as log_key, 
issue.id as child_id, 
issue.`key` as child_wi_number, 
issue.issuetype_id as child_type_id, 
issue_to_id.id parent_id, 
issue_to_id.`key` parent_wi_number,
issue_to_id.issuetype_id as parent_type_id, 
chnglog.sourceinstance as sourceinstance, 
chnglog.cdctype as cdctype, 
chnglogitems.field as issue_field, 
chnglogitems.field as link_type, 
chnglog.cdctime as cdctime, 
chnglogitems.`from` as `from`, 
chnglogitems.fromstring as fromstring, 
chnglogitems.`to` as `to`, 
chnglogitems.tostring as tostring,
chnglog.created as link_created,
current_timestamp as inserted_on
from #MDS_TABLE_SCHEMA.issue_final issue
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on chnglog.issueid = issue.id and chnglog.sourceinstance = issue.sourceinstance
join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance 
left join #MDS_TABLE_SCHEMA.issue_final issue_to_id
on COALESCE(chnglogitems.`to`, '') = issue_to_id.id and chnglogitems.sourceinstance = issue_to_id.sourceinstance
where field in ('Epic Link')

union all

select concat(issue.id, '~', coalesce(chnglogitems.issuechangelogid, 0), '~', chnglogitems.field) as sys_id,
chnglogitems.issuechangelogid as log_key, 
issue.id as child_id, 
issue.`key` as child_wi_number, 
issue.issuetype_id as child_type_id, 
issue_to_id.id parent_id, 
issue_to_id.`key` parent_wi_number, 
issue_to_id.issuetype_id as parent_type_id, 
chnglog.sourceinstance as sourceinstance, 
chnglog.cdctype as cdctype, 
chnglogitems.field as issue_field, 
chnglogitems.field as link_type, 
chnglog.cdctime as cdctime, 
chnglogitems.`from` as `from`, 
chnglogitems.fromstring as fromstring, 
chnglogitems.`to` as `to`, 
chnglogitems.tostring as tostring,
chnglog.created as link_created,
current_timestamp as inserted_on
from #MDS_TABLE_SCHEMA.issue_final issue
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on chnglog.issueid = issue.id and chnglog.sourceinstance = issue.sourceinstance
join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance 
left join #MDS_TABLE_SCHEMA.issue_final issue_to_id
on COALESCE(chnglogitems.`to`, '') = issue_to_id.id and chnglogitems.sourceinstance = issue_to_id.sourceinstance
where field in ('Parent')

union all

select concat(issue_to.id, '~', coalesce(chnglogitems.issuechangelogid, 0), '~', TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(chnglogitems.tostring, 'This issue ', ''), issue.`key`, ''), SUBSTRING_INDEX( chnglogitems.tostring, ' ', -1 ), 1))) as sys_id,
chnglogitems.issuechangelogid as log_key, 
issue_to.id child_id, 
COALESCE(issue_to.`key`, SUBSTRING_INDEX(chnglogitems.tostring, ' ', -1)) child_wi_number,
issue_to.issuetype_id as child_type_id, 
issue.id as parent_id, 
issue.`key` as parent_wi_number, 
issue.issuetype_id as parent_type_id, 
chnglog.sourceinstance as sourceinstance, 
chnglog.cdctype as cdctype, 
chnglogitems.field as issue_field, 
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(chnglogitems.tostring, 'This issue ', ''), issue.`key`, ''), SUBSTRING_INDEX( chnglogitems.tostring, ' ', -1 ), 1)) as link_type, 
chnglog.cdctime as cdctime, 
chnglogitems.`from` as `from`, 
chnglogitems.fromstring as fromstring, 
chnglogitems.`to` as `to`, 
chnglogitems.tostring as tostring,
chnglog.created as link_created,
current_timestamp as inserted_on
from #MDS_TABLE_SCHEMA.issue_final issue
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on chnglog.issueid = issue.id and chnglog.sourceinstance = issue.sourceinstance
join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance 
left join #MDS_TABLE_SCHEMA.issue_final issue_to
on COALESCE(chnglogitems.`to`, '') = issue_to.id and chnglogitems.sourceinstance = issue_to.sourceinstance
where chnglogitems.field in ('Link') and 
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(chnglogitems.tostring, 'This issue ', ''), issue.`key`, ''), SUBSTRING_INDEX( chnglogitems.tostring, ' ', -1 ), 1))
in ('is implemented by')

union all

select concat(issue_to.id, '~', coalesce(chnglogitems.issuechangelogid, 0), '~', TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(chnglogitems.tostring, 'This issue ', ''), issue.`key`, ''), SUBSTRING_INDEX( chnglogitems.tostring, ' ', -1 ), 1))) as sys_id,
chnglogitems.issuechangelogid as log_key, 
issue.id as child_id, 
issue.`key` as child_wi_number, 
issue.issuetype_id as child_type_id, 
issue_to.id parent_id, 
COALESCE(issue_to.`key`, SUBSTRING_INDEX(chnglogitems.tostring, ' ', -1)) parent_wi_number,
issue_to.issuetype_id as parent_type_id, 
chnglog.sourceinstance as sourceinstance, 
chnglog.cdctype as cdctype, 
chnglogitems.field as issue_field, 
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(chnglogitems.tostring, 'This issue ', ''), issue.`key`, ''), SUBSTRING_INDEX( chnglogitems.tostring, ' ', -1 ), 1)) as link_type, 
chnglog.cdctime as cdctime, 
chnglogitems.`from` as `from`, 
chnglogitems.fromstring as fromstring, 
chnglogitems.`to` as `to`, 
chnglogitems.tostring as tostring,
chnglog.created as link_created,
current_timestamp as inserted_on
from #MDS_TABLE_SCHEMA.issue_final issue
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on chnglog.issueid = issue.id and chnglog.sourceinstance = issue.sourceinstance
join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance 
left join #MDS_TABLE_SCHEMA.issue_final issue_to
on COALESCE(chnglogitems.`to`, '') = issue_to.id and chnglogitems.sourceinstance = issue_to.sourceinstance
where chnglogitems.field in ('Link') and 
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(chnglogitems.tostring, 'This issue ', ''), issue.`key`, ''), SUBSTRING_INDEX( chnglogitems.tostring, ' ', -1 ), 1))
in ('Parent');

update #STG_TABLE_SCHEMA.issue_changelog_link_temp base
join #MDS_TABLE_SCHEMA.issue_final parent_issue
on base.parent_wi_number = parent_issue.`key` and base.sourceinstance = parent_issue.sourceinstance and parent_issue.cdctype <> 'D'
set base.parent_id = parent_issue.id, base.parent_type_id = parent_issue.issuetype_id
where base.parent_id is null;

update #STG_TABLE_SCHEMA.issue_changelog_link_temp base
join #MDS_TABLE_SCHEMA.issue_final child_issue
on base.child_wi_number = child_issue.`key` and base.sourceinstance = child_issue.sourceinstance and child_issue.cdctype <> 'D'
set base.child_id = child_issue.id, base.child_type_id = child_issue.issuetype_id
where base.child_id is null;

update #STG_TABLE_SCHEMA.issue_changelog_link_temp base
set base.sys_id = concat(base.child_id, '~', base.log_key, '~', base.issue_field);

update #STG_TABLE_SCHEMA.issue_changelog_link_temp base
left join #MDS_TABLE_SCHEMA.issue_final child_issue
on base.child_wi_number = child_issue.`key` and base.sourceinstance = child_issue.sourceinstance
set base.invalid_flag = 'Y'
where (child_issue.id is null and base.child_id is null) or child_issue.cdctype = 'D';

delete from #STG_TABLE_SCHEMA.issue_changelog_link_temp
where child_id is null;

alter table #STG_TABLE_SCHEMA.issue_changelog_link_temp
add PRIMARY KEY pk (sys_id, sourceinstance);

insert into #STG_TABLE_SCHEMA.issue_changelog_link_temp
(sys_id, log_key, child_id, child_wi_number, child_type_id, parent_id, parent_wi_number, parent_type_id, sourceinstance, cdctype, issue_field, link_type, cdctime, `from`, fromstring, `to`, tostring, link_created, inserted_on)

select concat(issue.id, '~', coalesce(issue.id, 0), '~', 'Epic Link') as sys_id,
issue.id as log_key, 
issue.id as child_id, 
issue.`key` as child_wi_number, 
issue.issuetype_id as child_type_id, 
issue_parent.id as parent_id, 
EXT.customfield_10008 parent_wi_number,
issue_parent.issuetype_id as parent_type_id, 
issue.sourceinstance as sourceinstance, 
issue.cdctype as cdctype, 
'Epic Link' as issue_field, 
'Epic Link' as link_type, 
issue.cdctime as cdctime, 
issue.id as `from`, 
issue.`key` as fromstring, 
issue_parent.id as `to`, 
EXT.customfield_10008 as tostring,
issue.created as link_created,
current_timestamp as inserted_on
from #MDS_TABLE_SCHEMA.issue_final issue
join #MDS_TABLE_SCHEMA.issue_ext_final EXT
on issue.id = EXT.record_id and issue.sourceinstance = EXT.sourceinstance
join #MDS_TABLE_SCHEMA.issue_final issue_parent
on EXT.customfield_10008 = issue_parent.`key` and issue.sourceinstance = issue_parent.sourceinstance
where EXT.customfield_10008 is not null and 
(issue.id, issue.sourceinstance) not in 
(select TMP.child_id, TMP.sourceinstance
from #STG_TABLE_SCHEMA.issue_changelog_link_temp TMP
where TMP.issue_field = 'Epic Link');

insert into #STG_TABLE_SCHEMA.issue_changelog_link_temp
(sys_id, log_key, child_id, child_wi_number, child_type_id, parent_id, parent_wi_number, parent_type_id, sourceinstance, cdctype, issue_field, link_type, cdctime, `from`, fromstring, `to`, tostring, link_created, inserted_on)

select concat(issue.id, '~', coalesce(issue.id, 0), '~', 'Parent') as sys_id,
issue.id as log_key, 
issue.id as child_id, 
issue.`key` as child_wi_number, 
issue.issuetype_id as child_type_id, 
issue_parent.id as parent_id, 
issue_parent.`key` parent_wi_number,
issue_parent.issuetype_id as parent_type_id, 
issue.sourceinstance as sourceinstance, 
issue.cdctype as cdctype, 
'Parent' as issue_field, 
'Parent' as link_type, 
issue.cdctime as cdctime, 
issue.id as `from`, 
issue.`key` as fromstring, 
issue_parent.id as `to`, 
issue_parent.`key` as tostring,
issue.created as link_created,
current_timestamp as inserted_on
from #MDS_TABLE_SCHEMA.issue_final issue
join #MDS_TABLE_SCHEMA.issue_final issue_parent
on issue.parent_id = issue_parent.id and issue.sourceinstance = issue_parent.sourceinstance
where issue.parent_id is not null and 
(issue.id, issue.sourceinstance) not in 
(select TMP.child_id, TMP.sourceinstance
from #STG_TABLE_SCHEMA.issue_changelog_link_temp TMP
where TMP.link_type = 'Parent');

update #STG_TABLE_SCHEMA.issue_changelog_link_temp base
left join #DWH_TABLE_SCHEMA.d_lov_map child_wi_type
on concat('TYPE~WORK_ITEM~',upper(base.child_type_id)) = child_wi_type.src_rowid and base.sourceinstance = child_wi_type.source_id and child_wi_type.dimension_class = 'TYPE~WORK_ITEM'
set base.child_type = child_wi_type.dimension_wh_code;

update #STG_TABLE_SCHEMA.issue_changelog_link_temp base
left join #DWH_TABLE_SCHEMA.d_lov_map parent_wi_type
on concat('TYPE~WORK_ITEM~',upper(base.parent_type_id)) = parent_wi_type.src_rowid and base.sourceinstance = parent_wi_type.source_id and parent_wi_type.dimension_class = 'TYPE~WORK_ITEM'
set base.parent_type = parent_wi_type.dimension_wh_code;

update #STG_TABLE_SCHEMA.issue_changelog_link_temp base
left join #DWH_TABLE_SCHEMA.d_lov_map parent_wi_precedence
on concat('TYPE_LINK_PRECEDENCE~WORK_ITEM','~',upper(base.parent_type_id)) = parent_wi_precedence.src_rowid 
and base.sourceinstance=parent_wi_precedence.source_id and parent_wi_precedence.dimension_class = 'TYPE_LINK_PRECEDENCE~WORK_ITEM'
set base.parent_precedence = parent_wi_precedence.dimension_wh_code;

update #STG_TABLE_SCHEMA.issue_changelog_link_temp base
left join #DWH_TABLE_SCHEMA.d_lov_map link_type
on concat('LINK_TYPE~WORK_ITEM~',base.link_type) = link_type.src_rowid 
and base.sourceinstance=link_type.source_id and link_type.dimension_class = 'LINK_TYPE~WORK_ITEM'
set base.link_val = link_type.dimension_wh_code;

use #STG_TABLE_SCHEMA;

delete from #STG_TABLE_SCHEMA.issue_changelog_link_temp
where invalid_flag = 'Y';
