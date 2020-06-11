


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_component.created_by' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.projects_component_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_project_component TRGT 
 ON (concat(SRC.id, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

 WHERE COALESCE(SRC.creator,'' )<> COALESCE(TRGT.created_by ,'')
