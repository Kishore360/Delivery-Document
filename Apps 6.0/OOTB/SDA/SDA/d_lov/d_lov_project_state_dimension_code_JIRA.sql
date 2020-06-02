SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov_project_state.dimension_code' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.project_category where state is not null 
and state <> ''
group by state,sourceinstance) SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov TRGT 
ON  ((CONCAT('PROJECT~STATE~',(SRC.state)))=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id)
WHERE  COALESCE(SRC.state,'')<>COALESCE(TRGT.dimension_code,'') 