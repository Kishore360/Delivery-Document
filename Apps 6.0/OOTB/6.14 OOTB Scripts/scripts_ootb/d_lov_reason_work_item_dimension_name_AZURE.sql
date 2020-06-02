SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov_reason_work_item.dimension_name' ELSE 'SUCCESS' END as Message
FROM (select max(reason) as reason,sourceinstance from #STG_TABLE_SCHEMA.workitem_temp_azure where reason is not null 
and reason <> ''
group by reason,sourceinstance) SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov TRGT 
ON  ((CONCAT('REASON~WORK_ITEM~',(SRC.reason)))=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(SRC.reason,'')<>COALESCE(TRGT.dimension_name,'')