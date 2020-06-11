SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_project.ACTUAL_PERCENT_COMPLETE' ELSE 'SUCCESS' END as Message
from (select *from  #MDS_TABLE_SCHEMA.hp_pm_projects_final WHERE cdctype <> 'D') SRC1

left join #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final SRC6
on SRC1.PROJECT_ID = SRC6.PRJ_PROJECT_ID and SRC1.sourceinstance = SRC6.sourceinstance
left join (select * from #MDS_TABLE_SCHEMA.hp_rsc_staffing_profiles_final where is_active_flag='Y')SRC5
on SRC5.STAFFING_PROFILE_ID=SRC6.PRJ_STAFF_PROF_ID and SRC5.sourceinstance=SRC6.sourceinstance
LEFT JOIN (select * from #MDS_TABLE_SCHEMA.hp_pm_work_plans_final where entity_type='WORK_PLAN')SRC2 
ON SRC1.PROJECT_ID=SRC2.PROJECT_ID 
AND SRC1.sourceinstance=SRC2.sourceinstance 
LEFT JOIN
#MDS_TABLE_SCHEMA.hp_wp_tasks_final SRC3 
ON SRC2.ROOT_TASK_ID=SRC3.TASK_ID 
AND SRC2.sourceinstance=SRC3.sourceinstance  
LEFT JOIN
#MDS_TABLE_SCHEMA.hp_wp_task_actuals_final SRC4 
ON SRC3.TASK_ACTUALS_ID=SRC4.ACTUALS_ID 
AND SRC3.sourceinstance=SRC4.sourceinstance 
left join #DWH_TABLE_SCHEMA.f_project TRGT
on SRC1.project_id=TRGT.row_id
and SRC1.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC4.PERC_COMPLETE/100,0)
<> COALESCE(TRGT.ACTUAL_PERCENT_COMPLETE,'');