SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov_priority_work_item_work_item.source_id' ELSE 'SUCCESS' END as Message
FROM (select * from #STG_TABLE_SCHEMA.workitem_temp_azure where msvsts_common_priority is not null 
and msvsts_common_priority <> ''
group by msvsts_common_priority,sourceinstance) SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov TRGT 
ON  ((CONCAT('PRIORITY~WORK_ITEM~',(SRC.msvsts_common_priority)))=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(sourceinstance,'')<>COALESCE(TRGT.source_id,'')