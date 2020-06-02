SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for user_final.authorkey' ELSE 'SUCCESS' END as Message
FROM (select distinct authorkey  from #MDS_TABLE_SCHEMA.issue_changelog_final 
where authorkey not in (select distinct `key` as authorkey from #MDS_TABLE_SCHEMA.user_final ))SQ
