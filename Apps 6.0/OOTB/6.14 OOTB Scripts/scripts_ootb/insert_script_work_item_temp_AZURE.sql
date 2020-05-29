drop table if exists #STG_TABLE_SCHEMA.workitem_temp_azure;

create table #STG_TABLE_SCHEMA.workitem_temp_azure (
  workItemType VARCHAR(40) DEFAULT NULL,
  cdctype VARCHAR(1) DEFAULT NULL,
  changedDate DATETIME DEFAULT NULL,
  projectKey VARCHAR(255) DEFAULT NULL,
  areaKey VARCHAR(40) DEFAULT NULL,
  id INT(11) DEFAULT NULL,
  state VARCHAR(40) DEFAULT NULL,
  rev INT(11) DEFAULT NULL,
  revisedDate DATETIME DEFAULT NULL,
  sourceinstance BIGINT(20) NOT NULL DEFAULT 0,
  description TEXT DEFAULT NULL,
  title TEXT DEFAULT NULL,
  createdByKey VARCHAR(40) DEFAULT NULL,
  assignedToKey VARCHAR(40) DEFAULT NULL,
  iterationKey VARCHAR(255) DEFAULT NULL,
  url TEXT DEFAULT NULL,
  changedByKey VARCHAR(40) DEFAULT NULL,
  createdDate DATETIME DEFAULT NULL,
  boardColumnDone TINYINT(1) DEFAULT NULL,
  __numerify__primary_key VARCHAR(255) NOT NULL DEFAULT '',
  organizationKey VARCHAR(255) DEFAULT NULL,
  reason VARCHAR(255) DEFAULT NULL,
  msvsts_common_risk TEXT DEFAULT NULL,
  msvsts_scheduling_originalestimate TEXT DEFAULT NULL,
  msvsts_scheduling_storypoints TEXT DEFAULT NULL,
  msvsts_common_resolvedreason TEXT DEFAULT NULL,
  msvsts_scheduling_remainingwork TEXT DEFAULT NULL,
  msvsts_cmmi_targetresolvedate DATETIME DEFAULT NULL,
  msvsts_scheduling_targetdate DATETIME DEFAULT NULL,
  msvsts_common_closedbykey TEXT DEFAULT NULL,
  msvsts_common_closeddate DATETIME DEFAULT NULL,
  msvsts_common_priority TEXT DEFAULT NULL,
  msvsts_scheduling_completedwork TEXT DEFAULT NULL,
  msvsts_common_resolvedbykey TEXT DEFAULT NULL,
  msvsts_scheduling_startdate DATETIME DEFAULT NULL,
  msvsts_common_severity TEXT DEFAULT NULL,
  msvsts_common_businessvalue TEXT DEFAULT NULL,
  msvsts_tcm_reprosteps TEXT DEFAULT NULL,
  msvsts_common_resolveddate DATETIME DEFAULT NULL,
  msvsts_common_triage TEXT DEFAULT NULL,
  msvsts_tcm_automationstatus TEXT DEFAULT NULL,
  msvsts_build_integrationbuild TEXT DEFAULT NULL,
  msvsts_build_foundin TEXT DEFAULT NULL,
  msvsts_cmmi_rootcause TEXT DEFAULT NULL,
  PRIMARY KEY (__numerify__primary_key, sourceinstance)
  );

insert into #STG_TABLE_SCHEMA.workitem_temp_azure
(workItemType, cdctype, changedDate, projectKey, areaKey, id, state, rev,  revisedDate, sourceinstance, description, title, createdByKey, assignedToKey, iterationKey, url, changedByKey, createdDate, boardColumnDone, __numerify__primary_key, organizationKey, reason, msvsts_common_risk, msvsts_scheduling_originalestimate, msvsts_scheduling_storypoints, msvsts_common_resolvedreason, msvsts_scheduling_remainingwork, msvsts_cmmi_targetresolvedate, msvsts_scheduling_targetdate, msvsts_common_closedbykey, msvsts_common_closeddate, msvsts_common_priority, msvsts_scheduling_completedwork, msvsts_common_resolvedbykey, msvsts_scheduling_startdate, msvsts_common_severity, msvsts_common_businessvalue, msvsts_tcm_reprosteps, msvsts_common_resolveddate, msvsts_common_triage, msvsts_tcm_automationstatus, msvsts_build_integrationbuild, msvsts_build_foundin, msvsts_cmmi_rootcause)

select SRC.workItemType, SRC.cdctype, SRC.changedDate, SRC.projectKey, SRC.areaKey, SRC.id, SRC.state, SRC.rev, SRC.revisedDate, SRC.sourceinstance, SRC.description, SRC.title, SRC.createdByKey, 
SRC.assignedToKey, SRC.iterationKey, SRC.url, SRC.changedByKey, SRC.createdDate, SRC.boardColumnDone, SRC.__numerify__primary_key, SRC.organizationKey, SRC.reason, 
DETAIL.msvsts_common_risk, (DETAIL.msvsts_scheduling_originalestimate * 3600) as msvsts_scheduling_originalestimate, DETAIL.msvsts_scheduling_storypoints, DETAIL.msvsts_common_resolvedreason, 
(DETAIL.msvsts_scheduling_remainingwork * 3600) as msvsts_scheduling_remainingwork, 
concat (trim(SUBSTRING_INDEX(DETAIL.msvsts_cmmi_targetresolvedate, 'T', 1)), ' ', trim(time_format(SUBSTRING_INDEX(SUBSTRING_INDEX(DETAIL.msvsts_cmmi_targetresolvedate, 'T', -1), 'Z', 1), '%H:%i:%s'))) as msvsts_cmmi_targetresolvedate, 
concat (trim(SUBSTRING_INDEX(DETAIL.msvsts_scheduling_targetdate, 'T', 1)), ' ', trim(time_format(SUBSTRING_INDEX(SUBSTRING_INDEX(DETAIL.msvsts_scheduling_targetdate, 'T', -1), 'Z', 1), '%H:%i:%s'))) as msvsts_scheduling_targetdate, 
DETAIL.msvsts_common_closedbykey, 
concat (trim(SUBSTRING_INDEX(DETAIL.msvsts_common_closeddate, 'T', 1)), ' ', trim(time_format(SUBSTRING_INDEX(SUBSTRING_INDEX(DETAIL.msvsts_common_closeddate, 'T', -1), 'Z', 1), '%H:%i:%s'))) as msvsts_common_closeddate, 
DETAIL.msvsts_common_priority, (DETAIL.msvsts_scheduling_completedwork * 3600) as msvsts_scheduling_completedwork, DETAIL.msvsts_common_resolvedbykey, 
concat (trim(SUBSTRING_INDEX(DETAIL.msvsts_scheduling_startdate, 'T', 1)), ' ', trim(time_format(SUBSTRING_INDEX(SUBSTRING_INDEX(DETAIL.msvsts_scheduling_startdate, 'T', -1), 'Z', 1), '%H:%i:%s'))) as msvsts_scheduling_startdate, 
DETAIL.msvsts_common_severity, DETAIL.msvsts_common_businessvalue, DETAIL.msvsts_tcm_reprosteps, 
concat (trim(SUBSTRING_INDEX(DETAIL.msvsts_common_resolveddate, 'T', 1)), ' ', trim(time_format(SUBSTRING_INDEX(SUBSTRING_INDEX(DETAIL.msvsts_common_resolveddate, 'T', -1), 'Z', 1), '%H:%i:%s'))) as msvsts_common_resolveddate, 
DETAIL.msvsts_common_triage, DETAIL.msvsts_tcm_automationstatus, DETAIL.msvsts_build_integrationbuild, DETAIL.msvsts_build_foundin, DETAIL.msvsts_cmmi_rootcause

FROM #MDS_TABLE_SCHEMA.azure_workitem_final SRC
join #MDS_TABLE_SCHEMA.azure_workitem_ext_final DETAIL
on SRC.__numerify__primary_key = DETAIL.record_id and SRC.sourceinstance = DETAIL.sourceinstance;