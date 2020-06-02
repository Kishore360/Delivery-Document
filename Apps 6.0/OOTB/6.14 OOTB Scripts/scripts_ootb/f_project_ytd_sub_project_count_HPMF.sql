SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project.ytd_sub_project_count' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.hp_pm_projects_final SRC WHERE cdctype <> 'D') SRC
left join  #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final SRC2
on SRC.PROJECT_ID = SRC2.PRJ_PROJECT_ID
and SRC.sourceinstance = SRC2.sourceinstance 
left join (select * from #MDS_TABLE_SCHEMA.hp_rsc_staffing_profiles_final where is_active_flag='Y')SRC11
on SRC11.STAFFING_PROFILE_ID=SRC2.PRJ_STAFF_PROF_ID and SRC11.sourceinstance=SRC2.sourceinstance
LEFT JOIN
 #MDS_TABLE_SCHEMA.hp_fm_financial_summary_final SRC3 
ON SRC2.PRJ_FINANCIAL_SUMMARY_ID=SRC3.FINANCIAL_SUMMARY_ID 
AND SRC2.sourceinstance=SRC3.sourceinstance 
LEFT JOIN
 #MDS_TABLE_SCHEMA.hp_fm_forecast_actual_period_sum_final SRC4 
 ON SRC3.FORECAST_ACTUAL_ID=SRC4.FORECAST_ACTUAL_ID 
AND SRC3.sourceinstance=SRC4.sourceinstance and SRC4.PERIOD_ID=-1
LEFT JOIN (select * from #MDS_TABLE_SCHEMA.hp_pm_work_plans_final where entity_type='WORK_PLAN')SRC5
on SRC.PROJECT_ID = SRC5.PROJECT_ID
and SRC.sourceinstance =SRC5.sourceinstance
LEFT JOIN   #MDS_TABLE_SCHEMA.hp_wp_tasks_final SRC6
on SRC5.ROOT_TASK_ID = SRC6.TASK_ID 
and SRC5.sourceinstance = SRC6.sourceinstance
LEFT JOIN  #MDS_TABLE_SCHEMA.hp_wp_task_actuals_final SRC7
on SRC6.TASK_ACTUALS_ID = SRC7.ACTUALS_ID
and SRC6.sourceinstance = SRC7.sourceinstance
left join  (select * from #DWH_TABLE_SCHEMA.f_project) TRGT
on TRGT.row_id = SRC.project_id 
and TRGT.source_id = SRC.sourceinstance
left join(select  count(row_id) as sub_project_count,row_id from #DWH_TABLE_SCHEMA.d_project where is_ytd_flag='Y' and  top_project_key<>row_key group by top_project_key)LKP
on TRGT.row_id=LKP.row_id
WHERE round(COALESCE(LKP.sub_project_count,'0'),7)<>round(COALESCE(TRGT.ytd_sub_project_count,'0'),7);

 