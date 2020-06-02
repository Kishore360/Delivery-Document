SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.actual_end_on' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.pm_project_final WHERE CDCTYPE<>'D') SRC 
 /*JOIN  app_test.lsm_ls_source_timezone L 
ON (SRC.sourceinstance   = L.sourceid )
*/
JOIN (select source_id , max(lastupdated) refresh_date from #DWH_TABLE_SCHEMA.d_o_data_freshness group by 1) FR
ON FR.source_id = SRC.sourceinstance

LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM
on (LM.dimension_class ='PROJECT~STATE'
and LM.dimension_code=SRC.state
and LM.source_id=SRC.sourceinstance)

LEFT JOIN #DWH_TABLE_SCHEMA.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 
 WHERE COALESCE( 
 CASE WHEN LM.dimension_wh_code='IN PROGRESS' and (cast(TRGT.planned_start_on as date)=cast(FR.refresh_date as date) and cast(TRGT.planned_start_on as time)> '17:00:00') then convert_tz(SRC.work_end,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')
 WHEN LM.dimension_wh_code='IN PROGRESS' and (cast(TRGT.actual_start_on as date)=cast(FR.refresh_date as date) and cast(TRGT.actual_start_on as time)> '17:00:00') then convert_tz(SRC.work_end,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')
 WHEN LM.dimension_wh_code='IN PROGRESS' and (cast(TRGT.planned_start_on as date)>cast(FR.refresh_date as date) or cast(TRGT.actual_start_on as date)>cast(FR.refresh_date as date)) then convert_tz(SRC.work_end,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')
 WHEN LM.dimension_wh_code='IN PROGRESS' then FR.refresh_date
 ELSE convert_tz(SRC.work_end,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') END,'')
 <>COALESCE(TRGT.actual_end_on ,'');