
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_time_spent.time_spent_updated_by' ELSE 'SUCCESS' END as Message 
/*select COALESCE(SRC.author_key, 0) ,COALESCE(TRGT.time_spent_updated_by,0) */
from
(select worklog.id as worklog_id, 
worklog.issueid as worklogissue_id, 
worklog.created as creation_date ,
worklog.updated as updated_date,
worklog.timespentseconds as timespent_sec,
worklog.timespent as Time_spent,
worklog.updateAuthor_key as author_key,
worklog.sourceinstance as sourceinstance,
worklog.cdctype as cdc_type,
issue.reporterid as reporter_id,
issue.assignee_key as assignee_id,
issue.sprintid as sprint_id,
issue.id as IssueId, 
issue.project_id as Project_Id
from #MDS_TABLE_SCHEMA.issue_worklog_final worklog
join #MDS_TABLE_SCHEMA.issue_final issue
on worklog.issueid = issue.id and worklog.sourceinstance =issue.sourceinstance
where worklog.cdctype <>'D' and issue.cdctype <>'D'
 ) SRC
LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_time_spent TRGT
ON concat(SRC.worklog_id,'~', SRC.IssueId) = TRGT.row_id and SRC.sourceinstance =TRGT.source_id
where COALESCE(SRC.author_key,0) <> COALESCE(TRGT.time_spent_updated_by,0)
