drop table if exists #STG_TABLE_SCHEMA.work_item_link_base;

create table if not exists #STG_TABLE_SCHEMA.work_item_link_base (
  sourceKey varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  sourceinstance bigint(20) NOT NULL DEFAULT 0,
  targetKey varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  isActive tinyint(1) DEFAULT null,
  changedDate datetime DEFAULT null,
  linkType varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  changedOperation varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  link_status char(1) COLLATE utf8_unicode_ci DEFAULT 'P'
  );
  
Insert into #STG_TABLE_SCHEMA.work_item_link_base
(sourceKey, sourceinstance, targetKey, isActive, changedDate, linkType, changedOperation, link_status)

select lnk.sourceKey, lnk.sourceinstance, lnk.targetKey,  lnk.isActive, lnk.changedDate, lnk.linkType, lnk.changedOperation, 
case when lnk.sourceKey = del_lnk.sourceKey and lnk.targetKey = del_lnk.targetKey and lnk.sourceinstance = del_lnk.sourceinstance and lnk.changedDate < del_lnk.changedDate then 'D' else 'P' end as link_status
from #MDS_TABLE_SCHEMA.azure_workitem_link_final lnk
left join 
(
select lnk.sourceKey, lnk.sourceinstance, lnk.targetKey,  lnk.isActive, lnk.changedDate, lnk.linkType, lnk.changedOperation
from #MDS_TABLE_SCHEMA.azure_workitem_link_final lnk
where lnk.isActive = 0 or lnk.changedOperation = 'remove'
) del_lnk
on lnk.sourceKey = del_lnk.sourceKey and lnk.targetKey = del_lnk.targetKey and lnk.sourceinstance = del_lnk.sourceinstance;

delete from #STG_TABLE_SCHEMA.work_item_link_base
where link_status = 'D';