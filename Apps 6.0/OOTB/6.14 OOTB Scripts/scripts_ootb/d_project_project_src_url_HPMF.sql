CONCAT('<a href=\"','@#ITPA_HP_SYSTEM_SOURCE_URL@#','project/ViewProject.do?projectId=',pm_projects.PROJECT_ID,'\" target=\"_blank\">',pm_projects.PROJECT_ID,'</a>')
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_project.PROJECT_PHASE_SRC_KEY' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.hp_pm_projects_final where cdctype<>'D') SRC
inner join (select * from  #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final)SRC1
on SRC1.prj_project_id = SRC.project_id
left join  #DWH_TABLE_SCHEMA.d_project TRGT
on SRC.project_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(CONCAT('<a href=\"','http://10.0.1.73:8080/itg/','project/ViewProject.do?projectId=',SRC.PROJECT_ID,'\" target=\"_blank\">',SRC.PROJECT_ID,'</a>'),'')<>coalesce(TRGT.PROJECT_SRC_URL,'');