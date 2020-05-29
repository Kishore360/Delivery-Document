SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.is_closed_on_time_flag' ELSE 'SUCCESS' END as Message
FROM (select * from  #MDS_TABLE_SCHEMA.inv_investments_final  where odf_object_code='project' and cdctype<>'D') SRC 
 INNER JOIN(select * from  #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC1
on SRC.ID=SRC1.PRID
and SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.d_project)TRGT   
	ON SRC.id =TRGT.row_id 
	and SRC.sourceinstance=TRGT.source_id   
left join (select * from  #DWH_TABLE_SCHEMA.f_project)LKP1
on  TRGT.row_id=LKP1. row_id  
and TRGT.source_id=LKP1.source_id
left join(select * from  #DWH_TABLE_SCHEMA.d_lov_map) LKP
on  TRGT.project_state_src_key=LKP.src_key  
and TRGT.source_id=LKP.source_id 
WHERE case when (LKP.dimension_wh_code='CLOSED' AND LKP1.actual_end_on <= LKP1.planned_end_on) THEN 'Y' ELSE 'N' end 
 <> COALESCE(TRGT.is_closed_on_time_flag,'')
