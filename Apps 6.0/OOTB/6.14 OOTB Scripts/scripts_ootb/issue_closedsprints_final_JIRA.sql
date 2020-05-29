SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for issue_closedsprints_final.issueid' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.issue_closedsprints_final where issueid not in (select id from #MDS_TABLE_SCHEMA.issue_final) and issueid <> 0
