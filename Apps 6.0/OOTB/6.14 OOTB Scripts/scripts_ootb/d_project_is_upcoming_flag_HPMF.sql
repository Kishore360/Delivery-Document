SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_project.IS_UPCOMING_FLAG' ELSE 'SUCCESS' END as Message
from (select *from  #MDS_TABLE_SCHEMA.hp_pm_projects_final where cdctype<>'D') SRC
left join  #DWH_TABLE_SCHEMA.d_project TRGT
on SRC.project_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(TRGT.IS_UPCOMING_FLAG,'')<>'N'