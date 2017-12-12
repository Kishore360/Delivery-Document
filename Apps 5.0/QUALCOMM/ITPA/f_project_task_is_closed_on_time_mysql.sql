SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.is_closed_on_time' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.pm_project_final SRC
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM
 ON(SRC.state=LM.dimension_code    
 AND SRC.sourceinstance=LM.source_id
 AND LM.dimension_class='PROJECT' AND LM.dimension_type='STATE' )
 LEFT JOIN #DWH_TABLE_SCHEMA.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE case when (LM.dimension_wh_code='CLOSED' AND SRC.work_end <= SRC.end_date) THEN 'Y' ELSE 'N' end 
 <> COALESCE(TRGT.is_closed_on_time ,'')