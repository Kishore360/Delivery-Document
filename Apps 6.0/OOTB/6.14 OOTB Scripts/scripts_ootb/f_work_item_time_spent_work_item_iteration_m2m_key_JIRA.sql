SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_time_spent.work_item_iteration_m2m_key' ELSE 'SUCCESS' END as Message
/*select SRC.IssueId,SRC.creation_date,fact.task_attribute_wh_name, fact.started_on, fact.ended_on, fact.task_attribute_wh_new_value, fact.task_attribute_wh_new_value_key,
COALESCE(case when SRC.creation_date between fact.started_on and coalesce(fact.ended_on, '9999-12-31 00:00:00') then fact.task_attribute_wh_new_value_key else 0 end, 0)  sr, COALESCE(TRGT.work_item_iteration_m2m_key,0) tg*/
FROM 
(select worklog.id as worklog_id, 
worklog.issueid as worklogissue_id, 
worklog.created as creation_date ,
worklog.updated as updated_date,
worklog.timespentseconds as timespent_sec,
worklog.updateAuthorRef as authorRef,
worklog.sourceinstance as sourceinstance,
issue.assigneeRef as assignee_id,
null as sprint_id,
issue.id as IssueId, 
issue.project_id as Project_Id
from #MDS_TABLE_SCHEMA.issue_worklog_final worklog
join #MDS_TABLE_SCHEMA.issue_final issue
on worklog.issueid = issue.id and worklog.sourceinstance =issue.sourceinstance
where worklog.cdctype <>'D' and issue.cdctype <>'D'
 ) SRC
LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_time_spent TRGT
ON concat(SRC.worklog_id,'~', SRC.IssueId) = TRGT.row_id and SRC.sourceinstance =TRGT.source_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item DIM
ON concat(SRC.IssueId, '') = DIM.row_id and SRC.sourceinstance =TRGT.source_id
left join (
select source_id, max(lastupdated) as last_updated
from #DWH_TABLE_SCHEMA.d_o_data_freshness
where sourcename = 'Jira_Tenant' group by source_id) ODF
on ODF.source_id = TRGT.source_id

LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity fact
on fact.work_item_key = DIM.row_key and fact.task_attribute_wh_name = 'ITERATION' 
and convert_tz(SRC.creation_date, '<<TENANT_SSI_TIME_ZONE>>', '<<DW_TARGET_TIME_ZONE>>') >= fact.started_on
and convert_tz(SRC.creation_date, '<<TENANT_SSI_TIME_ZONE>>', '<<DW_TARGET_TIME_ZONE>>') < coalesce(fact.ended_on, ODF.last_updated)

where COALESCE(fact.task_attribute_wh_new_value_key, 0)<> COALESCE(TRGT.work_item_iteration_m2m_key,0);