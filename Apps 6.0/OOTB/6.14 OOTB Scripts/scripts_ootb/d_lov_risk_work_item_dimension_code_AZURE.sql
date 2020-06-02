SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov_risk_work_item_work_item.dimension_code' ELSE 'SUCCESS' END as Message
FROM (select max(msvsts_common_risk) as msvsts_common_risk,sourceinstance from #STG_TABLE_SCHEMA.workitem_temp_azure where msvsts_common_risk is not null 
and msvsts_common_risk <> ''
group by msvsts_common_risk,sourceinstance) SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov TRGT 
ON  ((CONCAT('RISK~WORK_ITEM~',(SRC.msvsts_common_risk)))=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(SRC.msvsts_common_risk,'')<>COALESCE(TRGT.dimension_code,'')