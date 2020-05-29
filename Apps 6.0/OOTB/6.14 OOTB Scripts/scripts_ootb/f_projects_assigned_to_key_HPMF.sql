SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_project.assigned_to_key' ELSE 'SUCCESS' END as Message
from (select  * from #MDS_TABLE_SCHEMA.hp_pm_projects_final SRC where cdctype <> 'D' ) SRC
left join #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final SRC2
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
LEFT JOIN  #MDS_TABLE_SCHEMA.hp_wp_tasks_final SRC6
on SRC5.ROOT_TASK_ID = SRC6.TASK_ID 
and SRC5.sourceinstance = SRC6.sourceinstance
LEFT JOIN #MDS_TABLE_SCHEMA.hp_wp_task_actuals_final SRC7
on SRC6.TASK_ACTUALS_ID = SRC7.ACTUALS_ID
and SRC6.sourceinstance = SRC7.sourceinstance
LEFT JOIN #MDS_TABLE_SCHEMA.hp_fm_benefit_period_sum_final SRC8
on SRC3.BENEFIT_ID = SRC8.BENEFIT_ID 
and SRC3.sourceinstance = SRC8.sourceinstance
and SRC8.PERIOD_ID = -1
LEFT JOIN #MDS_TABLE_SCHEMA.hp_ppm_fiscal_periods_nls_final SRC9
on SRC.FINISH_DATE_PERIOD=SRC9.FISCAL_PERIOD_ID
and SRC.sourceinstance=SRC9.sourceinstance
LEFT JOIN #MDS_TABLE_SCHEMA.hp_kcrt_requests_final SRC10
on SRC.PFM_REQUEST_ID = SRC10.REQUEST_ID 
and SRC.sourceinstance = SRC10.sourceinstance
left join #DWH_TABLE_SCHEMA.f_project TRGT
on TRGT.row_id = SRC.project_id 
and TRGT.source_id = SRC.sourceinstance


where  0
<> COALESCE(TRGT.assigned_to_key,'');
