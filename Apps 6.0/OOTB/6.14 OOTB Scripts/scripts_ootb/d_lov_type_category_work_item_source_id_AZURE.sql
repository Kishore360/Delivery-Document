SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov_type_category_work_item.source_id' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.azure_azure_workItemTypeCategories_final_final where referenceName is not null 
and referenceName <> ''
group by referenceName,sourceinstance) SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov TRGT 
ON  ((CONCAT('TYPE_CATEGORY~WORK_ITEM~',(SRC.referenceName)))=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(SRC.sourceinstance,'')<>COALESCE(TRGT.source_id,'') 