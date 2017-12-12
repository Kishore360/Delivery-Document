SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.project_contact_type_src_key' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.pm_project_task_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_project TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON ( concat('PROJECT~','contact_type~','~',contact_type) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.contact_type IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.project_contact_type_src_key ,'')
