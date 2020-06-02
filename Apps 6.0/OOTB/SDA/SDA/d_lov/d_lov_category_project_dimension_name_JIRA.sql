SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov_category_project.dimension_name' ELSE 'SUCCESS' END as Message
FROM (select * from sda_611_mdsdb.projectcategory_final where id is not null 
and id <> ''
group by id,sourceinstance) SRC 
LEFT JOIN sda_611_mdwdb.d_lov TRGT 
ON  ((CONCAT('CATEGORY~PROJECT~',(SRC.id)))=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id)
WHERE  COALESCE(SRC.name,'')<>COALESCE(TRGT.dimension_name,'') 