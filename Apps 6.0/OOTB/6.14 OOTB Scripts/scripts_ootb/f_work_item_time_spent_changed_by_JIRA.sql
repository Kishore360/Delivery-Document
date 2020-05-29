
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_timespent.changed_by' ELSE 'SUCCESS' END as Message from
/*
select 
COALESCE(SRC.authorRef,'') ,COALESCE(TRGT.changed_by,'')
 
from */

(select worklog.id as worklog_id, 
worklog.issueid as worklogissue_id, 
worklog.created as creation_date ,
worklog.updated as updated_date,
worklog.timespentseconds as timespent_sec,
worklog.updateAuthorRef as authorRef,
worklog.sourceinstance as sourceinstance,
worklog.cdctype as cdc_type,
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
where COALESCE(SRC.authorRef,'') <> COALESCE(TRGT.changed_by,'');
