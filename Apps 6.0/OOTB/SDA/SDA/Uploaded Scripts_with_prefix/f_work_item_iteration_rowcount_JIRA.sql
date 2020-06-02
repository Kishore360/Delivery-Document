 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_work_item_iteration' ELSE 'SUCCESS' END as Message
 from (
 select *
 from
 (select count(*) count_src 
 from  (
 select SRCA.id issue, SRCA.sprintid sprint, SRCA.sourceinstance sourceinstance, SRCA.cdctype cdctype
 from #MDS_TABLE_SCHEMA.issues_sprint_final SRCA
 where SRCA.sprintid is not null and SRCA.sprintid >0
 union 
 select SRCB.issueid issue, SRCB.id sprint, SRCB.sourceinstance sourceinstance, SRCB.cdctype cdctype
 from #MDS_TABLE_SCHEMA.issue_closedsprints_final SRCB
 join #MDS_TABLE_SCHEMA.issue_final a 
 on a.id = SRCB.issueid and a.sourceinstance = SRCB.sourceinstance
 where SRCB.id is not null and SRCB.id > 0
 ) SRC
 ) count_src,
 
 
 (select count(*) count_trgt from #DWH_TABLE_SCHEMA.f_work_item_iteration TRGT 
 join (select distinct source_id from #DWH_TABLE_SCHEMA.d_o_data_freshness where sourcename = 'Jira_Tenant') ODF on ODF.source_id = TRGT.source_id
 where TRGT.row_key not in (0, -1)) count_trgt
  where count_src.count_src <>count_trgt.count_trgt
 )SQ