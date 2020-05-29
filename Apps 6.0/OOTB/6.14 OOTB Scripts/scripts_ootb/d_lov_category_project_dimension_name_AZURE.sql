SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov_category_project.dimension_name' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.azure_project_final where visibility is not null 
and visibility <> ''
group by visibility,sourceinstance) SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov TRGT 
ON  ((CONCAT('CATEGORY~PROJECT~',(SRC.visibility)))=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id)
WHERE  COALESCE(SRC.visibility,'')<>COALESCE(TRGT.dimension_name,'') 