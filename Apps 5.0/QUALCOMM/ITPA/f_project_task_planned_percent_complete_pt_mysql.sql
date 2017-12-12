SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.planned_percent_complete' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.pm_project_task_final SRC 
JOIN (select source_id , max(lastupdated) refresh_date from #DWH_TABLE_SCHEMA.d_o_data_freshness group by 1) FR
ON FR.source_id = SRC.sourceinstance
JOIN app_test.project_task_day_count DC
ON(DC.row_id=SRC.sys_id)
LEFT JOIN #DWH_TABLE_SCHEMA.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE CONVERT( CASE WHEN  convert_tz(FR.refresh_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')< SRC.start_date THEN 0
      WHEN convert_tz(FR.refresh_date,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>') > SRC.end_date    THEN 1
      ELSE  ROUND((DC.cal_day_count / (TIMESTAMPDIFF(hour,'1970-01-01 00:00:00', SRC.duration)/24) ),4)
 END
 ,decimal(28,10))<> COALESCE(CONVERT(TRGT.planned_percent_complete using utf8),'')
 
