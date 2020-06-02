
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.is_active' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.pm_project_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON ( concat('PROJECT~STATE~',SRC.state) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map DLM 
 ON ( LKP.row_key =DLM.src_key
AND LKP.source_id= DLM.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE CASE WHEN DLM.dimension_wh_code IN ('IN PROGRESS') THEN 'Y' ELSE 'N' END  <> COALESCE(TRGT.is_active ,'')
