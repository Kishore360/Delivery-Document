drop table if exists #STG_TABLE_SCHEMA.azure_workitem_update_base;

create table if not exists #STG_TABLE_SCHEMA.azure_workitem_update_base (
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  authorkey text COLLATE utf8_unicode_ci,
  issueid varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  created datetime DEFAULT NULL,
  revised datetime DEFAULT NULL,
  sourceinstance bigint(20) NOT NULL DEFAULT '0',
  cdctype varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  fromstring text COLLATE utf8_unicode_ci,
  `from` text COLLATE utf8_unicode_ci,
  tostring text COLLATE utf8_unicode_ci,  
  `to` text COLLATE utf8_unicode_ci,
  `field` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  sequence_id bigint(20) NOT NULL DEFAULT 0,
  primary_sequence_id bigint(20) NOT NULL DEFAULT 0,
  inserted_on datetime DEFAULT NULL,
  PRIMARY KEY (sys_id,sourceinstance),
  INDEX base_idx (issueid, id,`field`),
  INDEX second_idx (issueid, sourceinstance)
);

insert into #STG_TABLE_SCHEMA.azure_workitem_update_base
(sys_id, authorkey, issueid, created, revised, sourceinstance, cdctype, id, fromstring, `from`, tostring, `to`, `field`, sequence_id, primary_sequence_id, inserted_on)

select base.sys_id, base.authorkey, base.issueid, base.created, base.created as revised, base.sourceinstance, base.cdctype, base.id, base.fromstring, base.`from`, base.tostring, base.`to`, base.`field`, base.sequence_id, base.primary_sequence_id, current_timestamp as inserted_on

from #STG_TABLE_SCHEMA.issue_activity_azure_base base
join #STG_TABLE_SCHEMA.workitem_temp_azure SRC
on base.issueid = SRC.__numerify__primary_key and base.sourceinstance = SRC.sourceinstance;


insert into #STG_TABLE_SCHEMA.azure_workitem_update_base
(sys_id, authorkey, issueid, created, sourceinstance, cdctype, id, fromstring, `from`, tostring, `to`, `field`, sequence_id, inserted_on, primary_sequence_id)

select concat(issue.__numerify__primary_key, '~', tbl_task_attribute.task_attribute, '~', 0) as sys_id,
issue.createdByKey as authorkey,
issue.__numerify__primary_key as issueid,
issue.createdDate as created,
issue.sourceinstance as sourceinstance,
issue.cdctype cdctype,
issue.__numerify__primary_key as id,
null as fromstring,
null as `from`,
CASE WHEN tmp.sys_id IS NOT NULL THEN COALESCE(tmp.`from`, tmp.fromstring)    
ELSE CASE WHEN tbl_task_attribute.task_attribute = 'PRIORITY' THEN LOV_PRIO.dimension_code      
WHEN tbl_task_attribute.task_attribute = 'ISSUETYPE' THEN LOV_TYPE.dimension_code 
WHEN tbl_task_attribute.task_attribute = 'PROJECT' THEN issue.projectKey 
WHEN tbl_task_attribute.task_attribute = 'ASSIGNEE' THEN issue.assignedToKey
END
END as tostring,
CASE WHEN tmp.sys_id IS NOT NULL THEN COALESCE(tmp.`from`, tmp.fromstring)    
ELSE CASE WHEN tbl_task_attribute.task_attribute = 'PRIORITY' THEN LOV_PRIO.dimension_code      
WHEN tbl_task_attribute.task_attribute = 'ISSUETYPE' THEN LOV_TYPE.dimension_code 
WHEN tbl_task_attribute.task_attribute = 'PROJECT' THEN issue.projectKey 
WHEN tbl_task_attribute.task_attribute = 'ASSIGNEE' THEN issue.assignedToKey
END
END as `to`,
tbl_task_attribute.task_attribute as `field`,
0 as sequence_id,
current_timestamp as inserted_on, 
0 as primary_sequence_id
FROM #STG_TABLE_SCHEMA.workitem_temp_azure issue
left join
(
SELECT 'PRIORITY' task_attribute                       
UNION
SELECT 'ISSUETYPE'  task_attribute   
UNION
SELECT 'PROJECT'  task_attribute  
UNION 
SELECT 'ASSIGNEE'  task_attribute          
)  tbl_task_attribute                      
 ON 1=1 
left join #STG_TABLE_SCHEMA.azure_workitem_update_base tmp
ON issue.__numerify__primary_key=tmp.issueid 
AND issue.sourceinstance=tmp.sourceinstance 
AND tmp.primary_sequence_id=1 
AND tmp.field=tbl_task_attribute.task_attribute 
left join #DWH_TABLE_SCHEMA.d_lov LOV_PRIO
ON ( CONCAT('PRIORITY','~','WORK_ITEM','~',UPPER(issue.msvsts_common_priority)) = LOV_PRIO.src_rowid 
AND issue.sourceinstance=LOV_PRIO.source_id 
AND LOV_PRIO.dimension_class='PRIORITY~WORK_ITEM')
left join #DWH_TABLE_SCHEMA.d_lov LOV_TYPE
ON ( CONCAT('TYPE','~','WORK_ITEM','~',UPPER(issue.workItemType)) = LOV_TYPE.src_rowid 
AND issue.sourceinstance=LOV_TYPE.source_id 
AND LOV_TYPE.dimension_class='TYPE~WORK_ITEM');

/*use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.azure_workitem_update_base base
join #STG_TABLE_SCHEMA.workitem_temp_azure SRC
on base.issueid = SRC.__numerify__primary_key and base.sourceinstance = SRC.sourceinstance
left join (select base.issueid, base.sourceinstance, base.field, base.sequence_id, max(base_prev.revisedDate) revised_date
from #STG_TABLE_SCHEMA.azure_workitem_update_base base
left join #MDS_TABLE_SCHEMA.azure_workitem_update_final base_prev
on base.issueid = base_prev.workItemKey and base.sourceinstance = base_prev.sourceinstance and base.field = upper(case when base_prev.fieldName = 'state' then 'STATUS' when base_prev.fieldName = 'iterationIdKey' then 'ITERATION' 
when base_prev.fieldName = 'msvsts_scheduling_storypoints' then 'STORY POINTS' when base_prev.fieldName = 'msvsts_scheduling_originalestimate' then 'TIMEORIGINALESTIMATE' 
when base_prev.fieldName = 'msvsts_common_businessvalue' then 'BUSINESS VALUE' when base_prev.fieldName = 'msvsts_common_priority' then 'PRIORITY' 
when base_prev.fieldName = 'assignedToKey' then 'ASSIGNEE' when base_prev.fieldName = 'workItemType' then 'ISSUETYPE'  
when base_prev.fieldName = 'teamProject' then 'PROJECT' end) and base.sequence_id>base_prev.rev
group by base.issueid, base.sourceinstance, base.sequence_id) base_prev
on  base.issueid = base_prev.issueid and base.sourceinstance = base_prev.sourceinstance and base.sequence_id = base_prev.sequence_id
set base.revised = case when base_prev.revised_date is not null then base_prev.revised_date else SRC.createdDate end;*/