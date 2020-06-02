
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_time_spent.work_item_timespent_logged_by_key'
 ELSE 'SUCCESS' END as Message from

(select worklog.id as worklog_id, 
worklog.issueid as worklogissue_id, 
worklog.created as creation_date ,
worklog.updated as updated_date,
worklog.timespentseconds as timespent_sec,
worklog.updateAuthor_key as author_key,
worklog.sourceinstance as sourceinstance,
worklog.cdctype as cdc_type,
issue.assignee_key as assignee_id,
issue.sprintid as sprint_id,
issue.id as IssueId, 
issue.project_id as Project_Id
from #MDS_TABLE_SCHEMA.issue_worklog_final worklog
join #MDS_TABLE_SCHEMA.issue_final issue
on worklog.issueid = issue.id and worklog.sourceinstance =issue.sourceinstance
where worklog.cdctype <>'D' and issue.cdctype <>'D'
 ) SRC
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.f_work_item_time_spent ) TRGT
ON concat(SRC.worklog_id,'~', SRC.IssueId) = TRGT.row_id and SRC.sourceinstance =TRGT.source_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact dcon
ON concat('INTERNAL_CONTACT~',SRC.author_key) = dcon.row_id and SRC.sourceinstance =dcon.source_id
where COALESCE(dcon.row_key,case when SRC.author_key is null then 0 else -1 end ) <> COALESCE(TRGT.work_item_timespent_logged_by_key,0);
