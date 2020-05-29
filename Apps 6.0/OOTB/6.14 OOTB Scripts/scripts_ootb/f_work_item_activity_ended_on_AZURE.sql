SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.ended_on' ELSE 'SUCCESS' END as Message
 from (select * from #STG_TABLE_SCHEMA.issue_activity_azure_base base where base.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')) tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.sourceinstance=TRGT.source_id)
 
 left join 
 (
 select tmp.issueid, tmp.sourceinstance, tmp.field, max(tmp.primary_sequence_id) max_primary_sequence_id
 from (select * from #STG_TABLE_SCHEMA.issue_activity_azure_base base where base.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')) tmp
 group by tmp.issueid, tmp.sourceinstance, tmp.field
 ) max_primary_seq
 on max_primary_seq.issueid = tmp.issueid and max_primary_seq.sourceinstance = tmp.sourceinstance
 and max_primary_seq.field = tmp.field
 
WHERE tmp.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE', 'PRIORITY', 'ASSIGNEE', 'ISSUETYPE') and coalesce(case when tmp.primary_sequence_id = max_primary_seq.max_primary_sequence_id then null 
else convert_tz(ADDDATE(tmp.created, INTERVAL TRGT.primary_duration SECOND),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') end,'') <> coalesce(TRGT.ended_on,'');