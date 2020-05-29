SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project.week_day_count' ELSE 'SUCCESS' END as Message
FROM (select * from    #MDS_TABLE_SCHEMA.hp_pm_projects_final SRC where cdctype <> 'D') SRC
left join    #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final SRC2
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
LEFT JOIN  (select * from #MDS_TABLE_SCHEMA.hp_pm_work_plans_final where entity_type='WORK_PLAN')SRC5
on SRC.PROJECT_ID = SRC5.PROJECT_ID
and SRC.sourceinstance =SRC5.sourceinstance
LEFT JOIN     #MDS_TABLE_SCHEMA.hp_wp_tasks_final SRC6
on SRC5.ROOT_TASK_ID = SRC6.TASK_ID 
and SRC5.sourceinstance = SRC6.sourceinstance
LEFT JOIN    #MDS_TABLE_SCHEMA.hp_wp_task_actuals_final SRC7
on SRC6.TASK_ACTUALS_ID = SRC7.ACTUALS_ID
and SRC6.sourceinstance = SRC7.sourceinstance
LEFT JOIN    #MDS_TABLE_SCHEMA.hp_fm_benefit_period_sum_final SRC8
on SRC3.BENEFIT_ID = SRC8.BENEFIT_ID 
and SRC3.sourceinstance = SRC8.sourceinstance
and SRC8.PERIOD_ID = -1
LEFT JOIN    #MDS_TABLE_SCHEMA.hp_ppm_fiscal_periods_nls_final SRC9
on SRC.FINISH_DATE_PERIOD=SRC9.FISCAL_PERIOD_ID
and SRC.sourceinstance=SRC9.sourceinstance
LEFT JOIN    #MDS_TABLE_SCHEMA.hp_kcrt_requests_final SRC10
on SRC.PFM_REQUEST_ID = SRC10.REQUEST_ID 
and SRC.sourceinstance = SRC10.sourceinstance
left join(select * from #DWH_TABLE_SCHEMA.f_project)TRGT
on TRGT.row_id = SRC.project_id 
and TRGT.source_id = SRC.sourceinstance
left join
(select count(*) as weekdaycount,TRGT1.row_id, TRGT1.week_day_count
 from (select * from #DWH_TABLE_SCHEMA.f_project)TRGT1
LEFT JOIN (
 select source_id,max(lastupdated) as refresh from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) df 
  ON (TRGT1.source_id = df.source_id )
inner join(select * from #DWH_TABLE_SCHEMA.d_calendar_date)LKP
on LKP.calendar_date between (CASE WHEN DATE_FORMAT(COALESCE(TRGT1.actual_start_on,TRGT1.planned_start_on), '%H-%i-%s') < '17-00-00' THEN 
  CAST(COALESCE(TRGT1.actual_start_on,TRGT1.planned_start_on) AS DATE)
 ELSE 
  CAST(DATE_ADD(COALESCE(TRGT1.actual_start_on,TRGT1.planned_start_on), INTERVAL 1 DAY) AS DATE) 
 END ) and df.refresh
and LKP.week_day_flag = 'Y' AND LKP.calendar_code = 0
group by TRGT1.row_key)SRC10
on TRGT.row_id=SRC10.row_id
WHERE COALESCE(SRC10.weekdaycount,0)<>COALESCE(TRGT.week_day_count,0)

 




