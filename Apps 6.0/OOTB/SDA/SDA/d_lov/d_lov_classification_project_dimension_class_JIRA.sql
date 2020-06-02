SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov_classification_project.dimension_class' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.projecttype_final where `key` is not null 
and `key` <> ''
group by `key`,sourceinstance) SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov TRGT 
ON  ((CONCAT('CLASSIFICATION~PROJECT~',(SRC.`key`)))=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id)
WHERE  COALESCE('CLASSIFICATION~PROJECT','')<>COALESCE(TRGT.dimension_class,'');