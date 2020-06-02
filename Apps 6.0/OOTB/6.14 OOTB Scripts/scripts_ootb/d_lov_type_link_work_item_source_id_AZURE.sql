SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov_type_link_work_item.source_id' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.azure_azure_workitemtypes_final where id is not null and id <> '') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov TRGT 
ON  ((CONCAT('TYPE_LINK_PRECEDENCE~WORK_ITEM~',(SRC.id)))=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id)
WHERE  COALESCE(SRC.sourceinstance,'')<>COALESCE(TRGT.source_id,'') 