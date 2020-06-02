SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for issues_sprint_final.id' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.issues_sprint_final where id not in (select id from #MDS_TABLE_SCHEMA.issue_final) and id <> 0
