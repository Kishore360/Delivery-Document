SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.project_status_color_src_key' ELSE 'SUCCESS' END as Message
 FROM (select * from #MDS_TABLE_SCHEMA.pm_project_task_final where CDCTYPE <> 'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_project TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON ( concat('PROJECT~','STATUS~',SRC.status) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.status IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.project_status_color_src_key ,'')
