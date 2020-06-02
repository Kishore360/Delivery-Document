SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_project.ACTUAL_START_ON' ELSE 'SUCCESS' END as Message
from (select *from  #MDS_TABLE_SCHEMA.hp_pm_projects_final where cdctype<>'D') SRC1
left join (select * from #MDS_TABLE_SCHEMA.hp_pm_work_plans_final where entity_type='WORK_PLAN') SRC2
on SRC1.PROJECT_ID=SRC2.PROJECT_ID 
AND SRC1.sourceinstance=SRC2.sourceinstance
left join (select * from #MDS_TABLE_SCHEMA.hp_wp_tasks_final)SRC3
on SRC2.ROOT_TASK_ID=SRC3.TASK_ID 
AND SRC2.sourceinstance=SRC3.sourceinstance
left join (select * from #MDS_TABLE_SCHEMA.hp_wp_task_actuals_final)SRC4
on SRC3.TASK_ACTUALS_ID=SRC4.ACTUALS_ID 
AND SRC4.sourceinstance=SRC3.sourceinstance
left join #DWH_TABLE_SCHEMA.d_project TRGT
on SRC1.project_id=TRGT.row_id
and SRC1.sourceinstance=TRGT.source_id
where coalesce(CONVERT_TZ(SRC4.ACT_START_DATE,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')
<>coalesce(TRGT.ACTUAL_START_ON,'');