SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_task.is_closed_ontime_flag' ELSE 'SUCCESS' END as Message
FROM  (select * from   #MDS_TABLE_SCHEMA.prtask_final  where cdctype<>'D') SRC 
left join(select * from   #MDS_TABLE_SCHEMA.inv_investments_final where odf_object_code='project' and cdctype<>'D') SRC1 
on SRC.prprojectid=SRC1.id
INNER join(select * from    #MDS_TABLE_SCHEMA.inv_projects_final WHERE is_program=0 and is_template=0)SRC10
 ON  SRC1.id=SRC10.prid
 and SRC1.sourceinstance=SRC10.sourceinstance
LEFT JOIN (select * from   #DWH_TABLE_SCHEMA.d_project_task)TRGT   
	ON SRC.prid =TRGT.row_id 
	and SRC.sourceinstance=TRGT.source_id
left join (select * from   #DWH_TABLE_SCHEMA.f_project_task)LKP1
on  SRC.prid=LKP1. row_id  
and TRGT.source_id=LKP1.source_id
left join(select * from   #DWH_TABLE_SCHEMA.d_lov_map) LKP
on  TRGT.project_task_state_src_key=LKP.src_key  
and TRGT.source_id=LKP.source_id 
WHERE case when (LKP.dimension_wh_code='CLOSED' AND LKP1.actual_end_on <= LKP1.planned_end_on) THEN 'Y' ELSE 'N' end 
 <> COALESCE(TRGT.is_closed_ontime_flag,'')
    
    