 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_work_item_activity' ELSE 'SUCCESS' END as Message
 from (
 select *
 from
 (select count(*) count_src from #STG_TABLE_SCHEMA.issue_activity_temp SRC where SRC.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')) count_src,
 
 (select count(*) count_trgt from #DWH_TABLE_SCHEMA.f_work_item_activity TRGT
  join (select distinct source_id from #DWH_TABLE_SCHEMA.d_o_data_freshness where sourcename = 'Jira_Tenant') ODF on ODF.source_id = TRGT.source_id
 where TRGT.row_key not in (0, -1) and TRGT.task_attribute_wh_name not in ('ASSIGNEE','PRIORITY')) count_trgt
 
 where count_src.count_src <>count_trgt.count_trgt
 )SQ