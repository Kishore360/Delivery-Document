SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_project.PROJECT_TYPE_SRC_KEY' ELSE 'SUCCESS' END as Message
from (select *from  #MDS_TABLE_SCHEMA.hp_pm_projects_final where cdctype<>'D') SRC1
left join (select * from #MDS_TABLE_SCHEMA.hp_pm_project_types_final)SRC2
on SRC1.PROJECT_TYPE_ID=SRC2.PROJECT_TYPE_ID
and SRC1.sourceinstance=SRC2.sourceinstance
inner join #DWH_TABLE_SCHEMA.d_project TRGT
on SRC1.project_id=TRGT.row_id
and SRC1.sourceinstance=TRGT.source_id
inner join #DWH_TABLE_SCHEMA.d_lov LKP
on concat('PROJECT~PROJECT_TYPE~',SRC2.PROJECT_TYPE_ID)=LKP.row_id
and SRC1.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC2.PROJECT_TYPE_ID IS NULL THEN 0 else '-1' end)
<> COALESCE(TRGT.PROJECT_TYPE_SRC_KEY ,'');