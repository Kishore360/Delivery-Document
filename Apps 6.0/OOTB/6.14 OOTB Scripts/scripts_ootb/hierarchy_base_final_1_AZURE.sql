-- Entire script for HIERARCHY

drop table if exists #STG_TABLE_SCHEMA.flat_hier_temp;

create table if not exists #STG_TABLE_SCHEMA.flat_hier_temp (
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  log_key varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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

select distinct concat(child_wi.__numerify__primary_key, '~', coalesce(lnk.__numerify__primary_key, 0), '~', lnk_typ.name) as sys_id,
lnk.__numerify__primary_key as log_key, child_wi.__numerify__primary_key child_id, child_wi.id child_wi_number, child_wi_type.dimension_wh_code child_type, coalesce(child_wi.sourceinstance, 25) child_sourceinstance,
parent_wi.__numerify__primary_key parent_id, parent_wi.id parent_wi_number, parent_wi_type.dimension_wh_code parent_type, coalesce(parent_wi.sourceinstance, 25) parent_sourceinstance,
0 as parent_precedence,
lnk.linkType as link_type, 
lnk_typ.name as link_val,
'PARENT' as issue_field, 
'Parent' as textval,
lnk.changedDate as link_created,
'azure_workitem_link_final' as source_table,
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
where lnk_typ.name = 'Parent' and lnk.isActive = 1;

alter table #STG_TABLE_SCHEMA.flat_hier_temp
ADD INDEX first_idx (child_id,child_sourceinstance),
ADD INDEX second_idx (parent_id,parent_sourceinstance);