SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_timespent.work_item_key' ELSE 'SUCCESS' END as Message
FROM 
/*
select COALESCE(DWI.row_key,case when SRC.worklogissue_id is null then 0 else -1 end) , COALESCE(TRGT.work_item_key,0) from */

(select worklog.id as worklog_id, 
worklog.issueid as worklogissue_id, 
worklog.created as creation_date ,
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

LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item DWI
ON concat(SRC.IssueId, '') = DWI.row_id and SRC.sourceinstance =DWI.source_id
where COALESCE(DWI.row_key,case when SRC.IssueId is null then 0 else -1 end) <> COALESCE(TRGT.work_item_key,0);



