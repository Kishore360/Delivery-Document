SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.is_in_schedule' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.pm_project_task_final WHERE CDCTYPE<>'D') SRC 
  join #DWH_TABLE_SCHEMA.d_o_data_freshness b 
   on (
        SRC.sourceinstance = b.source_id 
    and b.lastupdated = (select max(d.lastupdated) from #DWH_TABLE_SCHEMA.d_o_data_freshness d where d.source_id = SRC.sourceinstance)
      )
 LEFT JOIN #DWH_TABLE_SCHEMA.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM
 ON (LM.src_key=TRGT.project_state_src_key)
WHERE CASE WHEN TRGT.planned_duration = 0 AND TRGT.actual_duration = 0 THEN 'Y'
							WHEN TRGT.planned_duration = 0 AND TRGT.actual_duration > 0 THEN 'N'
							WHEN LM.dimension_wh_code IN ('CLOSED') AND (TRGT.actual_duration - TRGT.planned_duration) > 0 THEN 'N'
							WHEN LM.dimension_wh_code NOT IN ('CLOSED') AND TRGT.week_day_count - (TRGT.actual_percent_complete * TRGT.planned_duration) > 0 THEN 'N' 
							ELSE 'Y' 
                        END
<> COALESCE(TRGT.is_in_schedule ,'')
