/*failing for one record but the logic is correct*/
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.is_leaf_flag' ELSE 'SUCCESS' END as Message
from (select * from   #MDS_TABLE_SCHEMA.hp_pm_projects_final where cdctype<>'D') SRC
left join
(select * from   #DWH_TABLE_SCHEMA.d_project)TRGT
on SRC.project_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
LEFT JOIN(select * from #DWH_TABLE_SCHEMA.d_project) TRGT1
ON TRGT1.parent_project_key= TRGT.row_key 
LEFT JOIN(select * from #DWH_TABLE_SCHEMA.d_lov_map)LKP
ON TRGT.project_state_src_key = LKP.src_key 
AND TRGT.source_id=LKP.source_id  
LEFT JOIN(select * from #DWH_TABLE_SCHEMA.f_project_task)ftask
 ON TRGT.row_key=ftask.project_key 
and TRGT.source_id=ftask.source_id
WHERE LKP.dimension_wh_code NOT IN ('CLOSED') 
AND COALESCE(CASE  WHEN TRGT1.parent_project_key IS NOT NULL OR ftask.project_key IS NOT NULL then 'N'  
          WHEN TRGT1.parent_project_key IS NULL then 'Y'  END,'') <> COALESCE(TRGT.is_leaf_flag,'')
    