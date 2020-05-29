
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.is_active_flag' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.pm_project_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map dlm 
 ON TRGT.project_state_src_key = dlm.src_key and dlm.source_id=TRGT.source_id
 WHERE COALESCE(case when SRC.active = 1 and dlm.dimension_wh_code IN ('IN PROGRESS') then 'Y' when SRC.active = 0 then 'N' else 'N' end,'')  
 <> COALESCE(TRGT.is_active_flag ,'')
