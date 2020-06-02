SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov_category_project.row_id' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.projectcategory_final where id is not null 
and id <> ''
group by id,sourceinstance) SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov TRGT 
ON  ((CONCAT('CATEGORY~PROJECT~',(SRC.id)))=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id)
WHERE  COALESCE(CONCAT('CATEGORY~PROJECT~',(SRC.id)),'')<>COALESCE(TRGT.row_id,'') 