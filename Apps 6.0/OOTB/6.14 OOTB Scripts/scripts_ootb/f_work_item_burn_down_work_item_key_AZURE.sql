SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_burn_down.work_item_key' ELSE 'SUCCESS' END as Message
FROM #STG_TABLE_SCHEMA.burn_down_temp_azure SRC
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_burn_down TRGT 
 ON (SRC.sys_id = TRGT.row_id 
 AND SRC.source_id=TRGT.source_id)

 WHERE TRGT.soft_deleted_flag = 'N' and COALESCE(SRC.work_item_key, -1)<> COALESCE(TRGT.work_item_key,'');