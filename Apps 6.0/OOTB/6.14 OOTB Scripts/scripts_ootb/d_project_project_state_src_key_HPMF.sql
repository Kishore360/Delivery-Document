SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_project.PROJECT_STATE_SRC_KEY' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.hp_pm_projects_final where cdctype<>'D') SRC
left join(SELECT * FROM #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final)SRC1
on SRC.project_id=SRC1.prj_project_id
left join(SELECT * FROM #MDS_TABLE_SCHEMA.hp_kcrt_requests_final)SRC2
on SRC1.request_id=SRC2.request_number
left join (select * from #DWH_TABLE_SCHEMA.d_project) TRGT
on SRC.project_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join #DWH_TABLE_SCHEMA.d_lov LKP
on concat('PROJECT~STATE','~',SRC2.STATUS_ID)=LKP.row_id
and SRC.sourceinstance=LKP.source_id
where coalesce(LKP.row_key,CASE WHEN SRC2.STATUS_ID IS NULL THEN 0 else '-1' end)
<> COALESCE(TRGT.PROJECT_STATE_SRC_KEY ,'');