SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_project.PROJECT_CATEGORY_SRC_KEY' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.hp_pm_projects_final where cdctype<>'D') SRC
inner join (select * from  #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final)SRC1
on SRC1.prj_project_id = SRC.project_id
left join  #DWH_TABLE_SCHEMA.d_project TRGT
on SRC.project_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join #DWH_TABLE_SCHEMA.d_lov LKP
on concat('PROJECT~GOAL','~',PRJ_PROJECT_CLASS_CODE)=LKP.row_id
and SRC.sourceinstance=LKP.source_id
where coalesce(LKP.row_key,CASE WHEN SRC1.PRJ_PROJECT_CLASS_CODE IS NULL THEN 0 else '-1' end)
<> COALESCE(TRGT.PROJECT_CATEGORY_SRC_KEY ,'');