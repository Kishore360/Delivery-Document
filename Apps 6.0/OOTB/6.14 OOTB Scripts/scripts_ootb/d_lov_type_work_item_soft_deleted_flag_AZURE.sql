SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov_type_work_item.soft_deleted_flag' ELSE 'SUCCESS' END as Message
FROM (select * from #STG_TABLE_SCHEMA.workitem_temp_azure where workItemType is not null 
and workItemType <> ''
group by workItemType,sourceinstance) SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov TRGT 
ON  ((CONCAT('TYPE~WORK_ITEM~',(SRC.workItemType)))=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id)
WHERE coalesce(case when SRC.cdctype = 'D' then 'Y' else 'N' end, '')<>coalesce(TRGT.soft_deleted_flag,'')