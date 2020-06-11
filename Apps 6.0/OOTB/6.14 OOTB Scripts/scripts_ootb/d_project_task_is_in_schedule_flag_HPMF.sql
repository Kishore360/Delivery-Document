SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_task.is_in_schedule_flag' ELSE 'SUCCESS' END as Message
from (select * from    #MDS_TABLE_SCHEMA.hp_wp_tasks_final where cdctype<>'D') SRC
left join (select * from  #DWH_TABLE_SCHEMA.d_project_task )TRGT
on SRC.task_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join (select * from  #DWH_TABLE_SCHEMA.f_project_task)LKP
on TRGT.row_id=LKP.row_id
LEFT JOIN      #DWH_TABLE_SCHEMA.d_lov_map LOV
ON LOV.src_key=LKP.project_task_state_src_key
AND LOV.source_id=SRC.sourceinstance and LOV.dimension_class = 'PROJECT_TASK~STATE'
where (CASE  WHEN LKP.planned_duration = 0  AND LKP.actual_duration = 0 THEN 'Y' 
            WHEN LKP.planned_duration = 0  AND LKP.actual_duration > 0 THEN 'N' 
            WHEN LOV.dimension_wh_code IN ('CLOSED') AND (LKP.actual_duration - LKP.planned_duration) > 0 THEN 'N' 
            WHEN LOV.dimension_wh_code IN ('CANCELLED') THEN 'N'
            WHEN LOV.dimension_wh_code NOT IN ('CLOSED', 'CANCELLED') AND 
            LKP.week_day_count - (LKP.actual_percent_complete * LKP.planned_duration) > 0 THEN 'N' 
            ELSE 'Y' END)<> TRGT.IS_IN_SCHEDULE_FLAG