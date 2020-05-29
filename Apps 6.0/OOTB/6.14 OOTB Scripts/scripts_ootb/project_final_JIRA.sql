SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for project_final.id' ELSE 'SUCCESS' END as Message
FROM (
select distinct projectid  from #MDS_TABLE_SCHEMA.issue_final where projectid not in 
(select id as projectid from #MDS_TABLE_SCHEMA.project_final))sq