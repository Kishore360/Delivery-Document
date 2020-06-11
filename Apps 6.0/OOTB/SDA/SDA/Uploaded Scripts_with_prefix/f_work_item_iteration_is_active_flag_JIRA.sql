SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_iteration.is_active_flag' ELSE 'SUCCESS' END as Message
 from 
(
 select SRC.issue, SRC.sprint, SRC.sourceinstance, SRC.cdctype
 from (
 select SRCA.id issue, SRCA.sprintid sprint, SRCA.sourceinstance sourceinstance, SRCA.cdctype cdctype
 from #MDS_TABLE_SCHEMA.issues_sprint_final SRCA
 where SRCA.sprintid is not null and SRCA.sprintid >0
 union 
 select SRCB.issueid issue, SRCB.id sprint, SRCB.sourceinstance sourceinstance, SRCB.cdctype cdctype
 from #MDS_TABLE_SCHEMA.issue_closedsprints_final SRCB
 where SRCB.id is not null and SRCB.id > 0
 ) SRC
 join #MDS_TABLE_SCHEMA.issue_final a 
 on a.id = SRC.issue and a.sourceinstance = SRC.sourceinstance
 ) SRC
 
 left join #DWH_TABLE_SCHEMA.f_work_item_iteration TRGT
 on concat(SRC.issue,'~',SRC.sprint)=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
where coalesce(case when SRC.cdctype = 'D' then 'N' else 'Y' end, 'Y')<>coalesce(TRGT.is_active_flag,'');