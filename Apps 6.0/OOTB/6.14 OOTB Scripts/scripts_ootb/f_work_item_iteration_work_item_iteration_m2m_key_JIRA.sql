SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_iteration.work_item_iteration_m2m_key' ELSE 'SUCCESS' END as Message
 from 
(
 select SRCA.issueId issue, SRCA.sprintid sprint, SRCA.sourceinstance sourceinstance, SRCA.cdctype cdctype
 from #MDS_TABLE_SCHEMA.issues_sprint_final SRCA
 where SRCA.sprintid is not null and SRCA.sprintid >0
 ) SRC
 
 left join #DWH_TABLE_SCHEMA.f_work_item_iteration TRGT
 on concat(SRC.issue,'~',SRC.sprint)=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
 left join #DWH_TABLE_SCHEMA.d_iteration LKP
 on SRC.sprint=LKP.row_id
 and SRC.sourceinstance=LKP.source_id
 
 where coalesce(LKP.row_key,case when SRC.sprint is null then 0 else -1 end)<>coalesce(TRGT.work_item_iteration_m2m_key,'')