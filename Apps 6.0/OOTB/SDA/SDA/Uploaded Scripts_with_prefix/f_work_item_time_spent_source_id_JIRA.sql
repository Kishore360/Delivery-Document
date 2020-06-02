
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_time_spent.source_id' ELSE 'SUCCESS' END as Message
FROM 
(select worklog.id as worklog_id, 
worklog.issueid as worklogissue_id, 
worklog.created as creation_date ,
worklog.updated as updated_date,
worklog.timespentseconds as timespent_sec,
worklog.updateAuthor_key as author_key,
worklog.sourceinstance as sourceinstance,
issue.assignee_key as assignee_id,
issue.sprintid as sprint_id,
issue.id as IssueId, 
issue.project_id as Project_Id
from #MDS_TABLE_SCHEMA.issue_worklog_final worklog
join #MDS_TABLE_SCHEMA.issue_final issue
on worklog.issueid = issue.id and worklog.sourceinstance =issue.sourceinstance
where worklog.cdctype <>'D' and issue.cdctype <>'D'
 ) SRC
LEFT JOIN (select * from #DWH_TABLE_SCHEMA.f_work_item_time_spent ) TRGT
ON concat(SRC.worklog_id,'~', SRC.IssueId) = TRGT.row_id and SRC.sourceinstance =TRGT.source_id
where COALESCE(SRC.sourceinstance,'') <> COALESCE(TRGT.source_id,'');