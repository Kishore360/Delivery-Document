SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.is_in_schedule_flag' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.pm_project_final WHERE CDCTYPE<>'D') SRC 
  join #DWH_TABLE_SCHEMA.d_o_data_freshness b 
   on (
        SRC.sourceinstance = b.source_id 
    and b.lastupdated = (select max(d.lastupdated) from #DWH_TABLE_SCHEMA.d_o_data_freshness d where d.source_id = SRC.sourceinstance)
      )
    LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM
 ON(SRC.state=LM.dimension_code
 AND SRC.sourceinstance=LM.source_id
 AND LM.dimension_class='PROJECT~STATE' )    
	  
 LEFT JOIN #DWH_TABLE_SCHEMA.f_project_task F 
 ON (SRC.sys_id=F.row_id 
 AND SRC.sourceinstance=F.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_project TRGT
 on (TRGT.row_key = F.project_key
and TRGT.source_id = F.source_id)
WHERE CASE WHEN F.planned_duration = 0 AND F.actual_duration = 0 THEN 'Y'
							WHEN F.planned_duration = 0 AND F.actual_duration > 0 THEN 'N'
							WHEN LM.dimension_wh_code IN ('CLOSED') AND (F.actual_duration - F.planned_duration) > 0 THEN 'N'
							WHEN LM.dimension_wh_code NOT IN ('CLOSED') AND F.week_day_count - (F.actual_percent_complete * F.planned_duration) > 0 THEN 'N' 
							ELSE 'Y' 
                        END
<> COALESCE(TRGT.is_in_schedule_flag ,'')



