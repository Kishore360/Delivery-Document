SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.created_by' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.azure_project_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_project TRGT 
 ON  (SRC.__numerify__primary_key =TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
 WHERE COALESCE(TRGT.created_by,'')<> COALESCE(null,'');