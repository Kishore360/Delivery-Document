SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_project_task.IS_IN_EFFORT_FLAG' ELSE 'SUCCESS' END as Message
from (select * from    #MDS_TABLE_SCHEMA.hp_wp_tasks_final where cdctype<>'D') SRC
left join (select * from  #DWH_TABLE_SCHEMA.d_project_task )TRGT
on SRC.task_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join (select * from  #DWH_TABLE_SCHEMA.f_project_task)LKP
on TRGT.row_id=LKP.row_id
LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov_map LOV
ON LOV.src_key=LKP.project_task_state_src_key
AND LOV.source_id=SRC.sourceinstance and LOV.dimension_class = 'PROJECT_TASK~STATE'
where COALESCE( CASE WHEN LOV.dimension_wh_code IN ('CANCELLED') THEN 'N'
            WHEN LKP.planned_effort = 0 
            AND LKP.actual_effort = 0 THEN 'Y' 
            WHEN LKP.planned_effort = 0 
            AND LKP.actual_effort > 0 THEN 'N' 
            WHEN LKP.planned_percent_complete = 0 
            AND LKP.actual_effort>0 THEN 'Y' 
            WHEN LKP.planned_percent_complete = 0
            AND LKP.actual_effort=0 THEN 'N' 
            WHEN COALESCE(LKP.actual_effort - (LKP.planned_effort * LKP.actual_percent_complete) > 0,'') THEN 'N'
            WHEN LKP.row_id is null THEN 'N'
            ELSE 'Y' END,'') <> COALESCE(TRGT.is_in_effort_flag,'')   
    