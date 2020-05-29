SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.is_active_flag' ELSE 'SUCCESS' END as Message
 FROM (select * from  #MDS_TABLE_SCHEMA.inv_investments_final  where odf_object_code='project' and cdctype<>'D') SRC 
 INNER JOIN(select * from  #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC1
on SRC.ID=SRC1.PRID
LEFT JOIN (select * from #DWH_TABLE_SCHEMA.d_project)TRGT   
	ON SRC.id =TRGT.row_id 
	and SRC.sourceinstance=TRGT.source_id
LEFT JOIN (select * from #DWH_TABLE_SCHEMA.d_lov_map)LKP
ON TRGT.project_state_src_key=LKP.src_key     
where CASE WHEN dimension_wh_code IN ('IN PROGRESS') THEN 'Y' ELSE 'N' END <> TRGT.is_active_flag 








