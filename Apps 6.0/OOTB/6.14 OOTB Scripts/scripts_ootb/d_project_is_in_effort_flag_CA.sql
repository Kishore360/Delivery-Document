SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.is_in_effort_flag' ELSE 'SUCCESS' END as Message
 FROM (select * from  #MDS_TABLE_SCHEMA.inv_investments_final  where odf_object_code='project' and cdctype<>'D') SRC 
 INNER JOIN(select * from  #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC1
on SRC.ID=SRC1.PRID
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.d_project)TRGT   
	ON SRC.id =TRGT.row_id 
	and SRC.sourceinstance=TRGT.source_id    
left join (select * from   #DWH_TABLE_SCHEMA.f_project)LKP
on SRC.id=LKP.row_id
and SRC.sourceinstance=LKP.source_id
LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov_map LOV
ON LOV.src_key=LKP.project_state_src_key
AND LOV.source_id=SRC.sourceinstance and LOV.dimension_class = 'PROJECT~STATE'
where ( CASE WHEN LOV.dimension_wh_code IN ('CANCELLED') THEN 'N'
            WHEN LKP.planned_effort = 0 
            AND LKP.actual_effort = 0 THEN 'Y' 
            WHEN LKP.planned_effort = 0 
            AND LKP.actual_effort > 0 THEN 'N' 
            WHEN LKP.planned_percent_complete = 0 
            AND LKP.actual_effort>0 THEN 'Y' 
            WHEN LKP.planned_percent_complete = 0 
            AND LKP.actual_effort=0 THEN 'N' 
            WHEN (LKP.actual_effort - (LKP.planned_effort * LKP.actual_percent_complete)) > 0 THEN 'N' 
            ELSE 'Y' END) <> TRGT.is_in_effort_flag