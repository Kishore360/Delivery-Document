SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_time_spent.row_count' ELSE 'SUCCESS' END as Message
FROM ( select count_src.count_src ,count_trgt.count_trgt from
                    (select count(*) count_src 
                     from  (select worklog.id as worklog_id, 
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
 ) SRC) count_src,
(select count(*) count_trgt  from  #DWH_TABLE_SCHEMA.f_work_item_time_spent  TRGT
 join (select distinct source_id from #DWH_TABLE_SCHEMA.d_o_data_freshness where sourcename = 'Jira_Tenant') ODF on ODF.source_id = TRGT.source_id
 where TRGT.row_key not in (0, -1) )count_trgt
  where count_src.count_src <>count_trgt.count_trgt )SQ