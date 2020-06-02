SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_task.is_in_schedule_flag' ELSE 'SUCCESS' END as Message
FROM  (select * from   #MDS_TABLE_SCHEMA.prtask_final  where cdctype<>'D') SRC 
left join(select * from   #MDS_TABLE_SCHEMA.inv_investments_final where odf_object_code='project' and cdctype<>'D') SRC1 
on SRC.prprojectid=SRC1.id
INNER join(select * from    #MDS_TABLE_SCHEMA.inv_projects_final WHERE is_program=0 and is_template=0)SRC10
 ON  SRC1.id=SRC10.prid
 and SRC1.sourceinstance=SRC10.sourceinstance
LEFT JOIN (select * from   #DWH_TABLE_SCHEMA.d_project_task)TRGT   
	ON SRC.prid =TRGT.row_id 
	and SRC.sourceinstance=TRGT.source_id
left join (select * from   #DWH_TABLE_SCHEMA.f_project_task)LKP
on SRC.prid=LKP.row_id
and TRGT.source_id=LKP.source_id
LEFT JOIN       #DWH_TABLE_SCHEMA.d_lov_map LOV
ON LOV.src_key=TRGT.project_task_state_src_key
AND LOV.source_id=SRC.sourceinstance and LOV.dimension_class = 'PROJECT_TASK~STATE'
where (CASE  WHEN LKP.planned_duration = 0  AND LKP.actual_duration = 0 THEN 'Y' 
            WHEN LKP.planned_duration = 0  AND LKP.actual_duration > 0 THEN 'N' 
            WHEN LOV.dimension_wh_code IN ('CLOSED') AND (LKP.actual_duration - LKP.planned_duration) > 0 THEN 'N' 
            WHEN LOV.dimension_wh_code IN ('CANCELLED') THEN 'N'
            WHEN LOV.dimension_wh_code NOT IN ('CLOSED', 'CANCELLED') AND 
            LKP.week_day_count - (LKP.actual_percent_complete * LKP.planned_duration) > 0 THEN 'N' 
            WHEN LKP.row_id is null THEN 'N'
            ELSE 'Y' END)<> TRGT.IS_IN_SCHEDULE_FLAG    
    