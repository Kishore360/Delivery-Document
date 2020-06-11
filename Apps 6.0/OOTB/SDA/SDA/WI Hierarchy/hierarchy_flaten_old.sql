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
issue_to.id parent_id, SUBSTRING_INDEX(chnglogitems.tostring, ' ', -1) parent_wi_number, parent_wi_type.dimension_wh_code parent_type, issue_to.sourceinstance parent_sourceinstance,
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
left join #DWH_TABLE_SCHEMA.d_lov_map link_type
on concat('LINK_TYPE~WORK_ITEM~', case when chnglogitems.field = 'link' then 
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(chnglogitems.tostring, 'This issue ', ''), issue.`key`, ''), SUBSTRING_INDEX(chnglogitems.tostring, ' ', -1 ), 1))
else chnglogitems.field end) = link_type.src_rowid
and chnglogitems.sourceinstance=link_type.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map child_wi_type
on concat('TYPE~WORK_ITEM','~',upper(issue.IssueTypeId)) = child_wi_type.src_rowid
and issue.sourceinstance=child_wi_type.source_id
left join #MDS_TABLE_SCHEMA.issue_final issue_to
on COALESCE(chnglogitems.`to`, '') = issue_to.id and chnglogitems.sourceinstance = issue_to.sourceinstance
left join #DWH_TABLE_SCHEMA.d_lov_map parent_wi_type
on concat('TYPE~WORK_ITEM','~',upper(issue_to.IssueTypeId)) = parent_wi_type.src_rowid
and issue_to.sourceinstance=parent_wi_type.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map parent_wi_precedence
on concat('TYPE_LINK_PRECEDENCE~WORK_ITEM','~',upper(issue_to.IssueTypeId)) = parent_wi_precedence.src_rowid
and issue_to.sourceinstance=parent_wi_precedence.source_id
where chnglogitems.`field` in ('Epic Link', 'Parent')
and link_type.dimension_wh_code in ('EPIC', 'PARENT')
and issue.id is not null

union all

select chnglogitems.issuechangelogid as log_key, issue_child.id child_id, SUBSTRING_INDEX(COALESCE(chnglogitems.tostring, chnglogitems.fromstring), ' ', -1) child_wi_number, child_wi_type.dimension_wh_code child_type, issue_child.sourceinstance child_sourceinstance, 
issue.id parent_id, issue.`key` parent_wi_number, parent_wi_type.dimension_wh_code parent_type, issue.sourceinstance parent_sourceinstance,
parent_wi_precedence.dimension_wh_code parent_precedence,
case when chnglogitems.field = 'link' then 
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(COALESCE(chnglogitems.tostring, chnglogitems.fromstring), 'This issue ', ''), issue.`key`, ''), SUBSTRING_INDEX( COALESCE(chnglogitems.tostring, chnglogitems.fromstring), ' ', -1 ), 1))
else chnglogitems.field end as link_type, 
link_type.dimension_wh_code link_val,
chnglogitems.`field` as issue_field, 
CASE WHEN chnglogitems.field = 'link' 
THEN TRIM(REPLACE(REPLACE(COALESCE(chnglogitems.tostring, chnglogitems.fromstring), 'This issue ', ''), issue.`key`, '')) 
ELSE chnglogitems.field END textval,
chnglog.created as link_created,
current_timestamp as inserted_on
from #MDS_TABLE_SCHEMA.issue_final issue
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on chnglog.issueid = issue.id and chnglog.sourceinstance = issue.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_lov_map link_type
on concat('LINK_TYPE~WORK_ITEM~', case when chnglogitems.field = 'link' then 
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(COALESCE(chnglogitems.tostring, chnglogitems.fromstring), 'This issue ', ''), issue.`key`, ''), SUBSTRING_INDEX( COALESCE(chnglogitems.tostring, chnglogitems.fromstring), ' ', -1 ), 1))
else chnglogitems.field end) = link_type.src_rowid
and chnglogitems.sourceinstance=link_type.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map parent_wi_type
on concat('TYPE~WORK_ITEM','~',upper(issue.IssueTypeId)) = parent_wi_type.src_rowid
and issue.sourceinstance=parent_wi_type.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map parent_wi_precedence
on concat('TYPE_LINK_PRECEDENCE~WORK_ITEM','~',upper(issue.IssueTypeId)) = parent_wi_precedence.src_rowid
and issue.sourceinstance=parent_wi_precedence.source_id
left join #MDS_TABLE_SCHEMA.issue_final issue_child
on COALESCE(chnglogitems.`to`, chnglogitems.`from`) = issue_child.`key` and chnglogitems.sourceinstance = issue_child.sourceinstance
left join #DWH_TABLE_SCHEMA.d_lov_map child_wi_type
on concat('TYPE~WORK_ITEM','~',upper(issue_child.IssueTypeId)) = child_wi_type.src_rowid
and issue_child.sourceinstance=child_wi_type.source_id
where chnglogitems.`field` in ('Link')
and link_type.dimension_wh_code in ('IMPLEMENTED_BY')
and issue_child.id is not null

union all

select chnglogitems.issuechangelogid as log_key, issue.id child_id, issue.`key` child_wi_number, child_wi_type.dimension_wh_code child_type, issue.sourceinstance child_sourceinstance, 
issue_parent.id parent_id, SUBSTRING_INDEX(COALESCE(chnglogitems.tostring, ''), ' ', -1) parent_wi_number, parent_wi_type.dimension_wh_code parent_type, issue_parent.sourceinstance parent_sourceinstance,
parent_wi_precedence.dimension_wh_code parent_precedence,
case when chnglogitems.field = 'link' then 
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(COALESCE(chnglogitems.tostring, chnglogitems.fromstring), 'This issue ', ''), issue.`key`, ''), SUBSTRING_INDEX( COALESCE(chnglogitems.tostring, chnglogitems.fromstring), ' ', -1 ), 1))
else chnglogitems.field end as link_type, 
link_type.dimension_wh_code link_val,
chnglogitems.`field` as issue_field, 
CASE WHEN chnglogitems.field = 'link' 
THEN TRIM(REPLACE(REPLACE(COALESCE(chnglogitems.tostring, chnglogitems.fromstring), 'This issue ', ''), issue.`key`, '')) 
ELSE chnglogitems.field END textval,
chnglog.created as link_created,
current_timestamp as inserted_on
from #MDS_TABLE_SCHEMA.issue_final issue
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on chnglog.issueid = issue.id and chnglog.sourceinstance = issue.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_lov_map link_type
on concat('LINK_TYPE~WORK_ITEM~', case when chnglogitems.field = 'link' then 
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(COALESCE(chnglogitems.tostring, chnglogitems.fromstring), 'This issue ', ''), issue.`key`, ''), SUBSTRING_INDEX( COALESCE(chnglogitems.tostring, chnglogitems.fromstring), ' ', -1 ), 1))
else chnglogitems.field end) = link_type.src_rowid
and chnglogitems.sourceinstance=link_type.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map child_wi_type
on concat('TYPE~WORK_ITEM','~',upper(issue.IssueTypeId)) = child_wi_type.src_rowid
and issue.sourceinstance=child_wi_type.source_id
left join #MDS_TABLE_SCHEMA.issue_final issue_parent
on COALESCE(chnglogitems.`to`, '') = issue_parent.`key` and chnglogitems.sourceinstance = issue_parent.sourceinstance
left join #DWH_TABLE_SCHEMA.d_lov_map parent_wi_type
on concat('TYPE~WORK_ITEM','~',upper(issue_parent.IssueTypeId)) = parent_wi_type.src_rowid
and issue_parent.sourceinstance=parent_wi_type.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map parent_wi_precedence
on concat('TYPE_LINK_PRECEDENCE~WORK_ITEM','~',upper(issue_parent.IssueTypeId)) = parent_wi_precedence.src_rowid
and issue_parent.sourceinstance=parent_wi_precedence.source_id
where chnglogitems.`field` in ('Link')
and link_type.dimension_wh_code in ('PARENT')
and issue_parent.id is not null
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
and SRC.link_val = SRC_B.link_val 
and SRC.log_key < SRC_B.log_key
and SRC.sequence_id + 1 = SRC_B.sequence_id;

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
  and (main.parent_precedence < base.parent_precedence or (main.parent_precedence = base.parent_precedence and (main.link_created > base.link_created or (main.link_created = base.link_created and main.log_key > base.log_key))))
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
select SRC.child_id, SRC.child_sourceinstance, count(distinct SRC.parent_id) parent_count
from #STG_TABLE_SCHEMA.flat_hier_temp SRC
group by SRC.child_id, SRC.child_sourceinstance
having count(distinct SRC.parent_id) > 1
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

/*use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.flat_hier_temp SRC
join (
 select main.log_key, main.child_id,  main.parent_id, main.link_type, main.link_created,main.sourceinstance,
 (
 select count(*) + 1
 from (
 SELECT tmp.log_key, tmp.child_id child_id, tmp.parent_id parent_id, tmp.link_type, tmp.link_val, tmp.link_created, tmp.child_sourceinstance sourceinstance, tmp.parent_precedence
 FROM #STG_TABLE_SCHEMA.flat_hier_temp tmp where tmp.invalid_flag = 'N'
 ) base
 where base.child_id = main.child_id and base.sourceinstance = main.sourceinstance 
  and (main.parent_precedence < base.parent_precedence or (main.parent_precedence = base.parent_precedence and (main.link_created > base.link_created or (main.link_created = base.link_created and main.log_key > base.log_key))))
 ) sequence_id1
 from 
 (
 SELECT tmp.log_key, tmp.child_id child_id, tmp.parent_id parent_id, tmp.link_type, tmp.link_val, tmp.link_created, tmp.child_sourceinstance sourceinstance, tmp.parent_precedence
 FROM #STG_TABLE_SCHEMA.flat_hier_temp tmp where tmp.invalid_flag = 'N'
 ) main
order by main.link_type, main.child_id,  main.parent_id, main.log_key
) SQ
on SRC.child_id = SQ.child_id and SRC.link_type = SQ.link_type and SRC.log_key = SQ.log_key and SRC.child_sourceinstance = SQ.sourceinstance
set SRC.sequence_id = SQ.sequence_id1;*/