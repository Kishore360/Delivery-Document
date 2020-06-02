SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_iteration.row_id' ELSE 'SUCCESS' END as Message
 from 
 (
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
 
 left join #DWH_TABLE_SCHEMA.f_work_item_iteration TRGT
 on concat(SRC.issue,'~',SRC.sprint)=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
 where coalesce(concat(SRC.issue,'~',SRC.sprint),'')<>coalesce(TRGT.row_id,'')