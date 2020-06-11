drop table if exists #STG_TABLE_SCHEMA.issue_activity_azure_base;

create table if not exists #STG_TABLE_SCHEMA.issue_activity_azure_base (
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  authorkey text COLLATE utf8_unicode_ci,
  issueid varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  created datetime DEFAULT NULL,
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

insert into #STG_TABLE_SCHEMA.issue_activity_azure_base
(sys_id, authorkey, issueid, created, sourceinstance, cdctype, id, fromstring, `from`, tostring, `to`, `field`, sequence_id, inserted_on)

select concat(rev.workItemKey, '~', upper(case when rev.fieldName = 'state' then 'STATUS' when rev.fieldName = 'iterationIdKey' then 'ITERATION' 
when rev.fieldName = 'msvsts_scheduling_storypoints' then 'STORY POINTS' when rev.fieldName = 'msvsts_scheduling_originalestimate' then 'TIMEORIGINALESTIMATE' 
when rev.fieldName = 'msvsts_common_businessvalue' then 'BUSINESS VALUE' when rev.fieldName = 'msvsts_common_priority' then 'PRIORITY' 
when rev.fieldName = 'assignedToKey' then 'ASSIGNEE' when rev.fieldName = 'workItemType' then 'ISSUETYPE'  
when rev.fieldName = 'teamProject' then 'PROJECT' when rev.fieldName = 'msvsts_common_severity' then 'SEVERITY' 
when rev.fieldName = 'msvsts_common_resolvedreason' then 'RESOLUTION' 
when rev.fieldName in ('msvsts_scheduling_targetdate', 'msvsts_cmmi_targetresolvedate') then 'DUEDATE' 
when rev.fieldName = 'msvsts_tcm_testsuiteaudit' then 'TEST_SUITE' 
when rev.fieldName = 'title' then 'TITLE' end), '~', rev.rev) as sys_id, 
rev.revisedByKey as authorkey, 
rev.workItemKey as issueid, 
rev_prev.revisedDate as created, 
rev.sourceinstance as sourceinstance, 
rev.cdctype as cdctype, 
rev.__numerify__primary_key as id, 
case when rev.fieldName = 'iterationIdKey' then concat(rev.oldValue,'~',rev.organizationKey) 
when rev.fieldName = 'msvsts_scheduling_originalestimate' then (rev.oldValue * 3600) 
when rev.fieldName in ('msvsts_scheduling_targetdate', 'msvsts_cmmi_targetresolvedate') then concat (trim(SUBSTRING_INDEX(rev.oldValue, 'T', 1)), ' ', trim(time_format(SUBSTRING_INDEX(SUBSTRING_INDEX(rev.oldValue, 'T', -1), 'Z', 1), '%H:%i:%s')))
else rev.oldValue end as fromstring, 
case when rev.fieldName = 'iterationIdKey' then concat(rev.oldValue,'~',rev.organizationKey) 
when rev.fieldName = 'msvsts_scheduling_originalestimate' then (coalesce(rev.oldValueKey, rev.oldValue) * 3600) 
when rev.fieldName in ('msvsts_scheduling_targetdate', 'msvsts_cmmi_targetresolvedate') then concat (trim(SUBSTRING_INDEX(coalesce(rev.oldValueKey, rev.oldValue), 'T', 1)), ' ', trim(time_format(SUBSTRING_INDEX(SUBSTRING_INDEX(coalesce(rev.oldValueKey, rev.oldValue), 'T', -1), 'Z', 1), '%H:%i:%s')))
else coalesce(rev.oldValueKey, rev.oldValue) end as `from`,
case when rev.fieldName = 'iterationIdKey' then concat(rev.newValue,'~',rev.organizationKey) 
when rev.fieldName = 'msvsts_scheduling_originalestimate' then (rev.newValue * 3600) 
when rev.fieldName in ('msvsts_scheduling_targetdate', 'msvsts_cmmi_targetresolvedate') then concat (trim(SUBSTRING_INDEX(rev.newValue, 'T', 1)), ' ', trim(time_format(SUBSTRING_INDEX(SUBSTRING_INDEX(rev.newValue, 'T', -1), 'Z', 1), '%H:%i:%s')))
else rev.newValue end as tostring, 
case when rev.fieldName = 'iterationIdKey' then concat(rev.newValue,'~',rev.organizationKey) 
when rev.fieldName = 'msvsts_scheduling_originalestimate' then (coalesce(rev.newValueKey, rev.newValue) * 3600) 
when rev.fieldName in ('msvsts_scheduling_targetdate', 'msvsts_cmmi_targetresolvedate') then concat (trim(SUBSTRING_INDEX(coalesce(rev.newValueKey, rev.newValue), 'T', 1)), ' ', trim(time_format(SUBSTRING_INDEX(SUBSTRING_INDEX(coalesce(rev.newValueKey, rev.newValue), 'T', -1), 'Z', 1), '%H:%i:%s')))
else coalesce(rev.newValueKey, rev.newValue) end as `to`, 
upper(case when rev.fieldName = 'state' then 'STATUS' when rev.fieldName = 'iterationIdKey' then 'ITERATION' 
when rev.fieldName = 'msvsts_scheduling_storypoints' then 'STORY POINTS' when rev.fieldName = 'msvsts_scheduling_originalestimate' then 'TIMEORIGINALESTIMATE' 
when rev.fieldName = 'msvsts_common_businessvalue' then 'BUSINESS VALUE' when rev.fieldName = 'msvsts_common_priority' then 'PRIORITY' 
when rev.fieldName = 'assignedToKey' then 'ASSIGNEE' when rev.fieldName = 'workItemType' then 'ISSUETYPE'  
when rev.fieldName = 'teamProject' then 'PROJECT' when rev.fieldName = 'msvsts_common_severity' then 'SEVERITY' 
when rev.fieldName = 'msvsts_common_resolvedreason' then 'RESOLUTION' 
when rev.fieldName in ('msvsts_scheduling_targetdate', 'msvsts_cmmi_targetresolvedate') then 'DUEDATE' 
when rev.fieldName = 'msvsts_tcm_testsuiteaudit' then 'TEST_SUITE' 
when rev.fieldName = 'title' then 'TITLE' end) as `field`, 
rev.rev as sequence_id, 
current_timestamp as inserted_on
from #MDS_TABLE_SCHEMA.azure_workitem_update_final rev
left join #STG_TABLE_SCHEMA.workitem_temp_azure wi
on wi.__numerify__primary_key = rev.workItemKey and wi.sourceinstance=rev.sourceinstance
left join 
(select workItemKey, sourceinstance, rev, min(revisedDate) as revisedDate
from #MDS_TABLE_SCHEMA.azure_workitem_update_final
group by workItemKey, sourceinstance, rev) rev_prev
on rev_prev.workItemKey = rev.workItemKey and rev_prev.sourceinstance=rev.sourceinstance and rev.rev = rev_prev.rev + 1
where rev.cdctype <> 'D' and rev.rev <> 1 and
rev.fieldName in ('state', 'assignedToKey', 'iterationIdKey', 'msvsts_common_businessvalue', 'msvsts_common_priority',
'msvsts_scheduling_originalestimate', 'msvsts_scheduling_storypoints', 'teamProject', 'msvsts_common_severity', 'workItemType', 'msvsts_common_resolvedreason','msvsts_scheduling_targetdate', 'msvsts_cmmi_targetresolvedate', 'msvsts_tcm_testsuiteaudit', 'title') and coalesce(rev.newValueKey, rev.newValue, '') <> coalesce(rev.oldValueKey, rev.oldValue, '');