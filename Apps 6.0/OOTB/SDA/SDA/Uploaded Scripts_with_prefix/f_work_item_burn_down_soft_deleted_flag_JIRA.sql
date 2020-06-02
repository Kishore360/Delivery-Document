SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_burn_down.soft_deleted_flag' ELSE 'SUCCESS' END as Message
FROM #STG_TABLE_SCHEMA.burn_down_temp SRC
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_burn_down TRGT 
 ON (SRC.sys_id = TRGT.row_id 
 AND SRC.source_id=TRGT.source_id)
 
WHERE TRGT.soft_deleted_flag = 'N' and COALESCE(SRC.soft_deleted_flag,'')<> COALESCE(TRGT.soft_deleted_flag,'');