SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_project.row_id' ELSE 'SUCCESS' END as Message
from (select * from #MDS_TABLE_SCHEMA.hp_pm_projects_final where cdctype<>'D') SRC
left join (select * from   #DWH_TABLE_SCHEMA.d_project)TRGT
on SRC.project_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.d_lov_map)LKP
ON TRGT.project_state_src_key=LKP.src_key     
where CASE WHEN dimension_wh_code IN ('IN PROGRESS') THEN 'Y' ELSE 'N' END <> COALESCE(TRGT.is_active_flag,'') 
