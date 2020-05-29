SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.is_leaf_flag' ELSE 'SUCCESS' END as Message
 FROM (select * from  #MDS_TABLE_SCHEMA.inv_investments_final  where odf_object_code='project' and cdctype<>'D') SRC 
 INNER JOIN(select * from  #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC1
on SRC.ID=SRC1.PRID
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.d_project)TRGT   
	ON SRC.id =TRGT.row_id 
	and SRC.sourceinstance=TRGT.source_id  
LEFT JOIN(select * from  #DWH_TABLE_SCHEMA.d_project) TRGT1
ON TRGT1.parent_project_key= TRGT.row_key 
and TRGT.source_id=TRGT1.source_id    
LEFT JOIN(select * from  #DWH_TABLE_SCHEMA.d_lov_map)LKP
ON TRGT.project_state_src_key = LKP.src_key 
AND TRGT.source_id=LKP.source_id  
LEFT JOIN(select * from  #DWH_TABLE_SCHEMA.f_project_task)ftask
 ON TRGT.row_key=ftask.project_key 
and TRGT.source_id=ftask.source_id
WHERE LKP.dimension_wh_code NOT IN ('CLOSED') 
AND COALESCE(CASE  WHEN TRGT1.parent_project_key IS NOT NULL OR ftask.project_key IS NOT NULL then 'N'  
          WHEN TRGT1.parent_project_key IS NULL then 'Y'  END,'') <> COALESCE(TRGT.is_leaf_flag,'')
    