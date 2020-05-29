SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov_link_type_work_item.row_id' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.azure_workitem_relation_type_final where referenceName is not null 
and referenceName <> ''
group by referenceName,sourceinstance) SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov TRGT 
ON  ((CONCAT('LINK_TYPE~WORK_ITEM~',(SRC.referenceName)))=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id)
WHERE  COALESCE(CONCAT('LINK_TYPE~WORK_ITEM~',(SRC.referenceName)),'')<>COALESCE(TRGT.row_id,'') 