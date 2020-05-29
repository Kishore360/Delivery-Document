SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_resource_plan.PLANNED_END_ON' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.hp_wp_work_units_final where cdctype<>'D' and resource_id is not null) SRC
left join (select *from  #MDS_TABLE_SCHEMA.hp_wp_tasks_final where cdctype<>'D') SRC1
on SRC.task_id=SRC1.task_id
and SRC.sourceinstance=SRC1.sourceinstance
left join (select *from  #MDS_TABLE_SCHEMA.hp_wp_task_schedule_final where cdctype<>'D') SRC2 
on SRC1.task_schedule_id=SRC2.task_schedule_id
and SRC1.sourceinstance=SRC2.sourceinstance
left join  #DWH_TABLE_SCHEMA.d_resource_plan TRGT
on CONCAT('RES_TASK~',coalesce(SRC.RESOURCE_ID,'UNSPECIFIED'),'~',SRC.TASK_ID)=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
WHERE coalesce(CONVERT_TZ(SRC2.SCHED_FINISH_DATE,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')
<>coalesce(TRGT.PLANNED_END_ON,'')