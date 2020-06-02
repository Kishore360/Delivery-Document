SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.project_state_src_key' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.azure_project_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_project TRGT 
 ON  (SRC.__numerify__primary_key =TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON (CONCAT('PROJECT~STATE~',UPPER(SRC.state)) = LKP.row_id 
 AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.project_state_src_key,'')
 
 
