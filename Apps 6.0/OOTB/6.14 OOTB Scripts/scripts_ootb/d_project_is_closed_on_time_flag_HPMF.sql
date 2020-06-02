SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_project.IS_CLOSED_ON_TIME_FLAG' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.hp_pm_projects_final where cdctype<>'D') SRC
left join   #DWH_TABLE_SCHEMA.d_project TRGT
on SRC.project_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join (select * from  #DWH_TABLE_SCHEMA.f_project)LKP1
on  TRGT.project_id=LKP1. row_id  
left join(select * from  #DWH_TABLE_SCHEMA.d_lov_map) LKP
on  TRGT.project_state_src_key=LKP.src_key   
WHERE case when (LKP.dimension_wh_code='CLOSED' AND LKP1.actual_end_on <= LKP1.planned_end_on) THEN 'Y' ELSE 'N' end 
 <> COALESCE(TRGT.is_closed_on_time_flag,'')


