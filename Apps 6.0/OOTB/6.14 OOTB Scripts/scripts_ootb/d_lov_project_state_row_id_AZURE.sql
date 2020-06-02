SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov_project_state.row_id' ELSE 'SUCCESS' END as Message
FROM (select distinct state,sourceinstance from #MDS_TABLE_SCHEMA.azure_project_final where state is not null 
and state <> '') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov TRGT 
ON  ((CONCAT('PROJECT~STATE~',(SRC.state)))=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id)
WHERE  COALESCE(CONCAT('PROJECT~STATE~',(SRC.state)),'')<>COALESCE(TRGT.row_id,'') 