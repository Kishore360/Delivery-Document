SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_resource_plan.project_key' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.hp_wp_work_units_final where cdctype<>'D' and resource_id is not null) SRC
left join (select *from  #MDS_TABLE_SCHEMA.hp_wp_tasks_final where cdctype<>'D') SRC1
on SRC.task_id=SRC1.task_id 
and SRC.sourceinstance=SRC1.sourceinstance
left join (select *from  #MDS_TABLE_SCHEMA.hp_pm_work_plans_final where entity_type='WORK_PLAN' and cdctype<>'D') SRC2
on SRC1.work_plan_id=SRC2.work_plan_id
and SRC1.sourceinstance=SRC2.sourceinstance
left join (select *from  #MDS_TABLE_SCHEMA.hp_pm_projects_final where cdctype<>'D') SRC3
on SRC2.project_id=SRC3.project_id
and SRC2.sourceinstance=SRC3.sourceinstance
left join (select * from #DWH_TABLE_SCHEMA.d_resource_plan where soft_deleted_flag<>'Y') TRGT
on CONCAT('RES_TASK~',coalesce(SRC.RESOURCE_ID,'UNSPECIFIED'),'~',SRC.TASK_ID)=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join (select * from #DWH_TABLE_SCHEMA.d_project where soft_deleted_flag<>'Y')LKP
on LKP.row_key=TRGT.project_key
and LKP.source_id=TRGT.source_id
where coalesce(LKP.row_key,case when SRC3.project_id is null then 0 else 1 end)<>coalesce(TRGT.project_key,'');